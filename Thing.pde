class Thing {
  color c;
  float xPos;
  float yPos;
  float rad;
  float xSpeed;
  float ySpeed;
  int connect; 
  
  
  
  Thing( color tempC, float tempXpos, float tempYpos, float tempRad, float tempXspeed, float tempYspeed){
  
    c = tempC;
    xPos = tempXpos;
    yPos = tempYpos;
    rad = tempRad;
    xSpeed = tempXspeed;
    ySpeed = tempYspeed;
  }
 
  void display(){
    noStroke();
    fill(c);
    circle(xPos, yPos, rad);
  }
/*   
  void move() {
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed; 
    
    
    
  }
*/

}
