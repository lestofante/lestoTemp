#define SENSOR_SELECTED 1
#include <Adafruit_BME280.h>

constexpr int BMP_CS = 10; //cs pin

Adafruit_BME280 bmp(BMP_CS); //SPI

void init_sensor(){
}

Reading read_sensor(){
  return {bmp.readTemperature(), bmp.readHumidity(), bmp.readPressure() / 100.0F};
}
