
//create arrayList to hold "letter objects"
ArrayList<Letter> theLetters;

//create array for words
String[] words = new String[10];

//int to hold cursor posiiton in word
int cursorPos = 0;

//boolean to check if word has been completed
boolean wordCompleted = false;

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
  
  //setup initial word
  setupWord();
}

void draw()
{
  //make background black
  background(0);
    
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
  if(key == theLetters.get(cursorPos).letter)
  {
    //theLetters.remove(cursorPos);
    theLetters.get(cursorPos).isActive = true;
    
    //make sure cursorPos doesn't go past the arraylist length
    if(cursorPos < theLetters.size() - 1)
    {
      cursorPos ++;
    }
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
    char temp = tempString.charAt(x);
    theLetters.add(new Letter(temp, (80 * x) + 10, 420, x));
  }
}
