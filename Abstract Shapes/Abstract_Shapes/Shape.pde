abstract class Shape {
  float x; //Position
  float y; 
  float w; //width
  float h; //height
  
  Shape (float xParameter, float yParameter, float wParameter, float hParameter) {
    this.x = xParameter;
    this.y = yParameter;
    this.w = wParameter;
    this.h = hParameter;
  }//End Constructor 
  // Reminder: lesson where contructor was split between itself 
  // and another parameter
  
  abstract void draw ();
}//End class Shape 
