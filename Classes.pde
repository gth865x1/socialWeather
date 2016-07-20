////Returns an image
class Weather{
  PImage weather;
  
  PImage getImage(float x, float y, float z){
   if(x >= y && x > z){ weather = loadImage("Positive.png"); }
    else if(y > x && y >= z) { weather = loadImage("Neutral.png"); }
    else{ weather = loadImage("Negative.png"); }
   
   return weather;
  }

}

class Hover{
  
  void highLine(int x, int y, int wid){
    fill(250, 239, 18);
    noStroke();
    rect(x,y,wid, 5, 5);
  }
}


//Creates barriers to compartmentalize the forecast
class Barrier {
  int x, y;

  Barrier(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    stroke(18, 77, 22);
    rect(x, y, 2, 75, 20);
  }
}


