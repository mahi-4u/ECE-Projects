# DHT11 Temperature and Humidity Sensor Interfacing with Arduino

## 📌 Objective
To measure temperature and humidity using the DHT11 sensor and display the readings on a 16x2 I2C LCD as well as the Serial Monitor.

---

## 🧰 Components Required
- Arduino Uno
- DHT11 Temperature & Humidity Sensor
- 16x2 LCD with I2C module
- Jumper Wires

---

## 🔌 Pin Connections

### DHT11 Sensor

| DHT11 Pin | Connection |
|------------|------------|
| VCC        | 5V |
| GND        | GND |
| DATA       | Digital Pin 2 |

(Note: If using bare DHT11 sensor, use a 10kΩ pull-up resistor between VCC and DATA.)

---

### LCD (I2C)

| LCD Pin | Connection |
|----------|------------|
| VCC      | 5V |
| GND      | GND |
| SDA      | A4 |
| SCL      | A5 |

(I2C Address usually 0x27 or 0x3F)

---

## ⚙️ Working Principle

The DHT11 sensor measures:

- Temperature (°C)
- Humidity (%)

The sensor sends digital data to Arduino using a single-wire communication protocol.

Arduino:
1. Reads temperature using `dht.readTemperature()`
2. Reads humidity using `dht.readHumidity()`
3. Displays values on Serial Monitor
4. Shows readings on 16x2 LCD

If the sensor fails to respond, the system displays "Sensor Error".

---

## 🧠 Code Explanation

- `#include <DHT.h>`  
  Includes DHT sensor library.

- `dht.begin();`  
  Initializes the DHT11 sensor.

- `dht.readTemperature();`  
  Reads temperature in Celsius.

- `dht.readHumidity();`  
  Reads humidity percentage.

- `isnan()`  
  Checks if sensor reading failed.

- `lcd.print();`  
  Displays values on LCD.

- `delay(2000);`  
  Waits 2 seconds between readings.

---

## 📷 Circuit Diagram

(<img width="438" height="223" alt="dht11" src="https://github.com/user-attachments/assets/7bd38f92-5051-4c54-a416-fa8062a1cf49" />
.png)

---

## 📊 Output

Serial Monitor displays:

Temperature: 29.00 °C  
Humidity: 65.00 %

LCD displays:

Temp: 29 C  
Humidity: 65 %

Values update every 2 seconds.
