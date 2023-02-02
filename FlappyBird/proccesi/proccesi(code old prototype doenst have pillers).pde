import processing.serial.*;
Serial myPort;

float pX, pY, pS;
float gravity = -5;
float jumpVel = 50;

void setup(){
  size(500, 700);
  pX = 250;
  pY = 350;
  pS = 50;
  myPort = new Serial(this, "COM3", 9600);
}

void draw(){
  
  background(0);
  
  fill(255, 0, 0);
  circle(pX, pY, pS);
  
  pY -= gravity;
  
  int val=0;
  if ( myPort.available() > 0) {  
    val = myPort.read();         
  }
  
  if(val < 30)
  {
    pY -= 10;
  }else{
    pY += 10;
  }
  
  println(val);
  
  
  restart();
}

void restart(){
  if(pY >= 700){
    print("DED");
    pX = 250;
    pY = 350;
  }
}
