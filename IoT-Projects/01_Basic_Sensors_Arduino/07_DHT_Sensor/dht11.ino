// DHT11 Temperature and Humidity Monitoring with LCD
// Author: Mahesh
// DHT11 Data Pin connected to Digital Pin 2
// LCD I2C Address: 0x27 (Change to 0x3F if needed)

#include <DHT.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// Pin Definitions
#define DHTPIN 2
#define DHTTYPE DHT11

// Object Initialization
DHT dht(DHTPIN, DHTTYPE);
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Variables
float temperature;
float humidity;

void setup() {

  Serial.begin(9600);

  dht.begin();

  lcd.init();
  lcd.backlight();

  Serial.println("DHT11 Sensor Ready...");
}

void loop() {

  // Read temperature and humidity
  temperature = dht.readTemperature();
  humidity = dht.readHumidity();

  // Check if reading failed
  if (isnan(temperature) || isnan(humidity)) {

    Serial.println("Error reading from DHT11!");

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Sensor Error");

    delay(2000);
    return;
  }

  // Print on Serial Monitor
  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.println(" °C");

  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.println(" %");

  // Display on LCD
  lcd.clear();

  lcd.setCursor(0, 0);
  lcd.print("Temp: ");
  lcd.print(temperature);
  lcd.print(" C");

  lcd.setCursor(0, 1);
  lcd.print("Humidity: ");
  lcd.print(humidity);
  lcd.print(" %");

  delay(2000);   // Wait 2 seconds before next reading
}
