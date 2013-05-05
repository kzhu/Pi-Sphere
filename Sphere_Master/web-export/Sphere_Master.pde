import processing.opengl.*;
//import java.util.*;
//import java.math.BigDecimal;

Sphere mySphere;
String[] lines;
//float rotation = PI;
float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
float px = 0, py = 0, pz = 0;
int renderCounter = 0;

void setup() 
{
  size(800,800,OPENGL);
  mySphere = new Sphere();
  mySphere.init();
  frameRate(1000);
  noStroke();
  mySphere.addSphereItem();
}

void draw()
{
  //background(111);
  //println("in Camera");
 // beginCamera();
// camera();
  /*
   px = sin(radians(ang3)) * 170;
   py = cos(radians(ang3)) * 300;
   pz = sin(radians(ang4)) * 500;
   translate(width/2 + px, height/2 + py, -700+pz);
   rotateX(sin(radians(ang2)) * 120);
   rotateY(sin(radians(ang2)) * 50);
   rotateZ(sin(radians(ang2)) * 65);
  */
  
  px =250+ sin(radians(ang3)) * 470;
  py =400;  //    250+ cos(radians(ang3)) * 170;
  pz =-250+ sin(radians(ang3)) * 170;
      
  // ang2 += 0.01;
   ang3 += 2.0;
  // ang4 += 0.75;
  
//  camera (px, py, pz, 250, 250, 250,  0, 1, 0);  
  
  if (renderCounter < 400)
  {
    mySphere.update();
    mySphere.render();
    renderCounter++;
    //println(renderCounter);
  }
 // endCamera();

}
/*
void mousePressed() {
 mySphere.addSphereItem();
};
*/
// Calculate PI with arbitrary precision
// ( source: http://java.sun.com/docs/books/tutorial/rmi/client.html )

// Machins Formula :  pi/4 = 4*arctan(1/5) - arctan(1/239)
//import java.math.BigDecimal;
/*

public int[] PI(int n) 
{
  println("PI Executed");
  BigDecimal FOUR = BigDecimal.valueOf(4);
  int s = n + 5;
  BigDecimal atan239 = atan(239, s);
  BigDecimal atan5 = atan(5, s);

  BigDecimal pi = atan5.multiply(FOUR).subtract(atan239).multiply(FOUR);
  BigDecimal digits = pi.setScale(n, BigDecimal.ROUND_HALF_UP);
  
  String raw = digits.toString(); 
  int[] num = new int[raw.length()];

   for (int i = 0; i < raw.length(); i++) //cycle through and assign digits to Int array
   {
        num[i] = raw.charAt(i) - '0'; // Find Ascii character and minus '0'
        print(raw.length());
   }  
   
   return num; // Return the Int array
}
 
// Power Series expansion : atan(x) = x - (x^3)/3 + (x^5)/5 - (x^7)/7 +  (x^9)/9 ...
/*
BigDecimal atan(int invx, int s) {
  int round = BigDecimal.ROUND_HALF_EVEN;
  BigDecimal r, n, t, invx2 = BigDecimal.valueOf(invx * invx);
  r = n = BigDecimal.ONE.divide(BigDecimal.valueOf(invx) , s, round);
  int i = 1;
  do {
    n = n.divide(invx2, s, round);
    t = n.divide(BigDecimal.valueOf(2*i+1), s, round);
    r = (i%2 == 0) ? r.add(t) : r.subtract(t);
    i++;
  } while (t.compareTo(BigDecimal.ZERO) != 0);
  
  return r;
}
*/
class Sphere {

   float xPos = 400;
   float yPos = 400;
   float zPos = 400;
   float radius = 100;
   
   ArrayList items = new ArrayList();
  
 public void Sphere() {
 };

 public void init() {
   
 };
 
 public void addSphereItem()
 {
   SphereItem si = new SphereItem();
   si.parentSphere = this;
   
   // si.theta= random(PI*2);
   // si.phi= random(PI*2);
   
   items.add(items.size(),si);
   si.init();
   
   println("addsphere");
 }

 public void update() 
 {
   for (int i = 0; i < items.size(); i ++) 
    {
       SphereItem si = (SphereItem) items.get(i);
       si.update();
    };
 };

 public void render() {
   //Move to the center point of the sphere
   translate(xPos, yPos, zPos);
   //Mark our position in 3d space
   pushMatrix();
    //Render each SphereItem
    for (int i = 0; i < items.size(); i ++) 
    {  
      SphereItem si = (SphereItem) items.get(i);
      si.render();
    };
    popMatrix();
 };
};
class SphereItem {

 Sphere parentSphere;
 float radius;
 float theta = 0;
 float phi=0;
 
 //Speed properties
 float thetaSpeed = 0;
 float phiSpeed = 0;
 //Size
 float itemSize;
 
 //String piDigits = "314159265358";
 int piCounter = 0;
 int phiCounter = 0;
 
 public void SphereItem() 
 {
 
 };

 public void init() {
 //itemSize = random(5);
 thetaSpeed = PI/10;
 phiSpeed = PI/10;
 };

 public void update() 
 {
  
   if (phiCounter == 20)
   {
    phi += phiSpeed;
    phiCounter = 0;
   }
    theta += thetaSpeed;
     phiCounter++;
   
   //println(piDigits.charAt(piCounter) - '0');
   //itemSize = piDigits.charAt(piCounter) - '0';   
   //println(Float.parseFloat(piDigits.charAt(piCounter)));
   //char piSize = piDigits.charAt(piCounter);
  // println(x);
   //String y = Character.toString(x);
   //println(y);
   
   String lines[] = loadStrings("pinumbers.txt");
   
   //println(float(piSize));
   itemSize = float(lines[piCounter])/3; // Set Item size as a x
   piCounter= (piCounter + 1) % (lines.length - 1);
   
 };

 public void render() {
   
 //Get the radius from the parent Sphere
 float r = parentSphere.radius;
 //Convert spherical coordinates into Cartesian coordinates
 float x = cos(theta) * sin(phi) * r;
 float y = sin(theta) * sin(phi) * r;
 float z = cos(phi) * r;
 
 //Mark our 3d space
 pushMatrix();
 //Move to the position of this item
 translate(x,y,z);
 //Set the fill colour
 fill(0,0,0,150);
 noStroke();
 //Draw a circle
 ellipse(0,0,itemSize,itemSize);
 //Go back to our position in 3d space
 popMatrix();
   
 };
 
};

// atan function
/*
public BigDecimal atan(int invx, int s) 
{
  int round = BigDecimal.ROUND_HALF_EVEN;
  BigDecimal r, n, t, invx2 = BigDecimal.valueOf(invx * invx);
  r = n = BigDecimal.ONE.divide(BigDecimal.valueOf(invx) , s, round);
  int i = 1;
 
  do {
    n = n.divide(invx2, s, round);
    t = n.divide(BigDecimal.valueOf(2*i+1), s, round);
    r = (i%2 == 0) ? r.add(t) : r.subtract(t);
   // println("atan loop/ " + i);
    i++;
  } while (t.compareTo(BigDecimal.ZERO) != 0);
  
  return r;
}
*/

