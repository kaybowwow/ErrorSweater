class Ball {
  
  float x;
  float y;
  float rad;//this is actually the diameter
  color c;
  float dx;
  float dy;
  int state;
  boolean expand = false;
  
 Ball() {
  
   float r = random(256);
   float g = random(256);
   float b = random(256);
   c = color(r,g,b);
   rad = 20;
   x = random((width-width/3)) + rad;
   y = random((height-width/3)) + rad;
   dx = random(5)-3;
   dy = random(5)-3;
   state = 0;
 }
 
 void setState(int x) {
    state = x;
 }
 int getState() {
   return state;   
 }
 float getX() {
  return x; 
 }
 float getY() {
  return y; 
 }
 float getRad() {
  return rad; 
 }
 void setXY(float inputX, float inputY) {
  x = inputX;
  y = inputY;
 }
 
 void move() {
   if (expand = true) {
     die();
   }
   else if (state == 1) {
     expand();
   }
   ellipse(x,y,rad,rad);
   x = x+dx;
   y = y+dy;
   bounce();
 }

void expand() {
  dx = 0;
  dy = 0;
  if (rad > 0 && rad < 70) {
    rad += 1; 
  }
  if (rad == 70) {
    expand = true; 
  }
}

void die() {
  if (rad > 0) {
    rad -= 0.1; 
  }
}

 //if ball reaches border, bounce
 void bounce() {
   if (checkCollisionX()) { 
     dx = -dx;
   }
   if (checkCollisionY()) { 
     dy = -dy;
   }     
 }
 
 boolean checkCollisionX() {
   if (x > 600-rad/2 || x < 0+rad/2) return true;
   return false;
 }
 
 boolean checkCollisionY() {
   if (y > 600-rad/2 || y < 0+rad/2) return true;
   return false; 
 }
 
 float distance (Ball ball) {
    return sqrt ( pow ((x-ball.getX()), 2) + pow ((y-ball.getY()), 2)); 
 }
 
}  
 