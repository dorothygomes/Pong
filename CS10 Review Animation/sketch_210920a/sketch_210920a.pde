// Global Variables
float ballX, ballY, ballDiameter;
int ballXSpeed, ballYSpeed;
int ballXMove, ballYMove, directionX = 0, directionY = 0;
float leftPaddleX, leftPaddleY, leftPaddleWidth, leftPaddleHeight;
//int leftPaddleMove;
float rightPaddleX, rightPaddleY, rightPaddleWidth, rightPaddleHeight;
Boolean ballXGoal;

void setup() {
  size(600, 500);
  ballX = width * 1/2;
  ballY = height * 1/2;
  //ballDiameter = width * 1/100;
  ballDiameter = width * 1/20;
  ballXSpeed = width / width;
  ballYSpeed = height / height;
  this.ballXGoal = false;
  leftPaddleX = width * 1/20;
  leftPaddleHeight = height * 1/2;
  leftPaddleY =  height * 1/2 - (leftPaddleHeight * 1/2);
  leftPaddleWidth = width * 1/50;
  //leftPaddleMove = width * 0;
  //rightPaddleX = 558;
  rightPaddleX = width - (width * 1/20) - (width * 1/50);
  rightPaddleHeight = height * 1/2;
  rightPaddleY = height * 1/2 - (rightPaddleHeight * 1/2);
  rightPaddleWidth = width * 1/50;
  directionX = int (random (-2, 2) );
  directionY = int (random (-2, 2) );

  ellipse(ballX, ballY, ballDiameter, ballDiameter);
  rect(leftPaddleX, leftPaddleY, leftPaddleWidth, leftPaddleHeight);
  rect(rightPaddleX, rightPaddleY, rightPaddleWidth, rightPaddleHeight);
} 

void draw() {
  background(0);

  ballX = ballX + ballXSpeed;
  ballY = ballY + ballYSpeed;

  if (ballX - ballDiameter > width || ballX + ballDiameter < width * 0) ballXSpeed = ballXSpeed * -1;

  if (ballX > width) ballX = width;

  if (ballX < width * 0) ballX = width * 0; 

  if (ballY > height || ballY < height * 0) ballYSpeed = ballYSpeed * -1;

  if (ballY > height) ballY = height;

  if (ballY < height * 0) ballY = height * 0;
  
  if (ballX + ballXSpeed > width - (width * 1/20) / 2 || ballX + ballXSpeed < (width * 1/20) / 2) {
    ballXSpeed = ballXSpeed * -1;
  }
  
  if (ballY + ballYSpeed > height - (width * 1/20) / 2 || ballY + ballYSpeed < (width * 1/20) / 2) {
    ballYSpeed = ballYSpeed * -1;
  }
  
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
  }
  
  if (ballXGoal == true) { //EMPTY IF to skip ball arithmetic, when score happens
    } else {
      ballXMove = ballXSpeed * directionX;
      ballYMove = ballYSpeed * directionY;
      ballX += ballXMove;
      ballY += ballYMove;
    }
    
  if (leftPaddleY < 0) {
    leftPaddleY = 0;
  }
  
  if (leftPaddleY + leftPaddleHeight > height) {
    leftPaddleY = height - leftPaddleHeight;
  }
  
  //if (rightPaddleY + rightPaddleHeight > height) {
  //  rightPaddleY = height - rightPaddleHeight;
  //}
  
  //if (ballX <= leftPaddleX + leftPaddleWidth + ballDiameter / 2 && ballY <= leftPaddleY + leftPaddleHeight && ballY >= leftPaddleY) {
  //  ballXSpeed = ballXSpeed * -1;
  //} 
  
  if (ballX <= leftPaddleX + leftPaddleWidth + ballDiameter / 2 && ballY + ballDiameter / 2 <= leftPaddleY + leftPaddleHeight && ballY + ballDiameter / 2 >= leftPaddleY) {
    ballXSpeed = ballXSpeed * -1;
  } 
  
  if (ballX >= rightPaddleX - ballDiameter / 2 && ballY <= rightPaddleY + rightPaddleHeight && ballY >= rightPaddleY) {
    ballXSpeed = ballXSpeed * -1;
  } 

  ellipse(ballX, ballY, ballDiameter, ballDiameter);
  rect(leftPaddleX, leftPaddleY, leftPaddleWidth, leftPaddleHeight);
  rect(rightPaddleX, rightPaddleY, rightPaddleWidth, rightPaddleHeight);
}

//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == UP) {
//      // Left Paddle Movement, using W-S Keys
//        leftPaddleY = leftPaddleY - 1;
//    }

//    if (keyCode == DOWN) {
//    // Left Paddle Movement, using ARROW Keys 
//      leftPaddleY = leftPaddleY + 1;
//    }
//  }
//}

void keyPressed() {
    // Left Paddle Movement, using W-S Keys
   if (key == 'w' || key == 'W') {
     leftPaddleY = leftPaddleY - 1;
   }
   
   if (key == 's' || key == 'S') {
     leftPaddleY = leftPaddleY + 1;
   }
   
   // Right Paddle Movement, using O-K Keys
   if (key == 'o' || key == 'O') {
     rightPaddleY = rightPaddleY - 1;
   }
   
   if (key == 'k' || key == 'K') {
     rightPaddleY = rightPaddleY + 1;
   }
}
