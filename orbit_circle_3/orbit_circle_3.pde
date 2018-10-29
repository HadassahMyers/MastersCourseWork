
float r1 = 180;
float r2 = 120;
float r3 = 50;
float a1 = 0;
float a2 = 0;
float aVel1 = 0.0;
float aVel2 = 0.0;
float aAcc1 = 0.09;
float aAcc2 = 0.09;

void setup(){
  size(640, 480);
}


void draw() {
  background(0);
  
  translate(width/2, height/2);
  float x1 = r1 * cos(a1);
  float y1 = r1 * sin(a1);
  float x2 = r2 * cos(a2);
  float y2 = r2 * sin(a2);
  float x3 = r3 * cos(a1);
  float y3 = r3 * sin(a1);
  
  fill(255);
  ellipse(x1,y1,50,50);
  
    a1 += aVel1;
  aVel1 += aAcc1;
  aVel1 = constrain(aVel1, 0, 0.01);
  
  fill(255,0,0);
  ellipse(x2,y2,35,35);
  
  a2 += aVel2;
  aVel2 += aAcc2;
  aVel2 = constrain(aVel2, 0, -0.01);
  
  fill(0,0,255);
  ellipse(x3,y3,60,60);

}  
