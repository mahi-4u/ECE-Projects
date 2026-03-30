//Author:mahesh
// -------- PIN DEFINITIONS --------
// Sensors
#define PIR_PIN D5
#define TRIG_PIN D6
#define ECHO_PIN D7
// LEDs
#define LED1 D0
#define LED2 D1
#define LED3 D2
// Color Sensor
#define S2_PIN D3
#define S3_PIN D4
#define OUT_PIN D8
long duration;
int distance;
int baseline = 600;
int threshold = 150;
// -------- COLOR FUNCTION --------
unsigned long readColor(bool s2, bool s3) {
  digitalWrite(S2_PIN, s2);
  digitalWrite(S3_PIN, s3);
  delay(20);
  return pulseIn(OUT_PIN, LOW);
}
// -------- SETUP --------
void setup() {
  Serial.begin(9600);
  pinMode(PIR_PIN, INPUT);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(S2_PIN, OUTPUT);
  pinMode(S3_PIN, OUTPUT);
  pinMode(OUT_PIN, INPUT);
  Serial.println("System Ready...");
}
// -------- LOOP --------
void loop() {
  int count = 0;
  // ---- ULTRASONIC ----
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  duration = pulseIn(ECHO_PIN, HIGH);
  distance = duration * 0.034 / 2;
  if (distance < 80) {
    count++;
  }
  // ---- PIR ----
  int pirState = digitalRead(PIR_PIN);
  if (pirState == HIGH) {
    count++;
  }
  // ---- COLOR SENSOR ----
  unsigned long R = readColor(LOW, LOW);
  unsigned long B = readColor(LOW, HIGH);
  unsigned long G = readColor(HIGH, HIGH);
  int total = R + G + B;
  int diff = abs(total - baseline);
  if (diff > threshold) {
    count++;
  }
  // ---- SERIAL OUTPUT ----
  Serial.print("PIR: "); Serial.print(pirState);
  Serial.print(" Distance: "); Serial.print(distance);
  Serial.print(" ColorDiff: "); Serial.println(diff);
  // ---- LED LOGIC ----
  digitalWrite(LED1, (count == 1));
  digitalWrite(LED2, (count == 2));
  digitalWrite(LED3, (count >= 3));
  delay(200);
}
