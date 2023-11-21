class Letter
{
  //variable to hold the letter of this object
  char upperLetter;
  char lowerLetter;
  
  //variables to hold position of letter on screen
  //int xPos;
  //int yPos;
  
  //boolean to check if letter has been typed yet
  boolean isActive = false;
  
  //int to hold the position of this letter in the word
  int position;
  
  //PVectors for Physics
  PVector screenPosition;
  PVector velocity;
  PVector acceleration;
  
  Letter(char z, char z2, int x, int y, int pos)
  {
    upperLetter = z;
    lowerLetter = z2;
    //xPos = x;
    //yPos = y;
    position = pos;
    
    //physics shenanigans
    screenPosition = new PVector(x, y);
    velocity = new PVector(random(-4, 4), random(-4, 4));
    acceleration = new PVector(0, 0.5);
  }
  
  void show()
  {
    if(isActive == false)
    {
      //draw letter at x and y positions using the letter variable and text()
      fill(255);
      textSize(120);
      text(upperLetter, screenPosition.x, screenPosition.y);
    }
    if(isActive == true)
    {
      //draw letter at x and y positions using the letter variable and text()
      fill(0,255,0);
      textSize(120);
      text(upperLetter, screenPosition.x, screenPosition.y);
      
      //make em fall
      velocity.add(acceleration);
      screenPosition.add(velocity);
    }
  }  
}
