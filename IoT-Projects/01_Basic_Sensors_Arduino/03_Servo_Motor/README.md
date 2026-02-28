# Servo Motor Interfacing with Arduino

## 📌 Objective
To control a servo motor using Arduino and rotate it to multiple angles (0° to 180°).

---

## 🧰 Components Required
- Arduino Uno
- SG90 / 9g Servo Motor
- Jumper Wires

---

## 🔌 Pin Connections

| Servo Wire Color | Connection |
|------------------|------------|
| Brown (GND)      | GND        |
| Red (VCC)        | 5V         |
| Orange (Signal)  | Digital Pin 9 |

---

## ⚙️ Working Principle

A servo motor operates using PWM (Pulse Width Modulation).

Arduino sends PWM signals from pin 9.
The servo interprets pulse width and rotates to a specific angle.

- 0° → Minimum position
- 90° → Mid position
- 180° → Maximum position

The loop rotates servo in steps of 45 degrees every 1 second.

---

## 🧠 Code Explanation

- `#include <Servo.h>`
  → Includes servo control library.

- `myServo.attach(9);`
  → Connects servo signal wire to pin 9.

- `myServo.write(angle);`
  → Moves servo to specified angle.

- `delay(1000);`
  → Waits 1 second before next movement.

---

## 📷 Circuit Diagram

(<img width="1536" height="1024" alt="servo_motor" src="https://github.com/user-attachments/assets/54c41da9-0f5c-4505-b9b1-c72a7dfaa81f" />
.png)

---

## 📊 Output

Servo rotates:
0° → 45° → 90° → 135° → 180°
with 1 second delay between each step.
