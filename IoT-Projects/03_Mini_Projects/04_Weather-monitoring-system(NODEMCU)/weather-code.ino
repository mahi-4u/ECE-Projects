//AUthor:mahesh
#include <ESP8266WiFi.h>
#include <DHT.h>
#define DHTPIN D2
#define DHTTYPE DHT11
#define MQ2 A0
DHT dht(DHTPIN, DHTTYPE);
const char* ssid = "ESP8266_AP";
const char* password = "12345678";
WiFiServer server(80);
void setup() {
  Serial.begin(115200);
  dht.begin();
  WiFi.softAP(ssid, password);   // Create WiFi
  Serial.println(WiFi.softAPIP()); // Shows 192.168.4.1
  server.begin();
}
void loop() {
  WiFiClient client = server.available();
  if (!client) return;
  float t = dht.readTemperature();
  float h = dht.readHumidity();
  int gas = analogRead(MQ2);
  client.println("HTTP/1.1 200 OK");
  client.println("Content-Type: text/html");
  client.println();
  client.println("<h2>Weather Data</h2>");
  client.print("Temp: "); client.print(t); client.println(" C<br>");
  client.print("Humidity: "); client.print(h); client.println(" %<br>");
  client.print("Gas: "); client.print(gas); client.println("<br>");
  client.stop();
}
