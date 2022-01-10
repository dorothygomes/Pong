/* Two Bugs to Fix
 1. DONE - Stars "half off" canvas, similar to pong-ball not bouncing when collides with edge
 2. DONE Stars overlapping (note: this is similar to mousePressed button inqualities
 */

void createStars()
{
  //Note: FOR-EACH Loop more appropriate for Arrays and Classes
  for (int i=0; i<stars.length; i++) {
    float diameterRandom = random(width*1/200, width*1/120);
    float xRandom = random(diameterRandom*1/2, width-diameterRandom*1/2);
    float yRandom = random(diameterRandom*1/2, height-diameterRandom*1/2);
    stars[i] = new Star(xRandom, yRandom, diameterRandom);
    int j=i;
    //
    while ( j>=0) {
      while (xRandom-diameterRandom*1/2 > stars[j].x && xRandom+diameterRandom*1/2 < stars[j].x) {
        xRandom = random(diameterRandom*1/2, width-diameterRandom*1/2);
      }//End WHILE
      j--;
    }//End WHILE-X
    stars[i] = new Star(xRandom, yRandom, diameterRandom); //include new xRandom in current stars[i]
    j=i;
    while ( j>=0 ) {
      while (yRandom-diameterRandom*1/2 > stars[j].y && yRandom+diameterRandom*1/2 < stars[j].y) {
        yRandom = random(diameterRandom*1/2, height-diameterRandom*1/2);
      }//End WHILE
      j--;
    }//End WHILE-X
    //note: repeat this line if xRandom is rewritten but not yRandom, or vise-versa
    stars[i] = new Star(xRandom, yRandom, diameterRandom); //include new yRandom in current stars[i]
  }//End FOR Population
}//End createStars
