int moisturePin = A0; // Soil moisture sensor connected to A0
int ledPin = 11; // LED connected to pin 11
int moistureValue = 0;

void setup() {
Serial.begin(9600);
pinMode(ledPin, OUTPUT);
}

void loop() {
moistureValue = analogRead(moisturePin);
Serial.print("Soil Moisture Value: ");
Serial.println(moistureValue);

// When soil is dry, LED turns ON
if (moistureValue < 500) {
digitalWrite(ledPin, HIGH);
Serial.println("Soil is Dry → LED ON");
}
else {
digitalWrite(ledPin, LOW);
Serial.println("Soil is Wet → LED OFF");
}

delay(1000);
}