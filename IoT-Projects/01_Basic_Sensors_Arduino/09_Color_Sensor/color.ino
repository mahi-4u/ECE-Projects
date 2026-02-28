// TCS230/TCS3200 Color Sensor with Arduino
// Detects major colors and prints color name in Serial Monitor

const int S0 = 5;
const int S1 = 4;
const int S2 = 7;
const int S3 = 6;
const int sensorOut = 8;

int redFreq, greenFreq, blueFreq;

void setup() {
  Serial.begin(9600);
  pinMode(S0, OUTPUT);
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  pinMode(sensorOut, INPUT);

  // Set frequency scaling to 20%
  digitalWrite(S0, HIGH);
  digitalWrite(S1, LOW);

  Serial.println("TCS3200 Color Sensor Test Starting...");
  delay(2000);
}

void loop() {
  // --- Read Red ---
  digitalWrite(S2, LOW);
  digitalWrite(S3, LOW);
  redFreq = pulseIn(sensorOut, LOW);
  
  // --- Read Green ---
  digitalWrite(S2, HIGH);
  digitalWrite(S3, HIGH);
  greenFreq = pulseIn(sensorOut, LOW);
  
  // --- Read Blue ---
  digitalWrite(S2, LOW);
  digitalWrite(S3, HIGH);
  blueFreq = pulseIn(sensorOut, LOW);

  // --- Print raw data ---
  Serial.print("R: "); Serial.print(redFreq);
  Serial.print("  G: "); Serial.print(greenFreq);
  Serial.print("  B: "); Serial.print(blueFreq);
  Serial.print("  →  ");

  // --- Identify color ---
  detectColor(redFreq, greenFreq, blueFreq);

  delay(1000);
}

void detectColor(int r, int g, int b) {
  // Normalize (approx)
  int R = map(r, 25, 75, 255, 0);
  int G = map(g, 30, 90, 255, 0);
  int B = map(b, 25, 70, 255, 0);

  // Clamp
  R = constrain(R, 0, 255);
  G = constrain(G, 0, 255);
  B = constrain(B, 0, 255);

  // Print approximate RGB values
  Serial.print("RGB(");
  Serial.print(R); Serial.print(", ");
  Serial.print(G); Serial.print(", ");
  Serial.print(B); Serial.print(")  →  ");

  // Simple color decision logic
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
