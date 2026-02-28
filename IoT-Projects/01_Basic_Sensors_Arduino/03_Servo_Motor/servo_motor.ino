#include <Servo.h>       // Include library to control servo

Servo myServo;           // Create servo object

void setup() {
  myServo.attach(9);     // Connect servo to pin 9
}

void loop() {
  for (int angle = 0; angle <= 180; angle += 45) {
    myServo.write(angle);  // Rotate to 0, 45, 90, 135, 180 degrees
    delay(1000);           // Wait 1 second between movements
  }
}