//Main Program

//Global Variables and Other (Classes)
ArrayList<Shape> shapes = new ArrayList<Shape>();
// 
// Static Variables, processing, java specific, similar to final 
// See Circle Class
// 
/* To Do
Copy over prototyped Ball Class, illustrates modular programming & libraries 
*/

//Global Variables and Other
//Paddle paddle;
//
// From Ball_Intro Main Program
//Ball[] balls = new Ball[10]; //Not just an array, but an array list
//int ballCounter = balls.length - balls.length; // How to get "Zero but use another value"
//Boolean[] leftScoreOff = new Boolean [balls.length]; //links to score so code is skipped if ball is used once
//Boolean[] rightScoreOff = new Boolean [balls.length]; //links to score so code is skipped if ball is used once

void setup() {
  size(600, 500); //fullScreen(); // Geometry of displayWidth & displayHeight 
  // 
  //Population using Display Geometry 
  final int ballWidthStart = width * 1/2; //Garbage collected 
  final int ballHeightStart = height * 1/2; 
  final int ballDiameter = width * 1/50; 
  final int ballCounter = 10;
  Circle[] balls = new Circle[ballCounter];
  for (int i=0; i<ballCounter; i++) {
    balls[i] = new Circle(ballWidthStart, ballHeightStart, ballDiameter, ballDiameter);
    shapes.add(balls[i]);
  }
  //Incrementing to false
  //
  //Paddle 
  paddle = new Paddle(width, height); //For the Constructor
  //Rectangle leftPaddle 
  final int leftPaddleXStart = width * 1/40; //Garbage collected 
  final int leftPaddleYStart = (height * 1/2) - (height * 1/2) * 1/2; 
  final int leftPaddleWidthStart = width * 1/40; 
  final int leftPaddleHeightStart = height * 1/2; 
  Rectangle leftPaddle = new Rectangle(leftPaddleXStart, leftPaddleYStart, leftPaddleWidthStart, leftPaddleHeightStart);
  //Rectangle rightPaddle 
  final int rightPaddleXStart = width * 38/40; //Garbage collected 
  final int rightPaddleYStart = (height * 1/2) - (height * 1/2) * 1/2; 
  final int rightPaddleWidthStart = width * 1/40; 
  final int rightPaddleHeightStart = height * 1/2; 
  Rectangle rightPaddle = new Rectangle(rightPaddleXStart, rightPaddleYStart, rightPaddleWidthStart, rightPaddleHeightStart);
  //Rectangle leftScore 
  //Rectangle rightScore
  //
  //ArrayList Population, reminder, all variables and classes 
  //          will be garbage collected, local variables 
  shapes.add(ball);
  shapes.add(leftPaddle);
  shapes.add(rightPaddle);
  //
}//End setup 

void draw() {
  background(255); //Gray Scale
  paddle.paddleDraw();
  //draw Shapes
  for (int i = 0; i < shapes.size(); i++) {
    shapes.get(i).draw();
  } //End shapes.draw
  for ( int i = 0; i<ballCounter; i++ ) { //Controls each ball
    balls[i].ballDraw(); //Variables and Contructor
    balls[i].gamePlay();
    balls[i].directionYSetter(paddle.paddleXLeftGetter(), paddle.paddleYLeftGetter(), paddle.paddleXRightGetter(), paddle.paddleYRightGetter(), paddle.paddleWidthGetter(), paddle.paddleHeightGetter());
    if ( balls[i].ballLeftGoalGetter() == true && leftScoreOff[i] == false) {
      paddle.leftScoreSetter();
      leftScoreOff[i] = true;
    }
    if ( balls[i].ballRightGoalGetter() == true && rightScoreOff[i] == false) {
      paddle.rightScoreSetter();
      rightScoreOff[i] = true;
    }
  }
  //
}//End draw 

void keyPressed() {
  if (key == CODED && key == 'W' || key == 'w') paddle.upLeftGetter(); //Security Feature 
  if (key == CODED && key == 'S' || key == 's') paddle.downLeftGetter(); //Security Feature
  if (key == CODED && keyCode == UP) paddle.upRightGetter(); //Security Feature 
  if (key == CODED && keyCode == DOWN) paddle.downRightGetter(); //Security Feature 
}//End keyPressed 

void mousePressed() {
  // For balls
  if ( ballCounter >= balls.length ) { //Game Quit based on ball counting
    exit(); //Eventually will become a button
  } else { 
    ballCounter += 1; //Note: sequentially, this incrementing creates a problem for the next for loop
    // Thus, the FOR Loop deals with the difference between human and computer numbering.
  }
  for ( int i = ballCounter-1; i<ballCounter; i++ ) { //Constructor for other balls should not be run
    balls[i] = new Ball(width, height); 
  }
  //
}//End mousePressed
