class Orbit {

  Circle orbitCircle;
  ArrayList<Circle> clist = new ArrayList<Circle>();

  float topSpeed = 10;
  color fill;
  float size;
  color stroke;
  float strokeSize;
  int alphaOrbit;
  Boolean add = false;
  Boolean remove = false;
  PVector follow;
  PVector location;
  PVector velocity;
  PVector upVelocity;
  PVector acceleration;

  Orbit(color orbitColor, int _alphaOrbit, float orbitSize, color _stroke, float _strokeSize) {
    fill = orbitColor;
    size = orbitSize;
    stroke = _stroke;
    strokeSize = _strokeSize;
    alphaOrbit = _alphaOrbit;
    location = new PVector(random(0,-400), random(0,-400));
    velocity = new PVector(3,2);
    acceleration = new PVector(random(0.001, -0.001), random(0.01, -0.01));
    clist.add(new Circle(size, fill, stroke, strokeSize, location, velocity, acceleration));
  }

  void run(PVector myFollow, float _size, float myspeed) {
    size = _size;
    follow = myFollow;
    topSpeed = myspeed;
    for (int i = 0; i < clist.size(); i++) {
      Circle c = clist.get(i);
      c.swing(follow, topSpeed);
      //c.update();
     
      for (int j = 1; j < clist.size()-1; j++) {
      Circle c2 = clist.get(j);
      stroke(127);
      strokeWeight(size/10);
      float myDis = dist(c.location.x, c2.location.x, c.location.y, c2.location.y);
      if( myDis < 100){
      line(c.location.x, c.location.y,c2.location.x, c2.location.y);
      }
      }
      c.displayOrb(size);
    }
  }

  void addMe(Boolean Add, color newFill) {
    add = Add;
    color localfill = newFill;
    // println(add);
    if (add) {
      location = new PVector(random(width), random(height));
      velocity = new PVector(3,2);
      acceleration = new PVector(random(0.001, -0.001), random(0.01, -0.01));
      //fill = color(random(50,255));
      clist.add(new Circle(size, localfill, stroke, strokeSize, location, velocity, acceleration));
    }
  }

  void removeMe(Boolean Remove) {
    remove = Remove;
    if (remove && clist.size() > 0) {
      clist.remove(0);
    }
  }
}


