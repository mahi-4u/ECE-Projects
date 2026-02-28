// I2C LCD Display with Arduino Uno
// Author: Mahesh
// LCD Address: 0x27
// Size: 16x2

#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

void setup() {
  Serial.begin(9600);
  lcd.init();        
  lcd.backlight();   
  lcd.clear();

  lcd.setCursor(0, 0);   
  lcd.print("Hello Shiva!");

  lcd.setCursor(0, 1);
  lcd.print("Welcome to IoT Lab");
}

void loop() {
  // Static Display
}
