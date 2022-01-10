class Circle extends Shape {
  //Variables 
  //
  //Static Variables 
  //static int ballWidthStart, ballHeightStart, ballDiameter; 
  //
  //Constructor 
  Circle(float x, float y, float w, float h) {
    super(x, y, w, h);
  }//End Constructor 
  //
  void draw() {
    ellipse(x, y, w, h);
  }//End draw()
  //
  //
}//End class Circle 
