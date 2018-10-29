void setup(){
  size(400,400);
  
}

void draw(){
  background(0);
  int myAngle = 0;
  while(int i =0, i <360, i++){
  myAngle = i;
  
 translate(width/2, height/2);
 rotate(myAngle);
 rect(-26, -26, 52, 52);
  
}
}
