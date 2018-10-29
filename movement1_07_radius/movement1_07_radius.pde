import de.bezier.data.*;
import processing.serial.*;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
int newval =  0;
String aan1 = "ON1";
String aan2 = "ON2";
String aan3 = "ON3";
String af = "OFF";

XlsReader reader;

ArrayList<Instr> plist = new ArrayList<Instr>();
ArrayList<Orbit> olist = new ArrayList<Orbit>();
ArrayList<Float> radius = new ArrayList<Float>();
ArrayList<PVector> center = new ArrayList<PVector>();
ArrayList<PVector> velocity = new ArrayList<PVector>();
ArrayList<Integer> Alpha = new ArrayList<Integer>();


int fillColorInst;
int fillColorOrbit;
int alphaOrbit;
int grStroke;
int alStroke;
int alphas;
float size;
float orbitSize;
int orbitSpeed;
float instrSpeed = 0.02;
float radi;
PVector centers;
PVector velocitys;
float myX;
float myY;
float V1;
float V2;
color strokeP;
float strokeSizeP;
color strokeO = 0;
float strokeSizeO;

float mouseposX;
float mouseposY;
// action based var should stay for main
Boolean addDone = true;
Boolean addAdd = false;
Boolean remove = false;
int whichOrbitA = 4;
int whichOrbitR = 4;
char letter;
Boolean audience = false;
color partColor = color(0,0,255,255);

void setup() {
  size(800, 600);
  String portName = Serial.list()[9]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  

  reader = new XlsReader( this, "datasheet.xls" );
  //calling from datasheet 
  //COLOR 
  fillColorInst = reader.getInt(4, 2);
  fillColorOrbit = reader.getInt(4, 6);
  alphaOrbit = reader.getInt(5 ,6);
  //SIZE
  size = reader.getFloat(2, 2);
  orbitSize = size/6;
  //RADIUS
  radi = reader.getFloat(3, 2);
  //LOCATION
  myX = reader.getFloat(9, 2);
  myY = reader.getFloat(10, 2);
  centers = new PVector(myX, myY);
  //VELOCITY
  V1 = reader.getFloat(11, 2);
  V2 = reader.getFloat(12, 2);
  velocitys = new PVector(V1, V2);
  //ALPHA
  alphas = reader.getInt(5, 2);
  //STROKE
  grStroke = reader.getInt(7, 2);
  alStroke = reader.getInt(8, 2);
  strokeSizeP = reader.getInt(6, 2);

  // first instance of objects in the array
  plist.add(new Instr(fillColorInst, alphas, grStroke, alStroke, size, strokeP, strokeSizeP));
  olist.add(new Orbit(fillColorOrbit, alphaOrbit, orbitSize, strokeO, strokeSizeO));
  radius.add(radi);
  center.add(centers);
  velocity.add(velocitys);
  Alpha.add(alphas);
}

void draw() {
  background(0);
 
  if ( myPort.available() > 0 ) 
  {  // If data is available,
    //val = myPort.readStringUntil('\n');   // read it and store it in val
    val = myPort.readString(); 
  
  if(audience){
  if (val.equals(aan1) || val.equals(aan2) || val.equals(aan3))
  { 
    addAdd = true;
    remove = false;
    println("adding");
    
    if(val.equals(aan1)){
      partColor = color(149,234,222); //50,123,255
    }
     if(val.equals(aan2)){
      partColor = color(149,157,234); //12,130,206
    }
     if(val.equals(aan3)){
      partColor = color(234,149,149);// 94,60,175
    }
    //partColor 
  }
  }
  
  if (val.equals(af))
  {
   addAdd = false;
   remove = true;
   println("removing");
  }
 
  }
println("Audience:"+audience);
  mouseposX = mouseX;
  mouseposY = mouseY;
  //changing size with mouse input on X axis
  float m = map(mouseposX, 0, width, 1, 200);
  //changing radius of instr 
  float r = map(mouseposX, 0, width, 5, 300);
  // changing radius of orbit based on radius of instr (r)
  float s = map(r, 5, 500, 4, 100);
  // converts s to interger 'orbitSpeed'
  orbitSpeed = int(s);

  translate(width/2, height/2);
  
  for (int i = 0; i < plist.size (); i++) {
    Instr ps = plist.get(i); 
    Orbit os = olist.get(i);
    Float rs = radius.get(i);
    PVector cs = center.get(i);
    int al = Alpha.get(i);
    // println(rs);
    println(r);
    // adding new radius based on size to old radius
    rs = rs+r;
    // orbit size base on 'm' which is instr size
    orbitSize = m/6;
    
    ps.run(rs, cs, m, instrSpeed, al, 255);
    os.run(cs, orbitSize, orbitSpeed);

    // associate whichOrbitA to i so that it can only add to that one based on keys
    if ((whichOrbitA -1) == i) {
      os.addMe(addAdd, partColor);
    }
   
    if ((whichOrbitR -1) == i) {
      os.removeMe(remove);
    }
  }
   addAdd = false;
   remove = false;
}

void keyPressed() {

  if (key == 'p' && plist.size() < 4) {
    int addNum = plist.size();
    println(addNum);
    fillColorInst = reader.getInt(4, 2+addNum);
    size = reader.getFloat(2, 2+addNum);
    orbitSize = size/4;
    radi = reader.getFloat(3, 2+addNum);


    // PVECTOR Centers
    myX = reader.getFloat(8, 2+addNum);
    myY = reader.getFloat(9, 2+addNum);
    centers = new PVector(myX, myY);

    V1 = reader.getFloat(10, 2+addNum);
    V2 = reader.getFloat(11, 2+addNum);
    velocitys = new PVector(V1, V2);

    alphas = reader.getInt(5, 2+addNum);
    println("alpha" + alphas);
    
     grStroke = reader.getInt(7, 2+addNum);
  alStroke = reader.getInt(8, 2+addNum);
  strokeSizeP = reader.getInt(6, 2+addNum);

    // adding planet
    plist.add(new Instr(fillColorInst, alphas, grStroke, alStroke, size, strokeP, strokeSizeP));
    olist.add(new Orbit(fillColorOrbit, alphaOrbit, orbitSize, strokeO, strokeSizeO));
    radius.add(radi);
    center.add(centers);
    velocity.add(velocitys);
    Alpha.add(alphas);
  }
  if (key == 'x') {
    for (int i = 0; i < Alpha.size (); i++) {
      alphas = reader.getInt(5, 7+i);
      Alpha.set(i, alphas);
      println(Alpha.get(i));
    }
  }
  
   if (key == 'z') {
    for (int i = 0; i < Alpha.size (); i++) {
      alphas = reader.getInt(5, 2+i);
      Alpha.set(i, alphas);
      println(Alpha.get(i));
    }
  }
  
    if (key == 'q') {
      audience = true;
    }
    if (key == 'm') {
      audience = false;
    }
}


void keyReleased() {
  addDone = true;
  addAdd = false;
  remove = false;
}

