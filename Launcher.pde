Thing thing1;


void setup() {
  size(800,800); 
  
  thing1 = new Thing(color(238, 200, 19), 400, 400, 50, 0, 0); 
  
}


void draw() {
  background (15, 123, 100);
  thing1.display();

} 
