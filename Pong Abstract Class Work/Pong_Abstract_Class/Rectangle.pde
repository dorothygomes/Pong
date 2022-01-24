class Rectangle extends Shape {
  //Variables: all inherited from abstract but manipulation 
  int yMove;
  color colour, reset=0;

  Rectangle (float x, float y, float w, float h) {
    super(x, y, w, h);
    this.colour = color (int(random(100, 255)), int(random(50, 255)), int(random(175, 255)));
    this.yMove = 5; //will need static class for this number
  }//End Constructor
  //
  void draw() {
    fill(colour);
    paddleGamePlay();
    rect(x, y, w, h);
    fill(reset);
  }//End draw()
  //
  void paddleGamePlay() {
    // Redrawing Paddle if too High
    if ( y < height * 0) y = 0;
    if ( y > height - h) y = height - h;
    //
    //
    //
    //
    //

    // Bouncing Off Left Paddle
    //
    // Bouncing off Right Paddle
    //
    // Moving Left Paddle
    // 
    /*
    if ( upLeft == true && downLeft == false) {
     paddleYLeft -= yMove;
     upLeft = false;
     }
     if (upLeft == false && downLeft == true) {
     paddleYLeft += yMove;
     downLeft = false;
     }
     //
     // Moving Right Paddle
     if ( upRight == true && downRight == false) {
     paddleYRight -= yMove;
     upRight = false;
     }
     if (upRight == false && downRight == true) {
     paddleYRight += yMove;
     downRight = false;
     }
     */
    //
  }//End gamePlay for Paddles
  //
  void movePaddleUp() {
    y = y - yMove;
  }//End movePaddle
  //
  void movePaddleDown() {
    y = y + yMove;
  }//End movePaddleDown()
  //
  
}//End class Rectangle
