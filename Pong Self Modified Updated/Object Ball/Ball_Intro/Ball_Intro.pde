/* To Do 
Separating Setup() from draw() from mousePressed() 
Purpose: have individual pong balls functioning 
See ballCounter Variable in driver global variables 
Note: should be static, encapsulated variable in Ball Class 
*/ 

// Global Variables and Other 
Ball[] balls = new Ball[10]; //Not just an array, but an array list 
int ballCounter = balls.length - balls.length; // How to get "Zero but use another value"

void setup() {
  size (500, 600); //fullScreen(), displayWidth, displayHeight;
  //
  balls[ballCounter] = new Ball(width, height);
  balls[ballCounter].gameStart(); //Completes Constructor, teaching opportunity
  //
  ballCounter += 1;
}//End setup() 

void draw() {
  background(255);
  for (int i = 0; i < ballCounter; i++) { //Controls each ball 
    balls[i].ballDraw(); //Variables and Constructor
    balls[i].gamePlay();
  }
}//End draw() 

void keyPressed() {
}//End keyPressed 

void mousePressed() {
  //println(ballCounter)
  if (ballCounter >= balls.length) { // Game Quit based on ball counting 
    exit(); //Eventually will become a button 
  } else {
    ballCounter += 1; //Note: sequentially, this incrementing creates a problem for the next for loop 
    // Thus, the FOR Loop deals with the difference between human and computer numbering. 
  }
  for (int i = ballCounter - 1; i < ballCounter; i++) { //Constructor 
    balls[i] = new Ball(width, height);
    balls[i].gameStart(); //Completes Constructor, teaching opportunity
  }
}//End mousePressed 
