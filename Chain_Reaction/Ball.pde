class Ball {
  
  float x; //xcor
  float y; //ycor
  float rad; //radius
  color c; //color
  float dx; //delta x
  float dy; //delta y
  int state; // 0 if not part of the reaction, 1 if part of the reaction
  boolean expand = false; //if true, then ball is expanding and must die
  
 Ball() {
   float r = random(256);
   float g = random(256);
   float b = random(256);
   c = color(r,g,b);
   rad = 20;
   x = random((width-width/2)) + r;
   y = random((height-height/2)) + r;
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
  return rad/2; 
 }
 void setXY(float inputX, float inputY) {
  x = inputX;
  y = inputY;
 }
 
 void move() {
   //if ball is expanding, then it must die
   if (expand == true) {
     die();
   }
   else if (state == 1) {
     expand();
   }
   ellipse(x,y,rad,rad);
   fill(c); //fill the ball with the color of value c
   x = x+dx; //move in x-direction
   y = y+dy; //move in y-direction
   bounce();
 }

void expand() {
  //ball stops moving
  dx = 0;
  dy = 0;
  //expand
  if (rad > 0 && rad < 70) {
    rad += 1; 
  }
  if (rad == 70) {
    expand = true; 
  }
}

void die() {
  if (rad > 0) {
    rad -= 1; 
  }
  //necessary so that a "dead" ball/point wont trigger expansion
  if (rad <= 0) {
    state = 0;
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
 
 //checks collision of ball with left and right borders
 boolean checkCollisionX() {
   if (x > 600-rad/2 || x < 0+rad/2) return true;
   return false;
 }
 
 //checks collision of ball with top and bottom borders
 boolean checkCollisionY() {
   if (y > 600-rad/2 || y < 0+rad/2) return true;
   return false; 
 }
 
 //calculates distance between 2 balls
 float distance (Ball ball) {
    return sqrt ( pow ((x-ball.getX()), 2) + pow ((y-ball.getY()), 2)); 
 } 
}  
 