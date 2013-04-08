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
