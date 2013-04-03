class SphereItem {

 Sphere parentSphere;
 float radius;
 float theta;
 float phi;
  
 public void SphereItem() {
 };

 public void init() {
 };

 public void update() {
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
 ellipse(0,0,5,5);
 //Go back to our position in 3d space
 popMatrix();
   
 };
 
};
