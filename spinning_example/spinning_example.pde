//PushMatrix Experiment
 

 
//variables relating to the first sphere, the pink fairy
float fairyDia=20;
float fairyOrbitRadius=130;
float fairyAngle=0;
float fairySpin=0;
 
//variables relating to its little sister
float sisterDia=10;
float sisterOrbitRadius=10;
float sisterAngle=0;
float sisterSpin=0;
 
//variables relating to its little brother
float brotherDia=5;
float brotherOrbitRadius=30;
float brotherAngle=0;
float brotherSpin=0;
 

 
//colors
color glow = #FFFEDB;
color fairyOne = #F9DBFF;
color sister = #FF95FE;
color brother = #86ECFF;
color mom = #FF4343;
color dad = #43FF96;
 
 
void setup() {
  size (800, 600);
  smooth();
  noStroke();
}
 
void draw() {
  ellipseMode(CENTER); //resets the ellipse mode to make the glowing center
  fill(0, 0, 0, 25); //black night
  rect(0, 0, width, height); //resetting the background while letting some of the color seep
  translate(width/2, height/2); //translation to make the center 0,0
  fill(glow); //fills the center color

  ellipseMode(CORNER); //sets ellipse mode for the fairies
  pushMatrix(); // PUSH OF TRANSLATION to CENTER
  rotate(fairyAngle); //rotates the sphere around the orbit
  translate(fairyOrbitRadius, 0); //sets it to that the canvas moves in lengthwise the length of the designated orbit
  fill(fairyOne); //fills the fairy color
 
  pushMatrix(); // PUSH OF ORBIT, TRANSLATION to the fairy
  rotate(fairySpin); //rotates the spehere
  ellipse(-fairyDia/2, -fairyDia/2, fairyDia, fairyDia); //draws the sphere
 
  popMatrix(); //one pop, loads the last screen (still on fairy one terms)
 
  popMatrix();
  popMatrix();
   
  pushMatrix();
  rotate(brotherAngle); //sister repeats
  translate(brotherOrbitRadius, 0);
  fill(brother);
 
  pushMatrix();
  rotate(brotherSpin);
  ellipse(-brotherDia/2, -brotherDia/2, brotherDia, brotherDia);
 
 
  popMatrix();
  popMatrix();
 // popMatrix(); //these pops send it back to its original values
   
//these values add the mom, putting her on separate rules from the siblings
pushMatrix();


  fill(mom);
 
  pushMatrix();


   
  popMatrix();
   
  pushMatrix();


  fill(dad);
 
  pushMatrix();


   
  popMatrix();
popMatrix();
popMatrix();
popMatrix();
 
  fairyAngle+=0.01; //changes variable values for movement
  fairySpin+=0.006;
  sisterAngle+=0.05;
  sisterSpin+=0.01;
  brotherAngle+=.1;
  brotherSpin+=.1;



}
 
 



