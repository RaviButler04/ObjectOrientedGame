//MILESTONE 1 COMPLETE


//create arrayList to hold "letter objects"
ArrayList<Letter> theLetters;

//create array for words
String[] words = new String[22];

//int to hold cursor posiiton in word
int cursorPos = 0;

//int to hold length of timer
int timerLength = 225;

//int to hold timer
int timer = timerLength;

//boolean to check if word has been completed
boolean wordCompleted = false;

//colour variable for bar
color barColour;

//int for barColour loop
int c = 0;

//int for tracking score
int score = -1;

//int for frameRate - this is for speed of timer
int frameSpeed = 60;

//int to hold game speed being drawn to screen
int gameSpeed = 1;

//boolean to check if main game is playing
boolean isPlaying = true;

//string for gameStates
String gameState = "start";

void setup()
{
  //set framerate
  frameRate(frameSpeed);
  
  //set size of window
  size(800,800);
  
  //initialize arrayList
  theLetters = new ArrayList<Letter>();
  
  words[0] = "REPETITION";
  words[1] = "ABANDONERS";
  words[2] = "BABBLINGLY";
  words[3] = "CABALETTAS";
  words[4] = "DACQUOISES";
  words[5] = "EARTHBOUND";
  words[6] = "FABRICATED";
  words[7] = "GADGETEERS";
  words[8] = "HABERGEONS";
  words[9] = "IBUPROFENS";
  words[10] = "DAFFODILLY";
  words[11] = "EAGLESTONE";
  words[12] = "HABITATION";
  words[13] = "IDEALISTIC";
  words[14] = "JAILHOUSES";
  words[15] = "KEYSTROKES";
  words[16] = "LACKLUSTER";
  words[17] = "MACARONIES";
  words[18] = "NANOROBOTS";
  words[19] = "OBEDIENTLY";
  words[20] = "PAINTBRUSH";
  words[21] = "RAGAMUFFIN";
    
  //setup initial word
  setupWord();
}

void draw()
{
  //set framerate
  frameRate(frameSpeed);
  
  drawBackground();
  
  switch(gameState)
  {
    case "start":
    {
      startMenu();
    } break;
    
    case "play":
    {
      gameInPlay();
    } break;
    
    case "over":
    {
      gameOver();
    }
  }
}

void keyPressed()
{  
  //check input and cursor position. if input and position matches the object, then make it dissapear. Increase cursor posiiton by 1.
  if(key == theLetters.get(cursorPos).upperLetter || key == theLetters.get(cursorPos).lowerLetter)
  {
    //theLetters.remove(cursorPos);
    theLetters.get(cursorPos).isActive = true;
    
    //make sure cursorPos doesn't go past the arraylist length
    if(cursorPos < theLetters.size() - 1)
    {
      cursorPos ++;
    }
    //check if word is completed
    else if(cursorPos == theLetters.size()-1)
    {
      wordCompleted = true;
    }
    //println(cursorPos);
  }  
}

//reset word
void setupWord()
{
  //reset boolean
  wordCompleted = false;
  
  //reset cursor
  cursorPos = 0;
  
  //check if score is a multiple of 5. if so, increase timer speed by 15 - for some reason this is only working if I set these to the number before
  if(score == 4 || score == 9 || score == 14 || score == 19 || score == 24 || score == 29 || score == 34 || score == 39 || score == 44 || score == 49)
  {
    frameSpeed += 10;
    gameSpeed ++;
  }
  
  //increase score
  score ++;
  
  //reset timer
  timer = timerLength;
  
  //reset barColour
  c = 0;
  
  //remove all objects from arrayList
  for(int x = 0; x < theLetters.size(); x++)
  {
    theLetters.clear();
  }
  
  //get random number equal to length of array
  int tempInt = int(random(words.length));
  
  //get random word from array using above number
  String tempString = words[tempInt];
  
  //for the length of the word, create that many objects / populate arrayList with objects
  for(int x = 0; x < tempString.length(); x++)
  {
    //get specific letter
    char upper = tempString.charAt(x);
    char lower = getLower(upper);
    theLetters.add(new Letter(upper, lower, (80 * x) + 10, 420, x));
  }
}

//main gameplay loop
void gameInPlay()
{
  //draw score
  textSize(50);
  fill(255);
  stroke(0);
  text("SCORE: " + score,5,50);
  
  //draw game speed
  text("SPEED: " + gameSpeed,5,100);
  
  //decrease timer
  timer --;
  
  //change colour of bar
  barColour = color(0+c*1.5,255-c*1.5,0);
  
  //increment bar loop
  c++;
  
  //draw timer bar
  rectMode(CENTER);  
  fill(barColour);
  stroke(0);
  rect(400,175,timer*3,50);
  
  //check if timer is at zero
  if(timer == 0)
  {
    //set game state to game over
    gameState = "over";
  }
    
  //show letters
  for(int x = 0; x < theLetters.size(); x++)
  {
    //function that takes letter object and shows them
    showLetter(theLetters.get(x));
  }
  //println(cursorPos);
  //println(theLetters.get(cursorPos).letter);
  
  if(wordCompleted == true)
  {
    setupWord();
  }
}

//game over screen
void gameOver()
{
  //draw score
  textSize(50);
  fill(255);
  stroke(0);
  text("YOUR SCORE: " + score,235,500);
  
  //draw game over
  textSize(120);
  fill(255,0,0);
  stroke(0);
  text("GAME OVER :(", 60,400);
  
  //draw restart button
  rectMode(CENTER);
  fill(0);
  stroke(255);
  rect(400,600,400,60);
  
  //restert text
  textSize(30);
  fill(255);
  text("RESTART",340,610);
  
  //draw start menu button
  rectMode(CENTER);
  fill(0);
  stroke(255);
  rect(400,700,400,60);
  
  //start menu text
  textSize(30);
  fill(255);
  text("MAIN MENU",325,710);
  
  //mouse hover over restart
  if(mouseX < 600 && mouseX > 200 && mouseY > 570 && mouseY < 630 )
  {
    //draw restart button
    rectMode(CENTER);
    fill(255);
    stroke(255);
    rect(400,600,400,60);
    
    //restert text
    textSize(30);
    fill(0);
    text("RESTART",340,610);
  }
  
  //mouse hover over menu
  if(mouseX < 600 && mouseX > 200 && mouseY > 670 && mouseY < 730)
  {
    //draw start menu button
  rectMode(CENTER);
  fill(255);
  stroke(255);
  rect(400,700,400,60);
  
  //start menu text
  textSize(30);
  fill(0);
  text("MAIN MENU",325,710);
  }
  
  //restart game
  if(mouseX < 600 && mouseX > 200 && mouseY > 570 && mouseY < 630 && mousePressed)
  {
    //setup for new game
    newGame();
    //change game state back to in play
    gameState = "play";
  }
  
  //go to main menu
  if(mouseX < 600 && mouseX > 200 && mouseY > 670 && mouseY < 730 && mousePressed)
  {
    //setup for new game
    newGame();
    //change game state back to in play
    gameState = "start";
  }
}

//start screen
void startMenu()
{
  //draw title
  textSize(120);
  fill(0,255,0);
  stroke(0);
  text("Typing Game!", 60,400);
  
  //draw start button
  rectMode(CENTER);
  fill(0);
  stroke(255);
  rect(400,600,400,60);
  
  //start text
  textSize(30);
  fill(255);
  text("START",360,610);
  
  //draw exit button
  //rectMode(CENTER);
  //fill(0);
  //stroke(255);
  //rect(400,700,400,60);
  
  ////start exit text
  //textSize(30);
  //fill(255);
  //text("EXIT",370,710);
  
  //mouse hover over start
  if(mouseX < 600 && mouseX > 200 && mouseY > 570 && mouseY < 630 )
  {
    //draw start button
    rectMode(CENTER);
    fill(255);
    stroke(255);
    rect(400,600,400,60);
    
    //start text
    textSize(30);
    fill(0);
    text("START",360,610);
  }
  
  //mouse hover over exit
  //if(mouseX < 600 && mouseX > 200 && mouseY > 670 && mouseY < 730)
  //{
  //  //draw start menu button
  //rectMode(CENTER);
  //fill(255);
  //stroke(255);
  //rect(400,700,400,60);
  
  ////start menu text
  //textSize(30);
  //fill(0);
  //text("EXIT",370,710);
  //}
  
  //start game
  if(mouseX < 600 && mouseX > 200 && mouseY > 570 && mouseY < 630 && mousePressed)
  {
    //setup for new game
    newGame();
    //change game state back to in play
    gameState = "play";
  }
  
  //exit game
  //if(mouseX < 600 && mouseX > 200 && mouseY > 670 && mouseY < 730 && mousePressed)
  //{
  //  exit();
  //}
}

//start new game after losing
void newGame()
{
  //reset score
  score = -1;
  
  //reset game speed
  gameSpeed = 1;
  frameSpeed = 60;
  
  //reset word
  setupWord();
}

void drawBackground()
{
  //make background black
  background(0);
  
  //make background pattern
  for(int x = 0; x <= 80; x++)
  {
    for(int i = 0; i <= 80; i++)
    {
      stroke(0);
      fill(11);
      rect(x*30,i*30,25,25);
    }
  }
}

void showLetter(Letter l)
{
  l.show();
}

char getLower(char x)
{
  if(x == 'A')
  {
    return 'a';
  }
  else if(x == 'B')
  {
    return 'b';
  }
  else if(x == 'C')
  {
    return 'c';
  }
  else if(x == 'D')
  {
    return 'd';
  }
  else if(x == 'E')
  {
    return 'e';
  }
  else if(x == 'F')
  {
    return 'f';
  }
  else if(x == 'G')
  {
    return 'g';
  }
  else if(x == 'H')
  {
    return 'h';
  }
  else if(x == 'I')
  {
    return 'i';
  }
  else if(x == 'J')
  {
    return 'j';
  }
  else if(x == 'K')
  {
    return 'k';
  }
  else if(x == 'L')
  {
    return 'l';
  }
  else if(x == 'M')
  {
    return 'm';
  }
  else if(x == 'N')
  {
    return 'n';
  }
  else if(x == 'O')
  {
    return 'o';
  }
  else if(x == 'P')
  {
    return 'p';
  }
  else if(x == 'Q')
  {
    return 'q';
  }
  else if(x == 'R')
  {
    return 'r';
  }
  else if(x == 'S')
  {
    return 's';
  }
  else if(x == 'T')
  {
    return 't';
  }
  else if(x == 'U')
  {
    return 'u';
  }
  else if(x == 'V')
  {
    return 'v';
  }
  else if(x == 'W')
  {
    return 'w';
  }
  else if(x == 'X')
  {
    return 'x';
  }
  else if(x == 'Y')
  {
    return 'y';
  }
  else if(x == 'Z')
  {
    return 'z';
  }
  else
  {
    return ' ';
  }
}
