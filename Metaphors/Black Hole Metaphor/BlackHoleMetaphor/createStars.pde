void createStars()
{
  //Note: FOR-EACH Loop more appropriate for Arrays and Classes
  for (int i=0; i<stars.length; i++) {
    float diameterRandom = random(width*1/60, width*1/40);
    float xRandom = random(diameterRandom*1/2, width-diameterRandom*1/2);
    float yRandom = random(diameterRandom*1/2, height-diameterRandom*1/2);
    stars[i] = new Star(xRandom, yRandom, diameterRandom);
    int j=i;
    /* Following Algorithm tests possible x & y-values fitting into the circles of existing stars
     New points are tested against existing points, not all points
     Especially ones not created yet
     */
    while ( j>=0) {
      if (xRandom-diameterRandom*1/2 > stars[j].x && xRandom+diameterRandom*1/2 < stars[j].x) {
        xRandom = random(diameterRandom*1/2, width-diameterRandom*1/2);
        println("X Rechoose run");
      }//End WHILE
      println("First j", j);
      j--;
    }//End WHILE-X
    stars[i] = new Star(xRandom, yRandom, diameterRandom); //include new xRandom in current stars[i]
    j=i;
    while ( j>=0 ) {
      if (yRandom-diameterRandom*1/2 > stars[j].y && yRandom+diameterRandom*1/2 < stars[j].y) {
        yRandom = random(diameterRandom*1/2, height-diameterRandom*1/2);
        println("Y Rechoose run");
      }//End WHILE
      println("Second j", j);
      j--;
    }//End WHILE-X
    //note: repeat this line if xRandom is rewritten but not yRandom, or vise-versa
    stars[i] = new Star(xRandom, yRandom, diameterRandom); //include new yRandom in current stars[i]
  }//End FOR Population
}//End createStars
