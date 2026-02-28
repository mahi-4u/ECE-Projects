// Servo Motor Control using Arduino Uno
// Author: Mahesh
// Servo connected to Digital Pin 9

#include <Servo.h>

Servo myServo;

void setup() {
  myServo.attach(9);   // Attach servo to pin 9
}

void loop() {
  for (int angle = 0; angle <= 180; angle += 45) {
    myServo.write(angle);   // Rotate to specific angle
    delay(1000);            // Wait 1 second
  }
}
