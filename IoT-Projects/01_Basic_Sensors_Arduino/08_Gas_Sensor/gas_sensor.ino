// Gas Sensor Monitoring using Arduino
// Author: Mahesh
// MQ Gas Sensor connected to Analog Pin A3

// Pin Definitions
const int gasPin = A3;

// Variables
int gasValue = 0;
int threshold = 400;   // Adjust based on calibration

void setup() {

  pinMode(gasPin, INPUT);
  Serial.begin(9600);

  Serial.println("Gas Sensor Ready...");
}

void loop() {

  // Read gas sensor value
  gasValue = analogRead(gasPin);

  // Display gas value
  Serial.print("Gas Sensor Value: ");
  Serial.println(gasValue);

  // Check gas level condition
  if (gasValue > threshold) {

    Serial.println("Gas Leakage Detected!");

  } else {

    Serial.println("Air Quality Normal");
  }

  delay(1000);   // Wait 1 second before next reading
}
