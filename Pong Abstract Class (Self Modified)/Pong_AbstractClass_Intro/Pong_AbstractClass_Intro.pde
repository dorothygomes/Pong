//Main Program

//Blobal Variables and Other (Classes)
ArrayList<Shape> shapes = new ArrayList<Shape>();
// 
// Static Variables, processing, java specific, similar to final 
// See Circle Class
// 
void setup() {
  size(500, 300); //fullScreen(); // Geometry of displayWidth & displayHeight 
  // 
  //Population using Display Geometry 
  final int ballWidthStart = width * 1/2; //Garbage collected 
  final int ballHeightStart = height * 1/2; 
  final int ballDiameter = width * 1/50; 
  Circle ball = new Circle(ballWidthStart, ballHeightStart, ballDiameter, ballDiameter); //Can create arrays here for multiple balls 
  //Rectangle leftPaddle 
  final int leftPaddleXStart = width * 1/40; //Garbage collected 
  final int leftPaddleYStart = (height * 1/2) - (height * 1/2) * 1/2; 
  final int leftPaddleWidthStart = width * 1/40; 
  final int leftPaddleHeightStart = height * 1/2; 
  Rectangle leftPaddle = new Rectangle(leftPaddleXStart, leftPaddleYStart, leftPaddleWidthStart, leftPaddleHeightStart);
  //Rectangle rightPaddle 
  final int rightPaddleXStart = width * 38/40; //Garbage collected 
  final int rightPaddleYStart = (height * 1/2) - (height * 1/2) * 1/2; 
  final int rightPaddleWidthStart = width * 1/40; 
  final int rightPaddleHeightStart = height * 1/2; 
  Rectangle rightPaddle = new Rectangle(rightPaddleXStart, rightPaddleYStart, rightPaddleWidthStart, rightPaddleHeightStart);
  //Rectangle leftScore 
  //Rectangle rightScore
  //
  //ArrayList Population, reminder, all variables and classes 
  //          will be garbage collected, local variables 
  shapes.add(ball);
  shapes.add(leftPaddle);
  shapes.add(rightPaddle);
  //
}//End setup 

void draw() {
  background(0); //Gray Scale
  //draw Shapes
  for (int i = 0; i < shapes.size(); i++) {
    shapes.get(i).draw();
  } //End shapes.draw
  //
}//End draw 

void keyPressed() {
}//End keyPressed 

void mousePressed() {
}//End mousePressed
