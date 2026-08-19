#include <MQ135.h>
#define ANALOGPIN A0
MQ135 gasSensor = MQ135(ANALOGPIN);
 
void setup() {
  Serial.begin(9600);
}
 
void loop() {
  float air_quality = gasSensor.getPPM();
  Serial.println(air_quality);
  delay(2000);
}
