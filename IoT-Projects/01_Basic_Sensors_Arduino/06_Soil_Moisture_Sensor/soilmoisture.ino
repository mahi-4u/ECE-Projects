// Soil Moisture Sensor Monitoring using Arduino
// Author: Mahesh
// Soil Moisture Sensor connected to Analog Pin A0
// LED connected to Digital Pin 11

// Pin Definitions
const int moisturePin = A0;
const int ledPin = 11;

// Variables
int moistureValue = 0;
int threshold = 500;   // Adjust based on calibration

void setup() {

  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);

  Serial.println("Soil Moisture Sensor Ready...");
}

void loop() {

  // Read moisture value
  moistureValue = analogRead(moisturePin);

  // Display moisture value
  Serial.print("Soil Moisture Value: ");
  Serial.println(moistureValue);

  // Check soil condition
  if (moistureValue < threshold) {

    digitalWrite(ledPin, HIGH);
    Serial.println("Soil is Dry → LED ON");

  } else {

    digitalWrite(ledPin, LOW);
    Serial.println("Soil is Wet → LED OFF");
  }

  delay(1000);   // Wait 1 second before next reading
}
