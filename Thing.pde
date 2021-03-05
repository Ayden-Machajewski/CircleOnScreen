class Thing {
  
  float attraction = 0.05;
  
  color c;
  PVector pos;
  float rad;
  PVector speed;
  
  float capX = 1;
  float capY = 1;
  
  float max = 2;
  
  ArrayList<Thing> connections = new ArrayList<Thing>();
  
  Thing(color tempC, PVector pos, float tempRad, PVector speed){
    c = tempC;
    this.pos = pos;
    rad = tempRad;
    this.speed = speed;
  }
 
  void display(){
    noStroke();
    fill(c);
    circle(pos.x, pos.y, rad);
  }
  
  void AddConnection(Thing newConnection) {
    
    connections.add(newConnection);
    print("Added a connection");
    
  }
  
  void AddForce(float deltaTime) {
    
    for (int i = 0; i < connections.size(); i++) {
      float dirX = connections.get(i).pos.x - pos.x;
      float dirY = connections.get(i).pos.y - pos.y;
      PVector dir = new PVector(dirX, dirY);
      
      if (dir.mag() < rad) {
        speed = new PVector(0,0);
        pos.x += dirX * ((rad-dir.mag())/dir.mag());
        pos.y += dirY * ((rad-dir.mag())/dir.mag());
        
      } else {
      
      dir.setMag(attraction * deltaTime * 0.001);
      
      speed.x += dir.x;
      speed.y += dir.y;
      
      }
    }
    
  }
  

  void move(float deltaTime) {
    AddForce(deltaTime);
    
    pos.x += speed.x * deltaTime * 0.001;
    pos.y += speed.y * deltaTime * 0.001;
    
    speed.x *= 0.99;
    speed.y *= 0.99;
    
    if (speed.y > capX) {
      speed.x = capX;
    }
    if (speed.y < -capX){
      speed.x = -capX;
    }
    if (speed.x > capY) {
      speed.y = capY;
    }
    if (speed.x < -capY) {
      speed.y = -capY;
    }
      
    pos.x = constrain(pos.x, 0, 800);
    pos.y = constrain(pos.y, 0, 800);
    
    if (speed.mag() > max) {
      speed.setMag(max);
    }
  }
}
