Ball[] balls;

boolean reactionStarted;

void setup() {
 size(600,600);
 reactionStarted = false;
 balls = new Ball[350];
 for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(); // create new instance of Ball for each element in the array
 }
 //more code
}

void draw() {
  background(0);
  for (Ball ball : balls) {
    // if only the chain reaction has started
    if (reactionStarted) {
      for (Ball b : balls) {
        // check if it has joined the chain reaction
        if (b.getState() == 1) {
          // if it collides
           if (ball.distance(b) < (ball.getRad() + b.getRad())) {
             ball.setState(1);
           }
        }
      }
    }
  ball.move(); // move!
  }
}

//when mouse is clicked
void mouseClicked() {
  reactionStarted = true;
  balls[balls.length-1].setState(1); // set the last element of the array as the start of the chain reaction
  //balls[balls.length-1].setXY(mouseX, mouseY);
}