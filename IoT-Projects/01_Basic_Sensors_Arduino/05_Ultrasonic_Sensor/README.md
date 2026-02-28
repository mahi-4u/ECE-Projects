# Ultrasonic Sensor (HC-SR04) Interfacing with Arduino

## 📌 Objective
To measure distance using the HC-SR04 Ultrasonic Sensor and display the distance in centimeters and inches on the Serial Monitor.

---

## 🧰 Components Required
- Arduino Uno
- HC-SR04 Ultrasonic Sensor
- Jumper Wires

---

## 🔌 Pin Connections

| Ultrasonic Pin | Connection |
|---------------|------------|
| VCC           | 5V         |
| GND           | GND        |
| TRIG          | Digital Pin 3 |
| ECHO          | Digital Pin 4 |

---

## ⚙️ Working Principle

The HC-SR04 ultrasonic sensor measures distance using sound waves.

1. Arduino sends a 10 microsecond pulse to the TRIG pin.
2. The sensor emits ultrasonic waves (40kHz).
3. The waves hit an object and reflect back.
4. The ECHO pin stays HIGH for the duration of the returning signal.
5. Arduino measures this time using `pulseIn()`.

Distance Formula:

Distance (cm) = (Time × Speed of Sound) / 2

Speed of sound = 0.034 cm per microsecond.

We divide by 2 because the sound wave travels forward and backward.

---

## 🧠 Code Explanation

- `digitalWrite(trigPin, HIGH);`  
  Sends ultrasonic pulse.

- `pulseIn(echoPin, HIGH);`  
  Measures time for echo to return.

- `duration * 0.034 / 2`  
  Converts time into centimeters.

- `duration * 0.0133 / 2`  
  Converts time into inches.

- `delay(1000);`  
  Waits 1 second before next measurement.

---

## 📷 Circuit Diagram

(<img width="1536" height="1024" alt="ultrasonic" src="https://github.com/user-attachments/assets/959dcf77-bb53-4da2-b6fd-69f04f9101a2" />
.png)


(<img width="447" height="399" alt="ultrasonic" src="https://github.com/user-attachments/assets/44a3b118-e612-4f1d-926e-4865cfdf6163" />
.png)

---

## 📊 Output

Serial Monitor displays:

Distance in cm: 25.34 cm  
Distance in inches: 9.98 inches  

Distance updates every 1 second based on object position.
