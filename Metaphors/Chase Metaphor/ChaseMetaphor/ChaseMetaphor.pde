   //Global Variables et al.
Ball ball; //Object

void setup() {
  size(500, 600); //fullScreen(), displayWidth, displayHeight
  ball = new Ball(width*1/2, height*1/2, width*1/40); //Constructor (Populates)
}//End setup()

void draw() {
  ball.draw();
}//End draw()

void mousePressed() {
  ball.setTargetX(mouseX);
  ball.setTargetY(mouseY);
}//End mousePressed

void keyPressed() {
}//End keyPressed
