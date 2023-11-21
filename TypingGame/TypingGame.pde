
//create arrayList to hold "letter objects"
ArrayList<Letter> theLetters;

//create array for words
String[] words = new String[11];

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

void setup()
{
  //set framerate
  frameRate(60);
  
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
  words[10] = "RAGAMUFFIN";
  
  //setup initial word
  setupWord();
}

void draw()
{
  //make background black
  background(0);
  
  //decrease timer
  timer --;
  
  //change colour of bar
  barColour = color(0+c*1.5,255-c*1.5,0);
  
  //increment bar loop
  c++;
  
  //draw timer bar
  rectMode(CENTER);  
  fill(barColour);
  rect(400,150,timer*3,50);
  
  //check if timer is at zero
  if(timer == 0)
  {
    exit();
  }
    
  //show letters
  for(int x = 0; x < theLetters.size(); x++)
  {
    theLetters.get(x).show();
  }
  //println(cursorPos);
  //println(theLetters.get(cursorPos).letter);
  
  if(wordCompleted == true)
  {
    setupWord();
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

void setupWord()
{
  //reset boolean
  wordCompleted = false;
  
  //reset cursor
  cursorPos = 0;
  
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
