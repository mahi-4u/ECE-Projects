# TCS3200 / TCS230 Color Sensor Interfacing with Arduino

## 📌 Objective
To detect different colors using the TCS3200 color sensor and display the detected color name on the Serial Monitor.

---

## 🧰 Components Required
- Arduino Uno
- TCS3200 (TCS230) Color Sensor
- Jumper Wires

---

## 🔌 Pin Connections

| Sensor Pin | Connection |
|------------|------------|
| VCC        | 5V |
| GND        | GND |
| S0         | Digital Pin 5 |
| S1         | Digital Pin 4 |
| S2         | Digital Pin 7 |
| S3         | Digital Pin 6 |
| OUT        | Digital Pin 8 |

---

## ⚙️ Working Principle

The TCS3200 color sensor detects color using photodiodes with red, green, and blue filters.

The sensor outputs a square wave frequency that varies depending on the detected color intensity.

1. S2 and S3 select the color filter (Red, Green, Blue).
2. The OUT pin generates a frequency signal.
3. Arduino measures this frequency using `pulseIn()`.
4. The frequency values are mapped to approximate RGB values.
5. Based on RGB comparison, the color name is identified.

Frequency scaling is set to 20% using:

- S0 = HIGH  
- S1 = LOW  

---

## 🧠 Code Explanation

`pulseIn(sensorOut, LOW);`  
Measures frequency output from sensor.

`map()`  
Converts frequency range into 0–255 RGB scale.

`constrain()`  
Limits RGB values between 0 and 255.

Color decision logic compares R, G, B values to identify:

- Red
- Green
- Blue
- Yellow
- Orange
- Pink
- Brown
- White
- Black

---

## 📷 Circuit Diagram

(<img width="421" height="397" alt="color" src="https://github.com/user-attachments/assets/7b01333d-1963-4d08-9a93-096bda60fc31" />
.png)

---

## 📊 Output

Serial Monitor displays:

R: 35  G: 60  B: 70 → RGB(220, 80, 60) → Red

R: 60  G: 30  B: 80 → RGB(90, 230, 70) → Green

R: 70  G: 75  B: 30 → RGB(80, 70, 240) → Blue

Color updates every 1 second.
