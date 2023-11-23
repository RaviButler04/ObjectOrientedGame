class Letter
{
  //variable to hold the letter of this object
  char upperLetter;
  char lowerLetter;
  
  //boolean to check if letter has been typed yet
  boolean isActive = false;
  
  //int to hold the position of this letter in the word
  int position;
  
  //PVectors for Physics
  //PVector for x and y coordinates
  PVector screenPosition;
  
  //PVector for velocity
  PVector velocity;
  
  //PVector for acceleration
  PVector acceleration;
  
  Letter(char z, char z2, int x, int y, int pos)
  {
    upperLetter = z;
    lowerLetter = z2;
    position = pos;
    
    //physics shenanigans
    //x and y position
    screenPosition = new PVector(x, y);
    //velocity using random 2d vector
    velocity = PVector.random2D();
    //multiply velocity so there is some more energy to the falling letters
    velocity.mult(4);
    //acceleration
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
      text(upperLetter, constrain(screenPosition.x,0,800), screenPosition.y); //constrained the x value so that they don't fly off the sides of the screen
      
      //make em fall
      velocity.add(acceleration);
      screenPosition.add(velocity);
    }
  }  
}
