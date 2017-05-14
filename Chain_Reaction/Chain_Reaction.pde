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

//if distance between 2 balls is less than their radii combined, 
// then they bounce off of each other
//the balls kind of bounce , i don't know how to implement this :(
void collision() {
  if (reactionStarted) {
    for (int x = 0 ; x < balls.length-1 ; x ++) {
        int y = (int)(x + random(balls.length-x-1));    
        float tmpx = balls[x].x - balls[y].x;
        float tmpy = balls[x].y - balls[y].y;
        float dist = sqrt(tmpx*tmpx + tmpy*tmpy);
        if (dist < balls[x].rad/2 + balls[y].rad/2) {
          pop(balls[x]);
          pop(balls[y]);
        }
    }
  }
}

//when mouse is clicked
void mouseClicked() {
  if (reactionStarted)  reactionStarted = false;
  else { reactionStarted = true; }
}