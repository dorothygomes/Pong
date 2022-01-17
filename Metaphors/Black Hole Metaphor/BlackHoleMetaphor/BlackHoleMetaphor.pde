Dorothy Gomes//Global Variables et al
Boolean startMouse = false, startKeyboard = false;
int starCount = 50; //Will be a static variable, encapsulated
Star[] stars = new Star[starCount];
color black = #000000;

void setup() {
  //See Pure Java Misc Class form Static Variables
  println(stars.length);
  size(500, 600); //fullScreen(), displayWidth, displayHeight
  //screenSizeChecker();
  //
  createStars(); //Note: any numbers below should be encapsulated in a class
  //
  // Developer Instructions
  // Remember to move these for end-user, Splash Screen
  println("Remember to press the SPACEBAR to start the program");
  //
}//End setup()

void draw() {
  /*Listener for Clicking on the Canvas to Activate
   Note: Clicking to activate the Window is an OS Issue
   - A listener makes it obvious in development
   */
   if (mousePressed == true) startMouse = true;
   //
   /*Pausing the Start of the Program for a Splash Screen
   Be creative here with images, text, 2-D Shapes, and Colours
   */
   if (startMouse == true) background(black);
   println("Remember to press the SPACEBAR to start the program");
   //
   //Must press the SPACEBAR to start the program
   if (startKeyboard == true) {
   for (int i=0; i<stars.length; i++) {
      ellipse(stars[i].x, stars[i].y, stars[i].diameter, stars[i].diameter);
    }//End FOR
  }//End SPACEBAR Start
}//End draw()

void mousePressed() {
  createStars();
}//End mousePressed()

void keyPressed() {
  if (key == ' ') startKeyboard = true;
}//End keyPressed()
