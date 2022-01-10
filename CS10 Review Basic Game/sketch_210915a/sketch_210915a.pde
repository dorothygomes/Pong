// Global Variables 
float leftPaddleX, leftPaddleY, leftPaddleWidth, leftPaddleHeight;
float rightPaddleX, rightPaddleY, rightPaddleWidth, rightPaddleHeight;
float ballX, ballY, ballWidth, ballHeight;

void setup() {
  size (600, 500);
  leftPaddleX = width * 1/40;
  leftPaddleHeight = height * 1/2;
  leftPaddleY = (height * 1/2) - leftPaddleHeight * 1/2;
  leftPaddleWidth = width * 1/40;
  rightPaddleX = width * 38/40;
  rightPaddleHeight = height * 1/2;
  rightPaddleY = (height * 1/2) - rightPaddleHeight * 1/2;
  rightPaddleWidth = width * 1/40;
  ballX = width * 20/40;
  ballY = (height * 1/2) - ballHeight * 1/2;
  ballWidth = width * 2/40;
  ballHeight = height * 2/40;
}

void draw() {
  rect(leftPaddleX, leftPaddleY, leftPaddleWidth, leftPaddleHeight);
  rect(rightPaddleX, rightPaddleY, rightPaddleWidth, rightPaddleHeight);
  ellipse(ballX, ballY, ballWidth, ballHeight);
}

void mousePressed() {
}
