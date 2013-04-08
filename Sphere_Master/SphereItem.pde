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
 
 //String piDigits = "314159265358";
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
