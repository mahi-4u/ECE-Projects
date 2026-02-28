# PIR Motion Sensor with LCD Interfacing using Arduino

## 📌 Objective
To detect motion using a PIR sensor and display the detection status on a 16x2 I2C LCD. An LED is used as a visual indicator for motion detection.

---

## 🧰 Components Required
- Arduino Uno
- PIR Motion Sensor (HC-SR501)
- 16x2 LCD with I2C module
- LED
- 220Ω Resistor
- Jumper Wires

---

## 🔌 Pin Connections

### PIR Sensor

| PIR Pin | Connection |
|----------|------------|
| VCC      | 5V         |
| GND      | GND        |
| OUT      | Digital Pin 5 |

---

### LED

| LED Pin | Connection |
|----------|------------|
| Anode (+) | Digital Pin 10 (via 220Ω resistor) |
| Cathode (-) | GND |

---

### LCD (I2C)

| LCD Pin | Connection |
|----------|------------|
| VCC      | 5V |
| GND      | GND |
| SDA      | A4 |
| SCL      | A5 |

(Note: I2C address usually 0x27 or 0x3F)

---

## ⚙️ Working Principle

A PIR (Passive Infrared) sensor detects infrared radiation changes caused by human movement.

When motion is detected:
- PIR output becomes HIGH
- LED turns ON
- LCD displays "Motion Detected"
- Time since Arduino start is shown

When no motion:
- PIR output becomes LOW
- LED turns OFF
- LCD displays "No Motion"

---

## 🧠 Code Explanation

- `digitalRead(pirPin);`
  → Reads motion status from PIR sensor.

- `digitalWrite(ledPin, HIGH);`
  → Turns ON LED when motion is detected.

- `lcd.print();`
  → Displays messages on LCD.

- `millis()`
  → Shows time (in seconds) since Arduino started.

- `delay(200);`
  → Stabilizes PIR reading.

---

## 📷 Circuit Diagram

(<img width="1536" height="1024" alt="pir_sensor" src="https://github.com/user-attachments/assets/3390d661-3ea2-43a4-b3fc-bcb51529395f" />
.png)

---

## 📊 Output

When motion detected:
Motion Detected!
Time: .. sec

When no motion:
No Motion
System Normal
