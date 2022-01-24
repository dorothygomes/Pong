abstract class Shape {
  //Variables
  float x, y, w, h, a; //Position and Dimension Shape Variables

  //Constructor
  Shape(float xParameter, float yParameter, float wParameter, float hParameter) {
    this.x = xParameter;
    this.y = yParameter;
    this.w = wParameter;
    this.h = hParameter;
  }//End Constructor

  abstract void draw(); //Manditory, references extended classes
  //Note: no braces, code in extended classes

  //Any other procedures common to all extended classes
  //Must be declared here, like draw();
}//End class Shape
