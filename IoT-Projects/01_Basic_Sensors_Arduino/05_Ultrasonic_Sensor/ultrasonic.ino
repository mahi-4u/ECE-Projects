const int trigPin = 3; 
const int echoPin = 4; 
void setup() {
Serial.begin(9600); 
 pinMode(trigPin, OUTPUT); 
 pinMode(echoPin, INPUT); 
} 
void loop() { 
 digitalWrite(trigPin, LOW); 
 delayMicroseconds(2); 
 digitalWrite(trigPin, HIGH); 
 delayMicroseconds(10); 
 digitalWrite(trigPin, LOW); 
 unsigned long duration = pulseIn(echoPin, HIGH); 
  
 float inches = duration * 0.0133 / 2; 
 float cm = duration * 0.034 / 2; 
 Serial.print("Distance in inches: "); 
 Serial.print(inches); 
 Serial.print(" inches, Distance in cm: "); 
 Serial.print(cm); 
 Serial.println(" cm"); 
 delay(1000);  
}