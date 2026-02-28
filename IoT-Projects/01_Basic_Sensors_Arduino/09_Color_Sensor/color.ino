// TCS3200 / TCS230 Color Sensor Monitoring using Arduino
// Author: Mahesh
// S0 → Pin 5
// S1 → Pin 4
// S2 → Pin 7
// S3 → Pin 6
// OUT → Pin 8

// Pin Definitions
const int S0 = 5;
const int S1 = 4;
const int S2 = 7;
const int S3 = 6;
const int sensorOut = 8;

// Variables
int redFreq = 0;
int greenFreq = 0;
int blueFreq = 0;

void setup() {

  pinMode(S0, OUTPUT);
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  pinMode(sensorOut, INPUT);

  Serial.begin(9600);

  // Set frequency scaling to 20%
  digitalWrite(S0, HIGH);
  digitalWrite(S1, LOW);

  Serial.println("TCS3200 Color Sensor Ready...");
}

void loop() {

  // Read RED
  digitalWrite(S2, LOW);
  digitalWrite(S3, LOW);
  redFreq = pulseIn(sensorOut, LOW);

  // Read GREEN
  digitalWrite(S2, HIGH);
  digitalWrite(S3, HIGH);
  greenFreq = pulseIn(sensorOut, LOW);

  // Read BLUE
  digitalWrite(S2, LOW);
  digitalWrite(S3, HIGH);
  blueFreq = pulseIn(sensorOut, LOW);

  // Display raw frequency values
  Serial.print("R: ");
  Serial.print(redFreq);
  Serial.print("  G: ");
  Serial.print(greenFreq);
  Serial.print("  B: ");
  Serial.print(blueFreq);
  Serial.print("  →  ");

  detectColor(redFreq, greenFreq, blueFreq);

  delay(1000);   // Wait 1 second before next reading
}

void detectColor(int r, int g, int b) {

  int R = map(r, 25, 75, 255, 0);
  int G = map(g, 30, 90, 255, 0);
  int B = map(b, 25, 70, 255, 0);

  R = constrain(R, 0, 255);
  G = constrain(G, 0, 255);
  B = constrain(B, 0, 255);

  Serial.print("RGB(");
  Serial.print(R); Serial.print(", ");
  Serial.print(G); Serial.print(", ");
  Serial.print(B); Serial.print(")  →  ");

  if (R < 50 && G < 50 && B < 50)
    Serial.println("Black");
  else if (R > 200 && G > 200 && B > 200)
    Serial.println("White");
  else if (R > G && R > B && G < 100)
    Serial.println("Red");
  else if (G > R && G > B)
    Serial.println("Green");
  else if (B > R && B > G)
    Serial.println("Blue");
  else if (R > 180 && G > 180 && B < 80)
    Serial.println("Yellow");
  else if (R > 180 && G < 100 && B < 100)
    Serial.println("Orange");
  else if (R > 200 && B > 150 && G < 150)
    Serial.println("Pink");
  else if (R > 100 && G > 50 && B < 50)
    Serial.println("Brown");
  else
    Serial.println("Unknown");
}
