#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2); // try 0x27 or 0x3F if nothing appears

void setup() {
  Serial.begin(9600);
  lcd.init();            // initialize the LCD
  lcd.backlight();       // turn on the backlight
  lcd.clear();

  lcd.setCursor(0, 0);   
  lcd.print("...Hello shiva...!");
  lcd.setCursor(0, 1);
  lcd.print("Welcome to IoT Lab");
}

void loop() {
  // nothing needed here — static display
}