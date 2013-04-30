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
