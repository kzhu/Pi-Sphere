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

