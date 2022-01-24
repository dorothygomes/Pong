class Circle extends Shape {
  //Variables
  int ballMoveX, ballMoveY, directionX=0, directionY=0;
  int ballSpeedX, ballSpeedY;
  color colour, reset=0;
  int scorePlayer1, scorePlayer2;
  Boolean ballXGoal;
  //
  //Static Variables exist without a Constructor
  //static int ballWidthStart, ballHeightStart, ballDiameter;
  //int ballCount = 5; //requires pure java class for true static varaibles
  //needs to be coded first in Processing
  //
  //Constructor
  Circle(float x, float y, float w, float h) {
    super(x, y, w, h);
    //
    this.ballXGoal = false;
    ballSpeedX = int( random (1, 5) ); //Not best practice to repeat code, but OK
    ballSpeedY = int( random (1, 5) ); //Here b/c "next line"
    colour = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    while ( directionX == 0 ) {
      directionX = int (random (-2, 2) );
    }//End WHILE
    while ( directionY == 0 ) {
      directionY = int (random (-2, 2) );
    }//End WHILE
  }//End Constructor
  //
  void draw() {
    fill(colour);
    ellipse(x, y, w, h);
    fill(reset); //Reset fill
    ballPlay();
  }//End draw()
  //
  //Add specific procedures (code) here
  void ballPlay() {
    //Scoring on Left and Right Goals, resetting variables to decrease system resourses
    if ( x < (width*0)+w || x > width - w) { //Net Detection
      ballXGoal = true;
      if (x < (width*0)+w ) { //Goal for left player
        x = (width*0);
        y = y; //Variable becomes "final" here
      }
      if ( x > width - w ) { //Goal for right player
        x = (width);
        y = y; //Variable becomes "final" here
      }
    } //End Net Detection
    //
    //Top and Bottom Boundary Bounce, accounting for increased ball movement per "step"
    // Bounce of Top and Bottom: bounce is a range and we move the ball if out-of-bounds
    if ( (y >= height*0 && y <= height*0+w) || ( y <= height && y >= height-w ) ) directionY =  directionY * (-1);
    if ( y < 0 || y > height ) {
      directionY =  directionY * (-1);
      if (y < 0) y = height*0 - (w/2);
      if (y > height) y = height - (w/2);
    }
    //
    //Ball "Step"
    if (ballXGoal == true) { //EMPTY IF to skip ball arithmetic, when score happens
    } else {
      ballMoveX = ballSpeedX*directionX;
      ballMoveY = ballSpeedY*directionY;
      x += ballMoveX;
      y += ballMoveY;
    }
  }//End ballPlay()
  //
  void paddleBounce() {
    directionX = directionX * (-1);
    ballMoveX = ballSpeedX*directionX;
    x += ballMoveX;
  }//End paddleBounce()
}//End class Circle
