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
