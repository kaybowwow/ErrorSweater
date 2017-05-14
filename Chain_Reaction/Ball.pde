class Ball {
  
  float x;
  float y;
  float rad;
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
   dx = random(10)-3;
   dy = random(10)-3;
 }
 
 void move() {
   ellipse(x,y,rad,rad);
   x = x+dx;
   y = y+dy;
   bounce();
 }
   
 void bounce() {
   if (checkCollisionX()) { 
     dx = -dx;
   }
   if (checkCollisionY()) { 
     dy = -dy;
   }     
 }
 
 boolean checkCollisionX() {
   if (x > 600-rad || x < 0+rad) return true;
   return false;
 }
 
 boolean checkCollisionY() {
   if (y > 600-rad || y < 0+rad) return true;
   return false; 
 }
   
}
  
 