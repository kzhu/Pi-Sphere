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
