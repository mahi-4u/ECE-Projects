# Gas Sensor (MQ Series) Interfacing with Arduino

## 📌 Objective
To detect gas levels using an MQ gas sensor and monitor air quality using Arduino through Serial Monitor output.

---

## 🧰 Components Required
- Arduino Uno
- MQ Gas Sensor (MQ2 / MQ3 / MQ135 etc.)
- Jumper Wires

---

## 🔌 Pin Connections

| Component | Connection |
|-----------|------------|
| Gas Sensor VCC | 5V |
| Gas Sensor GND | GND |
| Gas Sensor AO  | A3 |

(Note: Using Analog Output pin of MQ sensor.)

---

## ⚙️ Working Principle

The MQ gas sensor detects gas concentration in the air.

- Clean air → Lower analog value  
- Gas presence → Higher analog value  

The sensor outputs an analog signal (0–1023).

Arduino reads this value using `analogRead()`.

If the gas value exceeds the threshold (400 in this case):

- Gas Leakage Detected

If below threshold:

- Air Quality Normal

The threshold should be adjusted based on environment and calibration.

---

## 🧠 Code Explanation

`analogRead(A3);`  
Reads gas level from sensor (0–1023).

`threshold = 400;`  
Defines gas detection limit (adjustable).

`if (gasValue > threshold)`  
Checks for high gas concentration.

`Serial.println();`  
Displays gas status on Serial Monitor.

`delay(1000);`  
Waits 1 second before next reading.

---

## 📷 Circuit Diagram

(<img width="321" height="282" alt="gas" src="https://github.com/user-attachments/assets/5d634879-6963-4f20-ad2d-2a79e0d6e22d" />
.png)

---

## 📊 Output

Serial Monitor displays:

Gas Sensor Value: 320  
Air Quality Normal  

Gas Sensor Value: 650  
Gas Leakage Detected!  

Value updates every 1 second.
