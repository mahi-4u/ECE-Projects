//Author:mahesh
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <Servo.h>
LiquidCrystal_I2C lcd(0x27, 16, 2); // Change to 0x3F if needed
Servo gateServo;
#define entryIR 2
#define exitIR 3
#define MAX_PARKING 5
int carCount = 0;
void setup() {
  pinMode(entryIR, INPUT);
  pinMode(exitIR, INPUT);
  gateServo.attach(9);
  gateServo.write(0); // Gate closed
  lcd.init();
  lcd.backlight();
  showWelcome();   // 👋 Welcome message
  updateLCD();    // 📟 Main display
}
void loop() {
  // 🚗 ENTRY
  if (digitalRead(entryIR) == LOW) {
    if (carCount < MAX_PARKING) {
      carCount++;
      openGate();
    } else {
      showParkingFull();
      return;
    }
    updateLCD();
    delay(1500);
  }
  // 🚙 EXIT
  if (digitalRead(exitIR) == LOW) {
    if (carCount > 0) {
      carCount--;
      openGate();
    }
    updateLCD();
    delay(1500);
  }
}
// 🚪 Servo control
void openGate() {
  gateServo.write(90);
  delay(2500);
  gateServo.write(0);
}
// 👋 Welcome screen
void showWelcome() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Welcome to");
  lcd.setCursor(0, 1);
  lcd.print("Smart Parking");
  delay(2000);
}
// 📟 Main LCD display
void updateLCD() {
  int available = MAX_PARKING - carCount;
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Smart Parking");
  lcd.setCursor(0, 1);
  lcd.print("Filled:");
  lcd.print(carCount);
  lcd.print("  Free:");
  lcd.print(available);
}
// 🔴 Parking full alert
void showParkingFull() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Smart Parking");
  lcd.setCursor(0, 1);
  lcd.print("PARKING FULL");
  delay(2000);
  updateLCD();
}
