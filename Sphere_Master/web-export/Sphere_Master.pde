import processing.opengl.*;
import java.util.*;

Sphere mySphere;

void setup() 
{
  size(500,500,OPENGL);
  mySphere = new Sphere();
  mySphere.init();
}

void draw()
{
  mySphere.update();
  mySphere.render();
}

void mousePressed() {
 mySphere.addSphereItem();
};

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
  
 public void SphereItem() 
 {
 
 };

 public void init() {
 itemSize = random(5);
 thetaSpeed = random(-0.01, 0.01);
 phiSpeed = random(-0.01, 0.01);
 };

 public void update() 
 {
   theta += thetaSpeed;
   phi += phiSpeed;
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

