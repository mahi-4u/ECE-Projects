//Author:mahesh
#include <DHT.h>

#define DHTPIN 2
#define DHTTYPE DHT11
#define SOIL_PIN A0

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);
  dht.begin();
  Serial.println("SMART IRRIGATION SYSTEM STARTED...");
}

void loop() {
  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature();
  int soilValue = analogRead(SOIL_PIN);
  int moisturePercent = map(soilValue, 1023, 0, 0, 100);

  Serial.println("----------------------------");
  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.println("%");

  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.println("°C");

  Serial.print("Soil Moisture: ");
  Serial.print(moisturePercent);
  Serial.println("%");

  if (moisturePercent < 30) {
    Serial.println("⚠️ Soil Dry → Water Needed");
  } 
  else if (moisturePercent > 70) {
    Serial.println("⚠️ Soil Moisture High → Overwatered!");
  }

  if (humidity > 80) {
    Serial.println("⚠️ High Humidity Alert!");
  }

  if (temperature > 30) {
    Serial.println("⚠️ Temperature High → Overheat Warning!");
  }

  if (moisturePercent > 30 && moisturePercent < 70 &&
      temperature < 30 && humidity < 80) {
    Serial.println("✔️ Environmental Conditions Normal");
  }

  Serial.println("----------------------------\n");
  delay(2000);
}
