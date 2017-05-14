Ball[] balls;

boolean reactionStarted;

void setup() {
 size(600,600);
 reactionStarted = false;//state vars much?
 balls = new Ball[25];
 for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
 }
 //more code
}

void draw() {
  background(0);
  for (int i = 0 ; i < balls.length ; i++) {
    balls[i].move();
    collision();
  }
}

void collision() {
  for (int x = 0 ; x < balls.length-1 ; x ++) {
      int y = (int)(x + random(balls.length-x));    
      float tmpx = balls[x].x - balls[y].x;
      float tmpy = balls[x].y - balls[y].y;
      float dist = sqrt(tmpx*tmpx + tmpy*tmpy);
      if (dist < balls[x].rad/2 + balls[y].rad/2) {
          balls[x].dx = -balls[x].dx;
          balls[x].dy = -balls[x].dy;
          balls[y].dx = -balls[y].dx;
          balls[y].dy = -balls[y].dy;
        }
      }
    }