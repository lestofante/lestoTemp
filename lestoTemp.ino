#include <SPI.h>
#include <ESP8266WiFi.h>
#include <WiFiClientSecure.h>

////// USER CONFIGURATION
#define USE_DHT
//#define USE_BMP // V1.0 WILL NOT WORK, SPI IS CONNECTED WRONG

constexpr char* STASSID = "your-ssid";
constexpr char* STAPSK = "your-password";
constexpr char* host = "api.github.com";
constexpr int port = 443;

constexpr uint32_t SecondsPerReading = 10; //1 read every 10 seconds
constexpr uint32_t ReadingPerTransmission = 60 * 6; //60 * 6 reading before transmission; with SecondsPerReading = 10 means transmit every hour

// DigiCert High Assurance EV Root CA
const char trustRoot[] PROGMEM = R"EOF(
-----BEGIN CERTIFICATE-----
MIIDxTCCAq2gAwIBAgIQAqxcJmoLQJuPC3nyrkYldzANBgkqhkiG9w0BAQUFADBs
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSswKQYDVQQDEyJEaWdpQ2VydCBIaWdoIEFzc3VyYW5j
ZSBFViBSb290IENBMB4XDTA2MTExMDAwMDAwMFoXDTMxMTExMDAwMDAwMFowbDEL
MAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3
LmRpZ2ljZXJ0LmNvbTErMCkGA1UEAxMiRGlnaUNlcnQgSGlnaCBBc3N1cmFuY2Ug
RVYgUm9vdCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMbM5XPm
+9S75S0tMqbf5YE/yc0lSbZxKsPVlDRnogocsF9ppkCxxLeyj9CYpKlBWTrT3JTW
PNt0OKRKzE0lgvdKpVMSOO7zSW1xkX5jtqumX8OkhPhPYlG++MXs2ziS4wblCJEM
xChBVfvLWokVfnHoNb9Ncgk9vjo4UFt3MRuNs8ckRZqnrG0AFFoEt7oT61EKmEFB
Ik5lYYeBQVCmeVyJ3hlKV9Uu5l0cUyx+mM0aBhakaHPQNAQTXKFx01p8VdteZOE3
hzBWBOURtCmAEvF5OYiiAhF8J2a3iLd48soKqDirCmTCv2ZdlYTBoSUeh10aUAsg
EsxBu24LUTi4S8sCAwEAAaNjMGEwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQF
MAMBAf8wHQYDVR0OBBYEFLE+w2kD+L9HAdSYJhoIAu9jZCvDMB8GA1UdIwQYMBaA
FLE+w2kD+L9HAdSYJhoIAu9jZCvDMA0GCSqGSIb3DQEBBQUAA4IBAQAcGgaX3Nec
nzyIZgYIVyHbIUf4KmeqvxgydkAQV8GK83rZEWWONfqe/EW1ntlMMUu4kehDLI6z
eM7b41N5cdblIZQB2lWHmiRk9opmzN6cN82oNLFpmyPInngiK3BD41VHMWEZ71jF
hS9OMPagMRYjyOfiZRYzy78aG6A9+MpeizGLYAiJLQwGXFK3xPkKmNEVX58Svnw2
Yzi9RKR/5CYrCsSXaQ3pjOLAEFe4yHYSkVXySGnYvCoCWw9E1CAx2/S6cCZdkGCe
vEsXCS+0yx5DaMkHJ8HSXPfqIbloEpw8nL+e/IBcm2PN7EeqJSdnoDfzAIJ9VNep
+OkuE6N36B9K
-----END CERTIFICATE-----
)EOF";
////// END USER CONFIGURATION

struct Reading{
  float temperature;
  float humidity;
  float pressure;
}bufferReadings[ReadingPerTransmission];

#ifdef USE_BMP
  #define SENSOR_SELECTED 1
  #include <Adafruit_BME280.h>
  
  constexpr int BMP_CS = 10; //cs pin
  
  Adafruit_BME280 bmp(BMP_CS); //SPI

  Reading read_sensor(){
    return {bmp.readTemperature(), bmp.readHumidity(), bmp.readPressure() / 100.0F};
  }
#endif

#ifdef USE_DHT
  #define SENSOR_SELECTED 1
  #include <DHT.h>

  constexpr int DHT_PIN = 2;
  
  DHT dht(DHT_PIN, DHT11);

  Reading read_sensor(){
    return {dht.readTemperature(), dht.readHumidity(), 0};
  }
#endif

static_assert(SENSOR_SELECTED==1, "you must select a chip to use");

WiFiClientSecure client;
X509List cert(trustRoot);

void setup() {
  client.setTrustAnchors(&cert);
}

void transmit_readings(){
  //TSL
  if (!client.connect(host, port)) {
    Serial.println("Connection failed");
    return;
  }
  for (Reading &r : bufferReadings){
    if (!client.available()){
      Serial.println("Connection failed");
      return;
    }
    client.write(reinterpret_cast<const uint8_t*>(&r), sizeof(r));
  }
}

void loop() {
  static uint32_t counter {0};
  
  //make a read
  bufferReadings[counter++] = read_sensor();
  
  if (counter >= ReadingPerTransmission){
    // time to transmit thereading and reset the loop counter
    counter = 0;
    transmit_readings();
  }
  
  bool enableWifiNextBoot = (counter + 1 >= ReadingPerTransmission);
  ESP.deepSleep(SecondsPerReading * 1000, enableWifiNextBoot ? WAKE_RF_DEFAULT : WAKE_RF_DISABLED);
  
} 
