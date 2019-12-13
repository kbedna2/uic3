#include <Servo.h>
#include <Adafruit_NeoPixel.h>
#define PIN        13
#define NUMPIXELS 10

Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

Servo myservo;
Servo myservo2;

int pos = 0;

const int trigPin = 2;
const int echoPin = 4;


void setup() {
  myservo.attach(9);
  myservo2.attach(10);

  pixels.begin();

  Serial.begin(9600);
}

void loop() {
  pixels.clear();
  long duration, inches, cm;
  pinMode(trigPin, OUTPUT);
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  pinMode(echoPin, INPUT);
  duration = pulseIn(echoPin, HIGH);

  inches = microsecondsToInches(duration);
  cm = microsecondsToCentimeters(duration);
//
//  Serial.print(inches);
//  Serial.print("in, ");
//  Serial.print(cm);
//  Serial.print("cm");
//  Serial.println();
//  delay(100);

  if (inches < 5) {

    for (int i = 0; i < NUMPIXELS; i++) {
      pixels.setPixelColor(i, pixels.Color(0, 150, 150));
      pixels.show();
      delay(10);
      int mapped = (NUMPIXELS, i, 10, 0, 120);
      int mapped2 = (NUMPIXELS, 10, i, 120, 00);
      myservo.write(mapped);
      myservo2.write(mapped2);
      delay(30);
    }

    for (int i = NUMPIXELS; i >= 0; i--) {
      pixels.setPixelColor(i, pixels.Color(150, 0, 0));
      pixels.show();
      delay(10);
      int mapped = (NUMPIXELS, i, 10, 0, 120);
      int mapped2 = (NUMPIXELS, 10, i, 120, 00);
      myservo.write(mapped2);
      myservo2.write(mapped);
      delay(30);
    }
    //for (pos = 0; pos <= 95; pos += 1) {
    // myservo2.write(pos);
    //delay(10);
    //  }

//    for (int i = 0; i < NUMPIXELS; i++) {
//      pixels.setPixelColor(i, pixels.Color(0, 150, 150));
//      pixels.show();
//      delay(30);
//    }
//    for (pos = 178; pos >= 0; pos -= 1) {
//      myservo.write(pos);
//      delay(10);
//    }
//
//    for (int i = NUMPIXELS; i >= 0; i--) {
//      pixels.setPixelColor(i, pixels.Color(150, 0, 0));
//      pixels.show();
//      delay(30);
//    }
//    for (pos = 178; pos >= 0; pos -= 1) {
//      myservo2.write(pos);
//      delay(10);
//    }
  }

  else {
    for (int i = 0; i < NUMPIXELS; i++) {
      pixels.setPixelColor(i, pixels.Color(0, 0, 0));
      pixels.show();
    }
  }

//  Serial.print(analogRead(xPin));
//  Serial.print(",");
//  Serial.print(analogRead(yPin));
//  Serial.print(",");
  Serial.print(inches);
  Serial.println();

}

long microsecondsToInches(long microseconds) {
  return microseconds / 74 / 2;
}

long microsecondsToCentimeters(long microseconds) {
  return microseconds / 29 / 2;
}
