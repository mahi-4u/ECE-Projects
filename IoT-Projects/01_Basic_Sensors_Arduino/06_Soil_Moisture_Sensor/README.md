# Soil Moisture Sensor Interfacing with Arduino

## 📌 Objective
To monitor soil moisture level using a soil moisture sensor and indicate dry soil condition using an LED.

---

## 🧰 Components Required
- Arduino Uno
- Soil Moisture Sensor (Analog Type)
- LED
- 220Ω Resistor
- Jumper Wires

---

## 🔌 Pin Connections

| Component | Connection |
|-----------|------------|
| Soil Sensor VCC | 5V |
| Soil Sensor GND | GND |
| Soil Sensor AO  | A0 |
| LED Anode (+)   | Digital Pin 11 (via 220Ω resistor) |
| LED Cathode (-) | GND |

---

## ⚙️ Working Principle

The soil moisture sensor measures the water content in soil by detecting resistance between two probes.

- Wet soil → Low resistance → Higher analog value
- Dry soil → High resistance → Lower analog value

Arduino reads the analog value from pin A0 (0–1023 range).

If the moisture value is below the threshold (500 in this case):
- Soil is considered Dry
- LED turns ON

If the value is above threshold:
- Soil is considered Wet
- LED turns OFF

Threshold can be adjusted based on calibration.

---

## 🧠 Code Explanation

- `analogRead(A0);`  
  Reads moisture level from sensor (0–1023).

- `threshold = 500;`  
  Defines dry/wet boundary (adjustable).

- `digitalWrite(ledPin, HIGH);`  
  Turns ON LED when soil is dry.

- `digitalWrite(ledPin, LOW);`  
  Turns OFF LED when soil is wet.

- `delay(1000);`  
  Waits 1 second before next reading.

---

## 📷 Circuit Diagram

(<img width="447" height="399" alt="soilmoisture" src="https://github.com/user-attachments/assets/49f2ad90-be14-4dd9-8133-360927d2ff62" />
.png)

---

## 📊 Output

Serial Monitor displays:

Soil Moisture Value: 430  
Soil is Dry → LED ON  

Soil Moisture Value: 750  
Soil is Wet → LED OFF  

Value updates every 1 second.
