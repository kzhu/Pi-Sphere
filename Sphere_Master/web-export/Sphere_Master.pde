import processing.opengl.*;
//import java.util.*;
//import java.math.BigDecimal;

Sphere mySphere;
String[] lines;

void setup() 
{
  size(500,500,OPENGL);
  mySphere = new Sphere();
  mySphere.init();
  //int[] PiArray = PI(10);
    
/*   String lines[] = loadStrings("pinumbers.txt");   
    int[] piInt = new int[lines.length];

   for (int i = 0; i < lines.length; i++)
   {
        //num[i] = lines.substring(i,i+1);
        //ellipse(i*10, 1, num[i], num[i]);
        
        piInt[i] = Integer.parseInt(lines[i]);
        
        println(piInt[i]);
   };
*/
}

void draw()
{
  mySphere.update();
  mySphere.render();
}

void mousePressed() {
 mySphere.addSphereItem();
};
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

   float xPos = 250;
   float yPos = 250;
   float zPos = 250;
   float radius = 50;
   
   ArrayList items = new ArrayList();
  
 public void Sphere() {
 };

 public void init() {
   
 };
 
 public void addSphereItem()
 {
   SphereItem si = new SphereItem();
   si.parentSphere = this;
   
   si.theta= random(PI*2);
   si.phi= random(PI*2);
   
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
 float theta;
 float phi;
 
 //Speed properties
 float thetaSpeed = 0;
 float phiSpeed = 0;
 //Size
 float itemSize = 5;
 
 String piDigits = "314159265358";
 int piCounter = 0;
 
 public void SphereItem() 
 {
 
 };

 public void init() {
 itemSize = random(5);
 thetaSpeed = 0.05;
 phiSpeed = 0.06;
 };

 public void update() 
 {
   theta += thetaSpeed;
   phi += phiSpeed;
   //println(piDigits.charAt(piCounter) - '0');
   //itemSize = piDigits.charAt(piCounter) - '0';   
   //println(Float.parseFloat(piDigits.charAt(piCounter)));
   char x = piDigits.charAt(piCounter);
  // println(x);
   //String y = Character.toString(x);
   //println(y);
   
   println(float(x));
   itemSize = float(x)/3;
   piCounter= (piCounter + 1) % (piDigits.length() - 1);
   
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

