# LED Blinking using Arduino

## 📌 Objective
To interface an LED with Arduino and make it blink at 1-second intervals.

---

## 🧰 Components Required
- Arduino Uno
- LED
- 220Ω Resistor
- Breadboard
- Connecting Wires

---

## 🔌 Pin Connections

| Component | Arduino Pin |
|-----------|------------|
| LED Anode (+) | Digital Pin 13 |
| LED Cathode (-) | GND (through 220Ω resistor) |

---

## ⚙️ Working Principle

The Arduino sends HIGH (5V) to digital pin 13.
This turns the LED ON.

After 1 second delay, Arduino sends LOW (0V).
This turns the LED OFF.

This process repeats continuously, creating a blinking effect.

---

## 🧠 Code Explanation

- `pinMode(ledPin, OUTPUT);`
  → Configures pin 13 as output.

- `digitalWrite(ledPin, HIGH);`
  → Supplies 5V to LED.

- `delay(1000);`
  → Waits for 1 second.

- `digitalWrite(ledPin, LOW);`
  → Turns LED OFF.

---

## 📷 Circuit Diagram

(<img width="629" height="284" alt="led_blink" src="https://github.com/user-attachments/assets/4e1e0e4c-c2a2-475f-960a-ba04b6a4a017" />


---

## 📊 Output
LED blinks every 1 second continuously.
