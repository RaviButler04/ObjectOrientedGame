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
  
  //PVector point to draw letters towards it
  PVector vortex;
  
  //PVector for direction from letter posiiton to vortex
  PVector direction;
  
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
    //multiply velocity so there is some more energy to the falling letters - unknown PVector method for skill 43
    velocity.mult(4);
    //acceleration
    acceleration = new PVector(0, 0.5);
    //set "vortex" position
    vortex = new PVector(400,800);
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
      
      //make letters fall
      velocity.add(acceleration);
      screenPosition.add(velocity);
      
      //get distance between the letter and the vortex
      float tempDist = screenPosition.dist(vortex);
      
      //find direction between letter and vortex
      direction = new PVector(vortex.x - screenPosition.x, vortex.y - screenPosition.y);
      
      //divide the direction so that letters don't immediately snap to the vortex position
      direction.div(10);
      
      if(tempDist < 700 && screenPosition.y > 700)
      {
        //make the vortex draw in the letters by adding the direction to screen position
        screenPosition.add(direction);
      }      
    }
  }  
}
