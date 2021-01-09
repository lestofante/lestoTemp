#ifdef ESP32
  #include <WiFi.h>
#else
  #include <ESP8266WiFi.h>
#endif

#include <ESPmDNS.h>
#include <WiFiUdp.h>
#include <ArduinoOTA.h>

////// USER CONFIGURATION
#define USE_DHT
//#define USE_BMP // lestoTemp V1.0 WILL NOT WORK, SPI IS CONNECTED WRONG

constexpr char* ssid = "XXXX";
constexpr char* password = "XXXX";
constexpr char* host = "XXX.XXX.XXX.XXX";
constexpr int port = 4444;

constexpr uint64_t SecondsPerReading = 60; //1 read every 60 seconds
constexpr uint32_t ReadingPerTransmission = 60; //60 reading before transmission; with SecondsPerReading = 60 means transmit every hour
constexpr uint32_t ReadingBufferMultiplier = 3; // how many times the buffer has to be bigger. This is basically the number of consecutive failed upload before loosing data
constexpr uint32_t TimeoutConnectionMs = 5000;
////// END USER CONFIGURATION

constexpr uint32_t uS_TO_S_FACTOR = 1000000;

constexpr uint8_t R2 = 33;
constexpr uint8_t R3 = 10;
constexpr uint8_t VoltageDividerMultiplier = R3 / (R2 + R3);

static_assert(VoltageDividerMultiplier * 3.7f < 1.0f, "warning, safe voltage overshoot the ADC");


constexpr uint32_t READING_BUFFER_SIZE = ReadingPerTransmission * ReadingBufferMultiplier;
RTC_DATA_ATTR struct Reading{
  uint32_t timestamp_seconds;
  float temperature;
  float humidity;
  float pressure;
}bufferReadings[READING_BUFFER_SIZE];

#ifdef USE_BMP
  #include "bmp.h"
#endif

#ifdef USE_DHT
  #include "dht.h"
#endif

static_assert(SENSOR_SELECTED==1, "you must select a chip to use");


void deep_sleep_timed(bool enableWifiNextBoot){
#ifdef ESP32
  esp_deep_sleep_start();
#else
  pinMode(16, WAKEUP_PULLUP);
  ESP.deepSleep(SecondsPerReading * 1000 * 1000, enableWifiNextBoot ? WAKE_RF_DEFAULT : WAKE_RF_DISABLED);
#endif
}

uint16_t readBatteryRaw(){

  //enable GPIO and MOSFET
  pinMode(14, OUTPUT);
  digitalWrite(14, HIGH);
  
  //make 2 read to flush the adc HW
  analogRead(A0); // max input range 0-1v

  uint16_t raw_voltage = analogRead(A0);

  //disable the MOSFET and GPIO
  digitalWrite(14, LOW);
  pinMode(14, INPUT);
  
  return raw_voltage;
}

bool transmit_readings(uint8_t numbers){

  bool transmitted = false;
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  const uint32_t connection_start = millis();
  
  while (WiFi.status() != WL_CONNECTED && (millis() - connection_start < TimeoutConnectionMs)) {
    delay(1);
  }

  if (WiFi.status() == WL_CONNECTED) {
    WiFiClient tcpClient;
    tcpClient.setTimeout(TimeoutConnectionMs);
    
    if (tcpClient.connect(host, port)) {
      const float battery = 0;//(readBatteryRaw() * VoltageDividerMultiplier) / 1024.0f;
      tcpClient.write(reinterpret_cast<const uint8_t*>(&battery), sizeof(battery));
    
      tcpClient.write(reinterpret_cast<const uint8_t*>(bufferReadings), sizeof(struct Reading) * numbers);

      transmitted = true;
    }
  }
  
  WiFi.disconnect();

  return transmitted;
}

void setup() {
  Serial.begin(115200);

  // Wait for serial to initialize.
  while(!Serial) { }

  Serial.println("STARTED");

#ifdef ESP32
  /*
  First we configure the wake up source
  We set our ESP32 to wake up every 5 seconds
  */
  esp_sleep_enable_timer_wakeup(SecondsPerReading * uS_TO_S_FACTOR);
#endif
}

void loop() {
  RTC_DATA_ATTR static uint32_t counter {0};
  
  //make a read
  Reading r = read_sensor();
  bufferReadings[counter % READING_BUFFER_SIZE] = r;
  Serial.print("readed: ");
  Serial.print(r.temperature);
  Serial.print(" ");
  Serial.println(r.humidity);
  
  counter++;

  if ( (counter % READING_BUFFER_SIZE) == 0){
    // time to transmit thereading and reset the loop counter
    Serial.println("sending data");
    if ( transmit_readings(counter) )
      counter = 0; //reset the counter only if sucessful
  }

  bool enableWifiNextBoot = (counter + 1 >= ReadingPerTransmission);
  //deep_sleep_timed(enableWifiNextBoot);
  delay(2000);
} 
