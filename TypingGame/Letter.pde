class Letter
{
  //variable to hold the letter of this object
  char letter;
  //variables to hold position of letter on screen
  int xPos;
  int yPos;
  //boolean to check if letter has been typed yet
  boolean isActive = false;
  //int to hold the position of this letter in the word
  int position;
  
  Letter(char z, int x, int y, int pos)
  {
    letter = z;
    xPos = x;
    yPos = y;
    position = pos;
  }
  
  void show()
  {
    if(isActive == false)
    {
      //draw letter at x and y positions using the letter variable and text()
      fill(255);
      textSize(120);
      text(letter, xPos, yPos);
    }
    if(isActive == true)
    {
      //cover letter with black square for now
      fill(0);
      rect(xPos,yPos-80, 80, 80);
      //theLetters.remove(position);
    }
  }
  
  
  
  
}