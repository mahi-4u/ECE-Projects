// PIR Motion Detection with LCD Display
// Author: Mahesh
// PIR connected to Digital Pin 5
// LED connected to Digital Pin 10
// LCD I2C Address: 0x27 (Change to 0x3F if needed)

#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// Pin Definitions
const int pirPin = 5;
const int ledPin = 10;

// LCD Setup (16x2 Display)
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Variables
int pirState = LOW;
int lastPirState = LOW;

void setup() {
  pinMode(pirPin, INPUT);
  pinMode(ledPin, OUTPUT);

  Serial.begin(9600);

  lcd.init();
  lcd.backlight();

  lcd.setCursor(0, 0);
  lcd.print("PIR System Ready");
  lcd.setCursor(0, 1);
  lcd.print("Monitoring...");
}

void loop() {

  pirState = digitalRead(pirPin);

  // Motion Detected
  if (pirState == HIGH && lastPirState == LOW) {

    digitalWrite(ledPin, HIGH);
    Serial.println("Motion Detected!");

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Motion Detected!");
    lcd.setCursor(0, 1);
    lcd.print("Time: ");
    lcd.print(millis() / 1000);
    lcd.print(" sec");

    lastPirState = HIGH;
  }

  // Motion Ended
  else if (pirState == LOW && lastPirState == HIGH) {

    digitalWrite(ledPin, LOW);
    Serial.println("No Motion");

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("No Motion");
    lcd.setCursor(0, 1);
    lcd.print("System Normal");

    lastPirState = LOW;
  }

  delay(200);   // Small delay for PIR stability
}
