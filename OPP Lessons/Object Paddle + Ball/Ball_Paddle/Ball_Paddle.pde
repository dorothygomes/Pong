/* To Do
Copy over prototyped Ball Class, illustrates modular programming & libraries
*/

//Global Variables and Other
Paddle paddle;

void setup() {
  size (500, 600); //fullScreen(), displayWidth, displayHeight;
  paddle = new Paddle(width, height); //For the Constructor
  //
}//End setup()

void draw() {
  background(255);
  paddle.paddleDraw();
}//End draw()

void keyPressed() {
  if (key == CODED && key == 'W' || key == 'w') paddle.upLeftGetter(); //Security Feature
  if (key == CODED && key == 'S' || key == 's') paddle.downLeftGetter(); //Security Feature
  if (key == CODED && keyCode == UP) paddle.upRightGetter(); //Security Feature
  if (key == CODED && keyCode == DOWN) paddle.downRightGetter(); //Security Feature
}//End keyPressed

void mousePressed() {
}//End mousePressed
