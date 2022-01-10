class Circle extends Shape{
  //Variables: see Shape 
  color colour;
  
  Circle(float x, float y, float w, float h, color cParameter) {
    super(x, y, w, h);
    this.colour = cParameter;
    
  }//End Constructor
  
  void draw() {
    fill(colour);
    ellipse(x, y, w, h);
    step();
  }//End draw()
  
  void step() {
    y++;
  }//End step()
}//End class Circle
