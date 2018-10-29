class Instr {
  
  Circle iCircle;
  float topSpeed = 10;
  float radius;
  color fill;
  int grey;
  int alpha;
  int grStroke;
  int alStroke;
  float size;
  color stroke;
  float strokeSize;
  Boolean add = false;
  PVector follow;
  PVector location;
  PVector velocity;
  PVector upVelocity;
  PVector acceleration;
  float speed;
  
  
  Instr(int _grey, int _alpha, int _grStroke, int _alStroke, float _size, color _stroke, float _strokeSize){
  grey = _grey;
  alpha = _alpha;
  grStroke = _grStroke;
  alStroke = _alStroke;
  size = _size;
  stroke = _stroke;
  strokeSize = _strokeSize;
  fill = color(grey, alpha);
  stroke = color(grStroke, alStroke);
  location = new PVector(width/2, height/2);
  velocity = new PVector(random(2,4),random(2,4));
  acceleration = new PVector(random(0.001,-0.001), random(0.01,-0.01));
  iCircle = new Circle(size, fill, stroke, strokeSize, location, velocity, acceleration);
  }
  
  void run(float _radius, PVector centerLoc, float _size, float _speed, int _alpha, int _alStroke){
    speed = _speed;
    radius = _radius;
    size = _size;
    alpha = _alpha;
    fill = color(grey, alpha);
    alStroke = _alStroke;
    stroke = color(grStroke, alStroke);
    location = centerLoc;
    iCircle.cRotate(radius, location, speed);
    iCircle.display(size, fill, stroke, strokeSize);
  }
   
 }
 
 
 

