#include <Wire.h>
#include <LiquidCrystal_I2C.h>

const int pirPin = 5;     // PIR output pin
const int ledPin = 10;    // LED indicator pin

LiquidCrystal_I2C lcd(0x27, 16, 2);

int pirState = LOW;
int lastState = LOW;

void setup() {
  pinMode(pirPin, INPUT);
  pinMode(ledPin, OUTPUT);

  Serial.begin(9600);

  lcd.init();
  lcd.backlight();

  lcd.setCursor(0, 0);
  lcd.print("PIR Sensor Ready");
  lcd.setCursor(0, 1);
  lcd.print("Monitoring...");
}

void loop() {
  pirState = digitalRead(pirPin);

  if (pirState != lastState) {

    lcd.clear();

    if (pirState == HIGH) {
      digitalWrite(ledPin, HIGH);
      Serial.println("Motion Detected!");

      lcd.setCursor(0, 0);
      lcd.print("Motion Detected!");
      lcd.setCursor(0, 1);
      lcd.print("Time: ");
      lcd.print(millis() / 1000);
      lcd.print("s");

    } else {
      digitalWrite(ledPin, LOW);
      Serial.println("No Motion");

      lcd.setCursor(0, 0);
      lcd.print("No Motion");
      lcd.setCursor(0, 1);
      lcd.print("Status Normal");
    }

    lastState = pirState;
  }

  delay(200);
}
