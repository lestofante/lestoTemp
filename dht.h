#define SENSOR_SELECTED 1
//#include <DHT.h>

constexpr int DHT_PIN = 12; //GPIO12

//DHT dht(DHT_PIN, DHT11);

constexpr uint32_t ISR_ELEMENTS = 85;

struct {
  volatile uint32_t index;
  volatile uint32_t timigs[ISR_ELEMENTS];
} isr_data = {0};


void IRAM_ATTR ICACHE_RAM_ATTR read_dht(){
  if (isr_data.index < ISR_ELEMENTS) {
    isr_data.timigs[isr_data.index++] = micros();
  }
}

Reading read_sensor(){
  pinMode(DHT_PIN, OUTPUT);
  digitalWrite(DHT_PIN, HIGH);
  delay(1);
  
  // First set data line low for a period according to sensor type
  digitalWrite(DHT_PIN, LOW);
  delay(20); // data sheet says at least 18ms, 20ms just to be safe
  
  // End the start signal by setting data line high for 40 microseconds.
  pinMode(DHT_PIN, INPUT_PULLUP);

  attachInterrupt(digitalPinToInterrupt(DHT_PIN), read_dht, CHANGE);
  isr_data.index = 0;
  
  // Delay a moment to let sensor pull data line low.
  delayMicroseconds(10);
  
  // 3ms is the normal read time
  delay(4);

  if (isr_data.index != 84){
    return {millis() / 1000,0,0};
  }

  uint8_t data[5] = {0,0,0,0,0};
  uint8_t offset = 0;
  uint8_t shift = 7;
  for (uint32_t i = 4; i < isr_data.index; i+=2){
    bool bit = (isr_data.timigs[i] - isr_data.timigs[i-1]) > 50;
    data[offset] |= bit << shift;
    shift--;
    if (shift > 7){
      shift = 7;
      offset++;
    }
  }

  if (data[4] == ((data[0] + data[1] + data[2] + data[3]) & 0xFF)) {
    return {millis() / 1000, data[2], data[0], 0};
  }
  
  return {millis() / 1000, 0,0,0};
}
