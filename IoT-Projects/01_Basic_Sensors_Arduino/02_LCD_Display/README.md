# I2C LCD Display Interfacing with Arduino

## 📌 Objective
To interface a 16x2 I2C LCD display with Arduino Uno and display static text messages.

---

## 🧰 Components Required
- Arduino Uno
- 16x2 LCD with I2C module
- Jumper Wires

---

## 🔌 Pin Connections

| LCD Pin | Arduino Uno |
|----------|-------------|
| VCC      | 5V          |
| GND      | GND         |
| SDA      | A4          |
| SCL      | A5          |

> I2C Address used: 0x27 (may vary 0x3F for some modules)

---

## ⚙️ Working Principle

The LCD uses I2C communication protocol which requires only two data lines:

- SDA (Serial Data)
- SCL (Serial Clock)

Arduino sends data through I2C bus to the LCD module.
The display prints text on two rows (16 characters each).

---

## 🧠 Code Explanation

- `LiquidCrystal_I2C lcd(0x27,16,2);`
  → Initializes LCD with address 0x27 and size 16x2.

- `lcd.init();`
  → Starts LCD communication.

- `lcd.backlight();`
  → Turns ON display backlight.

- `lcd.setCursor(column,row);`
  → Sets text position.

- `lcd.print();`
  → Displays message on LCD.

---

## 📷 Circuit Diagram

(<img width="1536" height="1024" alt="lcd_i2c_display" src="https://github.com/user-attachments/assets/0515e96c-17a2-4c71-a956-77b8c910571e" />
.png)

---

## 📊 Output

Line 1: Hello Shiva!
Line 2: Welcome to IoT Lab

The message remains static on the display.
