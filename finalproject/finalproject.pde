import processing.serial.*;

String time = "000";
int t;

int xp = 150;
int x = 20;
int step = 20;

boolean blankScreen;
boolean lvl1 =false;
boolean lvl2 =false;
boolean lvl3 =false;
boolean lvl4 =false;
boolean lvl5 =false;
boolean lvl6 =false;

float r;
float g;
float b;

float x9;
float y9;
float switchValue;
float ping;
Serial myPort;

void setup() {
  size(1000, 700);
  noStroke();
  r = random(255);
  g = random(255);
  b = random(255);

  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  if (blankScreen == true && ping < 5) {
    blankScreen = false;
    lvl1 = true;
    lvl2 = false;
    lvl3 = false;
    lvl4 = false;
    lvl6 = false;
  }

  if (ping > 5) {
    blankScreen = true;
    lvl1 = false;
    lvl2 = false;
    lvl3 = false;
    lvl4 = false;
  }

  if (blankScreen == true) {
    blankScreenScene();
  }  

  if (lvl1 == true && mouseX > 500 && mouseY > 450) {
    lvl2 = true;
    lvl1 = false;
  }

  if ( lvl1 == true) {
    lvl1Scene();
  }

  if (lvl2 == true && mouseX < 150 && mouseY < 250) {
    lvl3 = true;
    lvl2 = false;
  }

  if (lvl2 == true) {
    lvl2Scene();
  }

  if (lvl3 == true && mouseX > 850 && mouseY > 650) {
    lvl4 = true;
    lvl3 = false;
  }

  if ( lvl3 == true) {
    lvl3Scene();
  }

  if (lvl4 == true && mouseX < 25 && mouseY < 25) {
    lvl5 = true;
    lvl4 = false;
  }

  if ( lvl4 == true) {
    lvl4Scene();
  }

  if (lvl5 == true && mouseX > 950 && mouseY > 600) {
    lvl4 = true;
    lvl5 = false;
  }

  if ( lvl5 == true) {
    lvl5Scene();
  }

  if (lvl5 == true && ping > 5) {
    lvl5 = false;
    lvl6 = true;
  }
  if ( lvl6 == true) {
    lvl6Scene();
  }
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
    inString = trim(inString);
    float[] sensors = float(split(inString, ","));

  if ( sensors.length >=1) {

  for (int i = 0; i < sensors.length; i++) {
     ping = sensors[0];
      }
    }
  }
}

void blankScreenScene() {
  background(0);
}

void lvl1Scene() {
  background(xp, r, b, b);
  t = int(millis()/600);
  time = nf(t, 1);
  textSize(30);
  text(time, width/2, 600);
  text("level1", 900, 50);

  xp+=step;
  if (xp > width-500) {
    xp = width-500;
    step = -20;
  }
  
  if (xp < 0) {
    xp = 0;
    step = 20;
  }
  
  strokeWeight(10);
  stroke(r, g, b);
  float mappedLineRight = map(mouseY, 0, height, height, 0); 
  line(xp, mouseY, width-50, mappedLineRight);
}

void lvl2Scene() {
  background(xp, g, g, g);
  t = int(millis()/600);
  time = nf(t, 1);
  textSize(30);
  text(time, width/2, 550);
  text("level2", 900, 50);

  xp+=step;
  if (xp > width-500) {
    xp = width-500;
    step = -20;
  }
  
  if (xp < 0) {
    xp = 0;
    step = 20;
  }

  strokeWeight(10);
  stroke(r, g, b);
  float mappedLineRight = map(mouseY, 0, height, height, 0); 
  line(xp, mouseY, width-50, mappedLineRight);
}

void lvl3Scene() {
  background(xp, b, b, b);
  t = int(millis()/600);
  time = nf(t, 1);
  textSize(30);
  text(time, width/2, 550);
  text("level3", 900, 50);

  xp+=step;
  if (xp > width-500) {
    xp = width-500;
    step = -20;
  }
  
  if (xp < 0) {
    xp = 0;
    step = 20;
  }

  strokeWeight(10);
  stroke(r, g, b);
  float mappedLineRight = map(mouseY, 0, height, height, 0); 
  line(xp, mouseY, width-50, mappedLineRight);
}

void lvl4Scene() {
  background(xp, g, r, r);
  t = int(millis()/600);
  time = nf(t, 1);
  textSize(30);
  text(time, width/2, 550);
  text("level4", 900, 50);

  xp+=step;
  if (xp > width-500) {
    xp = width-500;
    step = -20;
  }
  
  if (xp < 0) {
    xp = 0;
    step = 20;
  }

  strokeWeight(10);
  stroke(r, g, b);
  float mappedLineRight = map(mouseY, 0, height, height, 0); 
  line(xp, mouseY, width-50, mappedLineRight);
}

void lvl5Scene() {
  background(0);
  t = int(millis()/600);
  time = nf(t, 1);
  textSize(30);
  text(time, width/2, 550);
  text("MOVE YOUR HAND AWAY", height/2, 250);
}

void lvl6Scene() {
  background(0);
  textSize(150);
  text("YOU LOSE,", 20, height/2);
  text("RESTART.", 20, 500 );
}
