// Ultrasonic Distance Measurement using HC-SR04
// Author: Mahesh
// TRIG connected to Digital Pin 3
// ECHO connected to Digital Pin 4

// Pin Definitions
const int trigPin = 3;
const int echoPin = 4;

// Variables
unsigned long duration;
float distanceCm;
float distanceInches;

void setup() {

  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  Serial.begin(9600);

  Serial.println("Ultrasonic Sensor Ready...");
}

void loop() {

  // Ensure TRIG is LOW
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  // Send 10 microsecond pulse to TRIG
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Read echo duration
  duration = pulseIn(echoPin, HIGH);

  // Calculate distance
  distanceCm = duration * 0.034 / 2;
  distanceInches = duration * 0.0133 / 2;

  // Display results
  Serial.print("Distance in cm: ");
  Serial.print(distanceCm);
  Serial.print(" cm | Distance in inches: ");
  Serial.print(distanceInches);
  Serial.println(" inches");

  delay(1000);   // Wait 1 second before next reading
}
