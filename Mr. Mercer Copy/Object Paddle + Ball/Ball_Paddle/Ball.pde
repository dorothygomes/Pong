class Ball {
  //Variables
  int ballX, ballY, ballMoveX, ballMoveY, directionX=0, directionY=0;
  int ballSpeedX, ballSpeedY;
  int ballStartX, ballStartY, ballDiameter; //Will be final variables
  color colour;
  int scorePlayer1, scorePlayer2;
  Boolean ballXGoal;
  //
  //int ballCount = 5; //requires pure java class for true static varaibles
  //needs to be coded first in Processing
  //
  //Constructor, populates the variables
  Ball(float width, float height) { //Passsing Geometry
    ballStartX = int(width/2); //will begin as one varaible, but might change b/c easter egg
    ballStartY = int(height/2); //see above
    this.ballX = ballStartX; //ALways starts in middle
    this.ballY = ballStartY;
    this.ballXGoal = false;
    ballDiameter = int(width/70); //Will soon need a procedure for this or a choice of code'
    ballSpeedX = int( random (1, 5) ); //Not best practice to repeat code, but OK
    ballSpeedY = int( random (1, 5) ); //Here b/c "next line"
    colour = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    //gameStart(); //Alternate fix, full encapsulation
  }//End Constructor
  //
  void ballDraw() {
    //Background here will cover each individual ball
    fill(colour);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
    fill(0); //Reset fill
  }//End ballDraw
  //
  void gameStart() { //Complets the Ball Constructor, should be combined with speed
    while ( directionX == 0 ) {
      directionX = int (random (-2, 2) );
    }//End WHILE
    while ( directionY == 0 ) {
      directionY = int (random (-2, 2) );
    }//End WHILE
  }//End gameStart
  //
  void gamePlay() {
    //Scoring on Left and Right Goals, resetting variables to decrease system resourses
    if ( ballX < (width*0)+ballDiameter || ballX > width - ballDiameter) { //Net Detection
      ballXGoal = true;
      if (ballX < (width*0)+ballDiameter ) { //Goal for left player
        ballX = (width*0)+(ballDiameter/4);
        ballY = ballY; //Variable becomes "final" here      
      }
      if ( ballX > width - ballDiameter ) { //Goal for right player
        ballX = (width)-(ballDiameter/4);
        ballY = ballY; //Variable becomes "final" here      
      }
    } //End Net Detection
    //
    //Top and Bottom Boundary Bounce, accounting for increased ball movement per "step"
    // Bounce of Top and Bottom: bounce is a range and we move the ball if out-of-bounds
    if ( (ballY >= height*0 && ballY <= height*0+ballDiameter) || ( ballY <= height && ballY >= height-ballDiameter ) ) directionY =  directionY * (-1);
    if ( ballY < 0 || ballY > height ) {
      directionY =  directionY * (-1);
      if (ballY < 0) ballY = height*0 - (ballDiameter/2);
      if (ballY > height) ballY = height - (ballDiameter/2);
    }
    //
    //Ball "Step"
    if (ballXGoal == true) { //EMPTY IF to skip ball arithmetic, when score happens
    } else {
      ballMoveX = ballSpeedX*directionX;
      ballMoveY = ballSpeedY*directionY;
      ballX += ballMoveX;
      ballY += ballMoveY;
    }
    //
  }//End gamePlay
  //
}//End Ball
