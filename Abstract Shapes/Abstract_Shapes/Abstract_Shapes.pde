//Global Variables & Other items (classes) 
Circle cHex; //GlobLal, will never be deleted (garbage collected) 
ArrayList<Shape> shapes = new ArrayList<Shape>();

void setup() {
  size(500, 300); //Should be fullScreen()
  
  Rectangle rHex = new Rectangle(width*1/4, height*1/4, width*2/4, height*2/4, #F05E5E); //Will be deleted at end setup
  Rectangle rRGB = new Rectangle(width*3/5, height*3/5, width*1/5, height*1/5, color(random(255), random(255), random(255)) );
  Circle cHex = new Circle (width*1/2, height*1/2, width*1/4, width*1/4, #60CB52); //Careful of system resources 
  //
  //ArrayList Population, reminder, it is global 
  shapes.add(rHex);
  shapes.add(rRGB);
  shapes.add(cHex);
  //
}//End setup()

void draw() {
  background(0); //Gray Scale, Black
  //draw Shapes 
  for (int i = 0; i < shapes.size(); i++) {
    shapes.get(i).draw();
  } //End shapes.draw
}//End draw()
