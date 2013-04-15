import processing.opengl.*;
//import java.util.*;
//import java.math.BigDecimal;

Sphere mySphere;
String[] lines;
//float rotation = PI;
float ang = 0, ang2 = 0, ang3 = 0, ang4 = 0;
float px = 0, py = 0, pz = 0;

void setup() 
{
  size(500,500,OPENGL);
  mySphere = new Sphere();
  mySphere.init();
  frameRate(50);
  noStroke();
  
 // camera(70.0, 35.0, 120.0, 50.0, 50.0, 0.0, 
 //      0.0, 1.0, 0.0);
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
  beginCamera();
  /*
  camera(width/2 + px,height/2 + py , -700+pz, 0,0,0, 0,0,1);
  
   px = sin(radians(ang3)) * 170;
   py = cos(radians(ang3)) * 300;
   pz = sin(radians(ang4)) * 500;
  */

  mySphere.update();
  mySphere.render();

  camera();

   px = sin(radians(ang3)) * 170;
   py = cos(radians(ang3)) * 300;
   pz = sin(radians(ang4)) * 500;
   translate(width/2 + px, height/2 + py, -700+pz);
   rotateX(sin(radians(ang2)) * 120);
   rotateY(sin(radians(ang2)) * 50);
   rotateZ(sin(radians(ang2)) * 65);
   
      //rect(-75, -50, 75, 100);
   
   ang2 += 0.01;
   ang3 += 2.0;
   ang4 += 0.75;
  
  endCamera();
  


//  println(rotation);
//  rotateY(map(mouseX, 0, width, -PI, PI));
//  rotateX(map(mouseY, 0, height, -PI, PI));
//  rotate(rotation);
//  rotation = rotation + PI/100;
}

void mousePressed() {
 mySphere.addSphereItem();
};
