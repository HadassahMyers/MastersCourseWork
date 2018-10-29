Particle p;
 
void setup() {
  size(640,360);
  p = new Particle(new PVector(width/2,10));
}
 
void draw() {
  background(255);
//Operating the single Particle
  p.run();
  if (p.isDead()) {
    println("Particle dead!");
  }
}
 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
 
  Particle(PVector l) {
//For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }
 
//Sometimes it’s convenient to have a “run” function that calls all the other functions we need.
  void run() {
    update();
    display();
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
 
  void display() {
    stroke(0,lifespan);
    fill(0,lifespan);
    ellipse(location.x,location.y,8,8);
  }
 
//Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
