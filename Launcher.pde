//Thing thing1;
//Thing thing2;
ArrayList<Thing> things = new ArrayList<Thing>();
//int count = 50;
int countX = 10;
int countY = 10;

float size = 25;
float damp = 0.5;

float time;
float deltaTime;

Thing clickedThing;

void setup() {
  size(800,800); 
  
  //thing1 = new Thing(color(238, 200, 19), new PVector(400, 400), 50, new PVector(1, 1)); 
  //thing2 = new Thing(color(100, 10, 210), new PVector(300, 300), 50, new PVector(-1, -1));
  
  /*for (int i = 0; i < count; i++) {
    things.add(new Thing(color(random(0,255),random(0,255),random(0,255)), new PVector(random(size, 800 - size), random(size, 800 - size)), size, new PVector(0, 0)));
  }*/
  
  for (int i = 0; i < 800; i += 800/countX) {
    for (int j = 0; j < 800; j += 800/countY) {
      things.add(new Thing(color(random(0,255),random(0,255),random(0,255)), new PVector(i + 800/(countX*2), j + 800/(countY*2)), size, new PVector(0, 0)));
    }
  }
  
  //thing1.AddConnection(thing2);
  //thing2.AddConnection(thing1);
}


void draw() {
  float deltaTime = millis() - time; 
  float time = millis();
  
  background (15, 123, 100);
  
  for (int i = 0; i < things.size(); i++) {
    things.get(i).display();
    things.get(i).move(deltaTime);
  }
  //collisions();
  
  //thing1.display();
  //thing1.move(deltaTime);
  //thing2.display();
  //thing2.move(deltaTime);
  
}

void mousePressed() {
  for (int i = 0; i < things.size(); i++) {
    PVector dist = new PVector(things.get(i).pos.x - mouseX, things.get(i).pos.y - mouseY);
    if (dist.mag() < size) {
      clickedThing = things.get(i);
      break;
    }
  }
}
  
void mouseReleased() {
  for (int i = 0; i < things.size(); i++) {
    PVector dist = new PVector(things.get(i).pos.x - mouseX, things.get(i).pos.y - mouseY);
    if (dist.mag() < size) {
      clickedThing.AddConnection(things.get(i));
      things.get(i).AddConnection(clickedThing);
      break;
    }
  }
}
