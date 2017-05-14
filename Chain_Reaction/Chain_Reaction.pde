Ball[] balls;

boolean reactionStarted;

void setup() {
 size(600,600);
 reactionStarted = false;//state vars much?
 balls = new Ball[350];
 for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
 }
 //more code
}

void draw() {
  background(0);
  for (Ball ball : balls) {
    if (reactionStarted) {
      for (Ball b : balls) {
        if (b.getState() == 1) {
           if (ball.distance(b) < (ball.getRad() + b.getRad())) {
             ball.setState(1);
           }
        }
      }
    }
  ball.move();
  }
}


//when mouse is clicked
void mouseClicked() {
  reactionStarted = true;
  balls[balls.length-1].setState(1);
  //balls[balls.length-1].setXY(mouseX, mouseY);
}