class Ball {
  
  float x;
  float y;
  float rad;//this is actually the diameter
  color c;
  float dx;
  float dy;
  int state;
  
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
 }
 
 void move() {
   ellipse(x,y,rad,rad);
   x = x+dx;
   y = y+dy;
   bounce();
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
}  
 