int gasPin = A3;   // Analog pin for gas sensor
int gasValue = 0;  // Variable to store sensor reading

void setup() {
  Serial.begin(9600);   // Start serial communication
  pinMode(gasPin, INPUT);
}

void loop() {
  gasValue = analogRead(gasPin);   // Read sensor value (0 - 1023)

  Serial.print("Gas Sensor Value: ");
  Serial.println(gasValue);

  // Simple condition to indicate HIGH gas level
  if (gasValue > 400) {    // Threshold depends on sensor/environment
    Serial.println("Gas Leakage Detected!");
  } else {
    Serial.println("Air Quality Normal");
  }

  delay(1000);  // Read every 1 second
}