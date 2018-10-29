public class Circle{
 
  float size;
  color fill;
  color stroke;
  float strokeSize;
  PVector location;
  PVector vel;
  PVector acc;
  PVector center;
  float radius;
  float angle = 0.0;
 // float accF = 0.09;
  float velF =  0.09;
  float speedLim;
  
  
  Circle(float cSize, color cFill, color cStroke, float cStrokeSize, PVector cLocation, PVector cVel, PVector followAcc){
    size = cSize;
    fill = cFill;
    stroke = cStroke;
    strokeSize = cStrokeSize;
    location = cLocation;
    vel = cVel;
    acc = followAcc;
  }
  
  // This is for orbit array
  void swing(PVector follow, float followSpeed){
    center = follow;
    float topSpeed = followSpeed;
    //Step 1: Compute direction
    PVector dir = PVector.sub(center, location);
    //Step 2: Normalize
    dir.normalize();
    //Step 3: Scale
    dir.mult(0.5);
    //Step 4: Accelerate
    acc = dir;
    vel.add(acc);
    vel.limit(topSpeed);
    location.add(vel);
  }
  
  void cRotate(float myRadius, PVector newLocation, float _speedLim){
    radius = myRadius; 
    location = newLocation;
    speedLim = _speedLim;
    location.x = radius *cos(angle);
    location.y = radius *sin(angle);
    angle += velF;
   // velF += accF;
    velF = constrain(velF, 0, speedLim);
  }
  
  void update(){
    location.add(vel);
  }
  
  void display(float cSize, color cFill, color cStroke, float cStrokeSize){
    size = cSize;
    fill = cFill;
    stroke = cStroke;
    strokeSize = cStrokeSize;
    strokeWeight(strokeSize);
    stroke(stroke);
    fill(fill);
    ellipse(location.x, location.y, size, size);
  }
  
  void displayOrb(float cSize){
    size = cSize;
    strokeWeight(strokeSize);
    stroke(stroke);
    fill(fill); 
    ellipse(location.x, location.y, size, size);
  }
  
}
