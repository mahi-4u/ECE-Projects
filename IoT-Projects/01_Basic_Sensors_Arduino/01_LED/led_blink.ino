// LED Blinking Program
// Author: Mahesh
// Board: Arduino Uno
// LED connected to Digital Pin 12

int ledPin = 12;

void setup() {
  pinMode(ledPin, OUTPUT);
}

void loop() {
  digitalWrite(ledPin, HIGH);   // Turn LED ON
  delay(1000);                  // Wait 1 second
  digitalWrite(ledPin, LOW);    // Turn LED OFF
  delay(1000);                  // Wait 1 second
}
