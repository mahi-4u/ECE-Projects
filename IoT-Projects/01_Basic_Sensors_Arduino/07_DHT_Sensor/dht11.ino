#include <DHT.h>
#include <LiquidCrystal_I2C.h>

#define DHTPIN 2        // DHT11 data pin connected to digital pin 2
#define DHTTYPE DHT11   // Sensor type DHT11

DHT dht(DHTPIN, DHTTYPE);
LiquidCrystal_I2C lcd(0x27, 16, 2);  // LCD address 0x27, 16x2 display

void setup() {
  Serial.begin(9600);
  lcd.begin(16, 2);
  lcd.backlight();
  dht.begin();
  Serial.println("DHT11 Sensor Initialized");
}
void loop() {
  float temp = dht.readTemperature();
  float hum = dht.readHumidity();
  // Check if readings are valid
  if (isnan(temp) || isnan(hum)) {
    Serial.println("Error reading from DHT11!");
    lcd.clear();
    lcd.print("Sensor Error");
    delay(2000);
    return;
  }
  // Print on Serial Monitor
  Serial.print("Temperature: ");
  Serial.print(temp);
  Serial.println(" °C");
  Serial.print("Humidity: ");
  Serial.print(hum);
  Serial.println(" %");

  // Display on LCD
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Temp: ");
  lcd.print(temp);
  lcd.print(" C");

  lcd.setCursor(0, 1);
  lcd.print("Humidity: ");
  lcd.print(hum);
  lcd.print(" %");

  delay(2000); // Wait 2 seconds before next reading
}
