//Main Program

//Blobal Variables and Other (Classes)
ArrayList<Shape> shapes = new ArrayList<Shape>();
// 
// Static Variables, processing, java specific, similar to final 
// See Circle Class
// 
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
  }//End population of balls
  //Rectangle leftPaddle 
  final int paddleNumber = 2;
  Rectangle[] paddles = new Rectangle[paddleNumber];
  final int paddleWidth = int(width*1/80);
  final int paddleHeight = int(height*1/2);
  final int yMove = int( (height / height) * 5);
  //Rectangle leftPaddle
  final int paddleXLeft = int(width*1/40);

  final int paddleYLeft = int(height*1/2 - paddleHeight*1/2);
  //println(paddleYLeft);
  paddles[0] = new Rectangle(paddleXLeft, paddleYLeft, paddleWidth, paddleHeight);
  shapes.add(paddles[0]); //shapes[10]
  //Rectangle rightPaddle
  final int paddleXRight = int(width*39/40);

  final int paddleYRight = paddleYLeft; //same starting place, best practice to enter one formula
  paddles[1] = new Rectangle(paddleXRight, paddleYRight, paddleWidth, paddleHeight);
  shapes.add(paddles[1]); //shapes[11]
  //Rectangle leftScore
  //Rectangle rigthScore
  //
  //ArrayList Poluolation, reminder, all variables and classes
  //          will be garbage collected, local variables

  //
}//End setup 

void draw() {
  background(255); //Gray Scale
  //draw Shapes
  for (int i=0; i<shapes.size(); i++ ) 
  {
    shapes.get(i).draw();
    //Numbers in this code should be replaced with static class variables
    if (i <= shapes.size()-20 ) 
    { //Check for balls in shapes, ignore paddles
      if ( ( shapes.get(i).y >= shapes.get(10).y && shapes.get(i).y <= shapes.get(10).y+shapes.get(10).h ) || ( shapes.get(i).y >= shapes.get(11).y && shapes.get(i).y <= shapes.get(11).y+shapes.get(11).h ) )
      { //Change direction of balls, then recreate Shapes Object at the point in time
        if ( shapes.get(i).x < ( shapes.get(10).x + shapes.get(10).w + shapes.get(i).h ) || ( shapes.get(i).x > ( shapes.get(11).x - shapes.get(i).h ) ) )
        { //Ball is beyond paddle
          if ( (shapes.get(i).y >= shapes.get(10).y ) && (shapes.get(i).y <= shapes.get(10).y+shapes.get(10).h) )
          {  //Left Paddle Bounce 
            Circle ball = new Circle ( shapes.get(i).x, shapes.get(i).y, shapes.get(i).w, shapes.get(i).h );
            ball.paddleBounce();
            shapes.remove(i);
            shapes.add(i, ball);
          } //End Left Paddle Bounce
          if ( ( shapes.get(i).y >= shapes.get(11).y ) && ( shapes.get(i).y <= shapes.get(11).y+shapes.get(11).h ) )
          { //Right Paddle Bounce
            Circle ball = new Circle ( shapes.get(i).x, shapes.get(i).y, shapes.get(i).w, shapes.get(i).h );
            ball.paddleBounce();
            shapes.remove(i);
            shapes.add(i, ball);
          } //End Right Paddle Bounce
        }//End change ball direction
      }//End if ball is close to paddle
    }//End Check for Paddles
  } //End shapes.draw
  //
}//End draw

void keyPressed() {
  //Entering static numbers until different class is used for ballCounter, paddleNumber
  if (key == CODED && key == 'W' || key == 'w') {
    Rectangle paddle = new Rectangle (shapes.get(10).x, shapes.get(10).y, shapes.get(10).w, shapes.get(10).h ); 
    paddle.movePaddleUp(); //Unique line so method to copy code will not work
    shapes.remove(10);
    shapes.add(10, paddle);
  }//End W Key
  if (key == CODED && key == 'S' || key == 's') {
    Rectangle paddle = new Rectangle (shapes.get(10).x, shapes.get(10).y, shapes.get(10).w, shapes.get(10).h ); 
    paddle.movePaddleDown();
    shapes.remove(10);
    shapes.add(10, paddle);
  }//End S Key
  if (key == CODED && keyCode == UP) {
    Rectangle paddle = new Rectangle (shapes.get(11).x, shapes.get(11).y, shapes.get(11).w, shapes.get(11).h ); 
    paddle.movePaddleUp();
    shapes.remove(11);
    shapes.add(11, paddle);
  }//End UP Arrow
  if (key == CODED && keyCode == DOWN) {
    Rectangle paddle = new Rectangle (shapes.get(11).x, shapes.get(11).y, shapes.get(11).w, shapes.get(11).h ); 
    paddle.movePaddleDown();
    shapes.remove(11);
    shapes.add(11, paddle);
  }//End DOWN Arrow
}//End keyPressed

void mousePressed() {
}//End mousePressed

void keyPressedCode() {
}//End KeyPressedCode
