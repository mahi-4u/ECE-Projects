#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// PIR + LED setup
const int pirPin = 5;   // PIR sensor output
const int ledPin = 10;  // LED indicator

// LCD at address 0x27 or 0x3F (depends on module) - 16x2 display
LiquidCrystal_I2C lcd(0x27, 16, 2);

int pirState = LOW;
int lastPirState = LOW;

void setup() {
  pinMode(pirPin, INPUT);
  pinMode(ledPin, OUTPUT);

  Serial.begin(9600);

  lcd.init();           // Initialize the LCD
  lcd.backlight();      // Turn ON backlight
  
  lcd.setCursor(0, 0);
  lcd.print("PIR Sensor Ready");
  lcd.setCursor(0, 1);
  lcd.print("Waiting...");
}

void loop() {
  pirState = digitalRead(pirPin);

  if (pirState == HIGH && lastPirState == LOW) {
    // Motion detected
    digitalWrite(ledPin, HIGH);
    Serial.println("Motion detected");

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Motion Detected!");
    lcd.setCursor(0, 1);
    lcd.print("Time: ");
    lcd.print(millis() / 1000);
    lcd.print("s");

    lastPirState = HIGH;

  } else if (pirState == LOW && lastPirState == HIGH) {
    // Motion ended
    digitalWrite(ledPin, LOW);
    Serial.println("No motion");

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("No Motion");
    lcd.setCursor(0, 1);
    lcd.print("Status OK");

    lastPirState = LOW;
  }

  delay(500); // stabilize PIR reading
}