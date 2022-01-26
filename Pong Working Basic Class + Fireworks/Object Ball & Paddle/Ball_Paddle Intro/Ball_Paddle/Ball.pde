class Ball {
  //Variables
  int ballX, ballY, ballMoveX, ballMoveY, directionX=0, directionY=0;
  int ballSpeedX, ballSpeedY;
  int ballStartX, ballStartY, ballDiameter; //Will be final variables
  color colour;
  int scorePlayer1, scorePlayer2;
  Boolean ballXLeftGoal=false, ballXRightGoal=false;
  Boolean ballXGoalOnce, createNextBall;
  //
  //int ballCount = 5; //requires pure java class for true static varaibles
  //needs to be coded first in Processing
  //
  //Constructor, populates the variables
  Ball(float widthParameter, float heightParameter) { //Passsing Geometry
    ballStartX = int(widthParameter/2); //will begin as one varaible, but might change b/c easter egg
    ballStartY = int(heightParameter/2); //see above
    this.ballX = ballStartX; //ALways starts in middle
    this.ballY = ballStartY;
    this.ballXLeftGoal = false;
    this.ballXRightGoal = false;
    this.ballXGoalOnce = false;
    this.createNextBall = false;
    ballDiameter = int(widthParameter/70); //Will soon need a procedure for this or a choice of code'
    this.ballSpeedX = int( random (1, 5) ); //Not best practice to repeat code, but OK
    this.ballSpeedY = int( random (1, 5) ); //Here b/c "next line"
    this.colour = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
  }//End Constructor
  //
  void ballDraw() {
    //Background here will cover each individual ball
    fill(colour);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
  }//End ballDraw
  //
  //Game Start
  void gameStart() { //Completes the Ball Constructor
    //This sets the random for the ball, commented out as an intentional mistake
    //Change this to be a ball speed
    directionX = int (random (-2, 2));
    while (directionX == 0) {
      directionX = int (random (-2, 2));
    }
    directionY = int (random (-2, 2));
    while (directionY == 0) {
      directionY = int (random (-2, 2));
    }
  } //End gameStart
  //
  void gamePlay() {
    //Scoring on Left and Right Goals, resetting variables to decrease system resourses
    if ( ballX < (width*0)+ballDiameter || ballX > width - ballDiameter) { //Net Detection
      if (ballX < (width*0)+ballDiameter ) { //Goal for left player
        scorePlayer1 = scorePlayer1 + 1;
        ballX = 0+(ballDiameter/4);
        ballXRightGoal = true;
        ballXGoalOnce = true;
        createNextBall = true;
        ballY = ballY; //Variable becomes "final" here
      }
      if ( ballX > width - ballDiameter ) { //Goal for right player
        scorePlayer2++;
        ballX = (width)-(ballDiameter/4);
        ballXLeftGoal = true;
        ballXGoalOnce = true; //Passing to Fireworks
        createNextBall = true;
        ballY = ballY; //Variable becomes "final" here
      }
    } //End Net Detection
    //println("1.", ballXLeftGoal, "\t2.", ballXRightGoal);
    //
    //Top and Bottom Boundary Bounce, accounting for increased ball movement per "step"
    if ( (ballY > 0 && ballY <= 0+(ballDiameter) ) || ( ballY < height && ballY >= height-(ballDiameter) )   ) { //ballY bounce area wider than below
      directionY = directionY * (-1);
    }
    if (ballY < 0+(ballDiameter/2) ) { //Redraw to catch when the bounce has not happened in previous IF
      ballY = 0+(ballDiameter/2);
    }
    if (ballY > height-(ballDiameter/2) ) { //Redraw to catch when the bounce has not happened in first IF
      ballY = height-(ballDiameter/2);
    }
    //
    //Ball "Step"
    if (ballXLeftGoal == true || ballXRightGoal == true) { //EMPTY IF to skip ball arithmetic, when score happens
    } else {
      ballMoveX = ballSpeedX*directionX;
      ballMoveY = ballSpeedY*directionY;
      ballX += ballMoveX;
      ballY += ballMoveY;
    }
    //
    //Bouncing off Left and Right Paddle
    //See directionYSetter that runs in main program
    //
  }//End gamePlay
  //
  //Getters and Setters
  Boolean ballLeftGoalGetter() { //Score Communication
    return ballXLeftGoal;
  }
  Boolean ballRightGoalGetter() { //Score Communication
    return ballXRightGoal;
  }
  int ballXGetter() {
    return ballX;
  }//End ballXGetter
  int ballYGetter() {
    return ballY;
  }//End ballYGetter
  int ballDiameterGetter() {
    return ballDiameter;
  }//End ballDiameterGetter
  void directionYSetter(int paddleXLeft, int paddleYLeft, int paddleXRight, int paddleYRight, int paddleWidth, int paddleHeight) {
    if (ballX <= width*1/4) { //Left Paddle Only
      if ( ballY >= paddleYLeft && ballY <= paddleYLeft+paddleHeight ) {
        if (ballX <= paddleXLeft+paddleWidth+ballDiameter ) directionX = directionX * (-1); //Could be one line, see below
      }//End ballY IF
    }
    //Right Paddle Only, one line example, cascading if
    if (ballX >= width*3/4) if ( ballY >= paddleYRight && ballY <= paddleYRight+paddleHeight ) if (ballX >= paddleXRight - ballDiameter) directionX = directionX * (-1); 
  }//End directionYSetter
  //
}//End Ball
