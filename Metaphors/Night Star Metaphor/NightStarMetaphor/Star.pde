/*Note: does not work with Abstract Classes
 Reviews general classes
 */

class Star {
  //Global Variable
  float x, y, diameter;
  color black=#000000;
  //
  Star(float xParameter, float yParameter, float diameterParameter) {
    this.x = xParameter;
    this.y = yParameter;
    this.diameter = diameterParameter;
  }//End Ball Constructor
  //
  void draw() {
    //background(#000000); //Bug will only draw last star due to layering
    ellipse(x, y, diameter, diameter);
  }//End draw()
  //
  //Procedures
  //
  //Getters and Setters
  //
}//End Ball
