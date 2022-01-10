class Rectangle extends Shape{
  //Variables: all inherited from abstract but manipulation 
  //not executed if exists here in extended
  color colour;
  
  Rectangle (float x, float y, float w, float h, color cParameter) {
    super(x, y, w, h);
    this.colour = cParameter; //Similar to splitting the Ball Constructor (previous lesson)
  }//End Constructor 
  //
  void draw() {
    fill(colour);
    rect(x, y, w, h);
  }//End draw()
  //
} //End class Rectangle
