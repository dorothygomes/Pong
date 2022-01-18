class Rectangle extends Shape {
  //Variables 
  //
  //Static Variables 
  //static int ballWidthStart, ballHeightStart, ballDiameter; 
  //
  //Constructor 
  Rectangle(float x, float y, float w, float h) {
    super(x, y, w, h);
  }//End Constructor 
  //
  void draw() {
    rect(x, y, w, h);
  }//End draw()
  //
  //
}//End class Rectangle 

class Paddle {
  //Variables
  color colour;
  int paddleXLeft, paddleXRight, paddleYLeft, paddleYRight, paddleWidth, paddleHeight;
  int yMove; // Possible Easteregg to move paddles at a different speed requires two variables 
  boolean upLeft = false, downLeft = false, upRight = false, downRight = false;
  int leftScore=0, rightScore=0;
  float leftBoardX, leftBoardY, boardSide, rightBoardX, rightBoardY;
  String left, right;
  float textSize;

  //Constructor, populates the variables
  Paddle (float widthParameter, float heightParameter) { //Passsing Geometry
    this.colour = color (int(random(230, 255)), int(random(70, 255)), int(random(40, 255)));
    paddleWidth = int(height * 1/50); //no "this" thus no change ever 
    paddleXRight = int(width * 39/40) - paddleWidth; //If the height of the paddle changes, variables have to have "this"
    paddleXLeft = int(width * 1/40);
    //paddleHeight = int(height * 1/2);
    paddleHeight = int(height*1/3);
    this.paddleYLeft = int(height * 1/2) - paddleHeight * 1/2;
    this.paddleYRight = paddleYLeft;
    this.upLeft = false; 
    this.downLeft = false;
    this.upRight = false; 
    this.downRight = false;
    this.yMove = int( (height / height) * 5);
    boardSide = heightParameter*1/7;
    leftBoardX = paddleXLeft;
    leftBoardY = heightParameter*0;
    rightBoardX = paddleXRight-boardSide;
    rightBoardY = leftBoardY;
    textSize = width*1/10; //Algorithm takes geometry dimension side and *1/10 //If can exist in Constructor
  }//End Constructor
  //
  void paddleDraw() {
    //Background here will cover each individual ball
    fill(colour);
    gamePlay(); //Arithmetic Code, Security Feauture 
    rect (paddleXLeft, paddleYLeft, paddleWidth, paddleHeight);
    rect (paddleXRight, paddleYRight, paddleWidth, paddleHeight);
    fill(0); //Reset fill
  }//End ballDraw
  //
  void gamePlay() {
    //Bouncing Off Left Paddle
    //
    // Bouncing off Right Paddle
    //
    // Moving Left Paddle
    // Up: paddleYLeft -= yMove, Down: paddleYLeft += yMove
    if (upLeft == true && downLeft == false) {
      paddleYLeft -= yMove;
      upLeft = false;
    }
    if (upLeft == false && downLeft == true) {
      paddleYLeft += yMove;
      downLeft = false;
    }
    //
    // Moving Right Paddle
    if (upRight == true && downRight == false) {
      paddleYRight -= yMove;
      upRight = false;
    }
    if (upRight == false && downRight == true) {
      paddleYRight += yMove;
      downRight = false;
    }
    //
    // Redrawing Paddle if too High
    if (paddleYLeft < height * 0) paddleYLeft = 0;
    if (paddleYLeft  > height - paddleHeight ) paddleYLeft = height - paddleHeight;
    //
    // Redrawing Paddle if too Low
    if (paddleYRight < height * 0) paddleYRight = 0;
    if (paddleYRight > height - paddleHeight ) paddleYRight = height - paddleHeight;
    //
    //Printing the Scoreboard
    fill(colour); //board background
    //rect(leftBoardX, leftBoardY, boardSide, boardSide);
    //rect(rightBoardX, rightBoardY, boardSide, boardSide);
    fill(colour); //reset
    //println(leftScore, rightScore);
    textSize(textSize); //Change value until it works //Algorithm takes the smaller side and 
    textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
    //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
    //See flatText (CS10) or dynamicText (CS20) or Processing.org for more text functions
    text(Integer.toString(leftScore), leftBoardX, leftBoardY, boardSide, boardSide);
    text(Integer.toString(rightScore), rightBoardX, rightBoardY, boardSide, boardSide);
  }//End gamePlay
  //
  // Getters and Setters 
  void upLeftGetter() { //Get keyboard input 
    upLeft = true;
  }
  void downLeftGetter() { //Get keyboard input 
    downLeft = true;
  }
  void upRightGetter() { //Get keyboard input 
    upRight = true;
  }
  void downRightGetter() { //Get keyboard input 
    downRight = true;
  }
  void leftScoreSetter() { //Set Left Score Variable
    leftScore++;
  }
  void rightScoreSetter() { //Set Right Score Variable
    rightScore++;
  }
  int paddleXLeftGetter() {
    return paddleXLeft;
  }//End Paddle X Left Getter
  int paddleXRightGetter() {
    return paddleXRight;
  }//End Paddle X Left Getter
  int paddleWidthGetter() {
    return paddleWidth;
  }//End Paddle X Left Getter
  int paddleYLeftGetter() {
    return paddleYLeft;
  }//End Paddle X Left Getter
  int paddleYRightGetter() {
    return paddleYRight;
  }//End Paddle X Left Getter
  int paddleHeightGetter() {
    return paddleHeight;
  }//End paddleHeight Getter
  //
}//End Ball 
