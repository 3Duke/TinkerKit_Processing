import processing.serial.*;
import cc.arduino.*;
import com.tinkerkit.*;

Arduino arduino;

//declare the joystick
TKRelay relay;

//circle parameters
int r;
float cx,cy;
boolean on;

void setup() {  

  size(256,256);

  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);    
  
  //for every tinkerkit component we have to pass
  //the arduino and the port
  relay = new TKRelay(arduino, TK.O0);
  
  cx = width/2;
  cy = height/2;
  r = 20;
  
  smooth();
}

void draw() {
  
  background(0);
  
  strokeWeight(3);
  stroke(255);
  
  if(on) {
    relay.on();
    fill(255);
  } else {
    relay.off();
    noFill();
  }
  
  ellipse(cx,cy,r*2,r*2);
}

void mousePressed() {

  //check if mouse is inside the circle
  float d = dist(mouseX,mouseY,cx,cy);
  
  if(d < r) {
    on = !on;
  }
  
}
