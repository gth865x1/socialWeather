
//Global Variables

//Sound
Minim minim;
AudioPlayer listen;

//Twitter
ResponseList<Status>statuses = null; 
TwitterFactory twitterFactory;
Twitter twitter;
ArrayList<String> cnnTweets = new ArrayList(), foxTweets = new ArrayList(), 
nbcTweets = new ArrayList(), userTweets = new ArrayList(), theseTweets = cnnTweets;

//Display
ArrayList<Barrier> barriers = new ArrayList();
Barrier a, b, c;
PImage cnn, fox, nbc, thisImg, user, refresh;
PFont titleFont = createFont("AR CHRISTY", 34), listFont = createFont("Arial", 12);
int searchFontSize = 34;
Weather wImg = new Weather();
Hover hover = new Hover();
Chart plot = new Chart();

//Other
int timer = 0;
color bg = color(169, 245, 236), here;
String searchString = "", list = "", dayNight, checkedDN, checkedMinute, whichID = "CNN", 
userID = "TheDailyShow"; 
ArrayList<String> lastSearch = new ArrayList();
boolean searching = true, page = true, chart = false;
int negCount, neuCount, posCount, neu, positive, checkedMin, checkedHour;
ArrayList negTweets, posTweets;
SocialWeatherAnalysis cnnSWA, nbcSWA, foxSWA, userSWA, thisSWA = cnnSWA;

void setup() {     
  size(400, 450);
  background(bg, 75);

  //Setup Sound
  minim = new Minim(this);
  listen = minim.loadFile("Patty Griffin - Heavenly Day (mp3cut.net).mp3");

  //Connect to Twitter and tweets
  connectTwitter();
  call();

  //Create Barrier Display
  int here = 100;  
  a = new Barrier(here, 300);
  here+=100;
  b = new Barrier(here, 300);
  here+=100;
  c = new Barrier(here, 300);
  barriers.add(a);
  barriers.add(b);
  barriers.add(c);
  
}  

void draw() {     
  if (page)background(bg, 75);
  // text(mouseX + ", "+ mouseY, mouseX, mouseY);
  if (page)trybackGround();
  else {
    if (chart) bGround3();
    else bGround2();
  }
} 

void trybackGround() {
  if (mouseX > 240 && mouseY >230 && mouseX < 360 && mouseY < 260) {
    hover.highLine(245, 265, 110);
    cursor(HAND);
  }

  else if (mouseX < 100 && mouseY >293 && mouseY < 400) {
    hover.highLine(10, 385, 80);
    cursor(HAND);
  }

  else if (mouseX < 200 && mouseX > 100 && mouseY >293 && mouseY < 400) {
    hover.highLine(110, 385, 80);
    cursor(HAND);
  }
  else if (mouseX < 300 && mouseX > 200 && mouseY > 293 && mouseY < 400) {
    hover.highLine(210, 385, 80);
    cursor(HAND);
  }

  else if (mouseX > 300 && mouseY >293 && mouseY < 400) {
    hover.highLine(310, 385, 80);
    cursor(HAND);
  }
  else if (mouseX > 20 && mouseY >  400 && mouseX < 140) {
    hover.highLine(30, 440, 105);
    cursor(HAND);
  }
  else if (mouseX > 345 && mouseY >  400) {
    cursor(HAND);
  }
  else cursor(ARROW);

  //Draw clock and date
  int h = hour();
  int m = minute();
  String minute = String.valueOf(minute());
  if (h == 0) {
    h = 12;
    dayNight = "am";
  }
  else if (h > 12) {
    dayNight = "pm";
    h-=12;
  }
  else if(h == 12)
    dayNight = "pm";
  else
    dayNight = "am";

  if (m <10) {
    minute = "0" + m;
  }
  if (minute.equals("00") && second() == 0) call();

  fill(100, 100, 100);
  textSize(12);
  textAlign(RIGHT);
  text(month() + "/" + day()+ "/" + year(), 388, 45);
  textSize(20);
  text(h + ":" + minute + " " + dayNight, 395, 30);

  //Draw compartments for forecast
  for (Barrier b: barriers) {
    b.display();
  }

  //Draw titles/headings and bird
  textSize(16);
  fill(18, 77, 22);
  textAlign(CENTER);
  text("CNN", 50, 310);
  text("FOXNews", 150, 310);
  text("NBC", 250, 310);
  text("UserID", 350, 310);
  PImage img = loadImage("Twitter-Bird-Logo.png");
  //tint(255, 125);
  image(img, 0, 10);
  textFont(titleFont, 32);
  fill(41, 115, 194);
  text("Social Weather", 210, 75);

  //Get weather images
  cnn = wImg.getImage(cnnSWA.getposPercentage(), cnnSWA.getneutPercentage(), cnnSWA.getnegPercentage());
  fox = wImg.getImage(foxSWA.getposPercentage(), foxSWA.getneutPercentage(), foxSWA.getnegPercentage());
  nbc = wImg.getImage(nbcSWA.getposPercentage(), nbcSWA.getneutPercentage(), nbcSWA.getnegPercentage());
  user = wImg.getImage(userSWA.getposPercentage(), userSWA.getneutPercentage(), userSWA.getnegPercentage());

  image(cnn, 20, 320);
  image(fox, 120, 320);
  image(nbc, 220, 320);

  textSize(60);
  text("?", 355, 370);

  fill(18, 77, 22);
  rect(50, 100, 300, 3, 20);

  textSize(16);
  text("Positive: " + thisSWA.getposPercentage() + "%\n" + "Neutral: " + thisSWA.getneutPercentage() + 
    "%\n" + "Negative: " + thisSWA.getnegPercentage() + "%", 300, 160);
  //println(userTweets);
  textSize(30);
  textAlign(LEFT);
  text(whichID, 50, 140);
  if (whichID.equals("CNN")) { 
    thisImg = cnn;
  }
  else if (whichID.equals("FOXNews")) { 
    thisImg = fox;
  }
  else if (whichID.equals("NBC")) { 
    thisImg = nbc;
  }
  else { 
    thisImg = user;
  }

  image(thisImg, 40, 115, 190, 190);

  //"View Tweets
  fill(18, 77, 22);
  rect(240, 230, 120, 30, 15);
  fill(41, 115, 194);
  textSize(20);
  text("View Tweets", 245, 253);
  //View Charts
  fill(18, 77, 22);
  rect(20, 400, 120, 30, 15);
  fill(41, 115, 194);
  textSize(20);
  text("View Charts", 30, 423);

  //Draw last edited
  fill(100, 100, 100);
  textSize(12);
  textAlign(LEFT);
  text("Last checked at: ", 165, 413);
  textSize(20);
  text(checkedHour + ":" + checkedMinute + " " + dayNight, 260, 420);

  refresh = loadImage("Refresh.png");
  image(refresh, 345, 400, 40, 40);
}

void bGround2() {
  fill(255);
  textSize(20);

  if (timer <180) {
    if (timer>60) {
      textAlign(LEFT);
      text("<-- Back", 10, 20);
    }
    fill(0, 20);
    rect(0, 0, 400, 450);
    timer++;
  }

  else {
    background(0);
    textAlign(LEFT);
    textFont(titleFont, 20);
    text("<-- Back", 10, 20);
    textAlign(CENTER);
    text(whichID + " Tweets", width/2, 40);
    textSize(12);
    textFont(listFont);
    text(list, 10, 60, 380, 350);
  }
  if (mouseX > 0 && mouseY > 0 && mouseX < 80 && mouseY < 25) {
    hover.highLine(10, 25, 75);
    cursor(HAND);
  }
  else cursor(ARROW);
  //text(mouseX + ", "+ mouseY, mouseX, mouseY);
}

void bGround3() {
  fill(255);
  textSize(20);

  if (timer <180) {
    if (timer>60) {
      textAlign(LEFT);
      text("<-- Back", 10, 20);
    }
    fill(0, 20);
    rect(0, 0, 400, 450);
    timer++;
  }

  else {
    background(0);
    textAlign(LEFT);
    textFont(titleFont, 20);
    text("<-- Back", 10, 20);
    textAlign(CENTER);
    textSize(24);
    text("Sentiment Pies", width/2, 40);
    //textSize(12);

    fill(225, 0, 0);
    rect(80, 70, 20, 10);
    fill(0, 255, 0);
    rect(155, 70, 20, 10);
    fill(0, 0, 225);
    rect(230, 70, 20, 10);
    fill(100, 100, 100);
    rect(305, 70, 20, 10);

    plot.displayPie(100, 155, cnnSWA.getposPercentage(), cnnSWA.getneutPercentage(), cnnSWA.getnegPercentage());
    plot.displayPie(300, 155, foxSWA.getposPercentage(), foxSWA.getneutPercentage(), foxSWA.getnegPercentage());
    plot.displayPie(100, 325, nbcSWA.getposPercentage(), nbcSWA.getneutPercentage(), nbcSWA.getnegPercentage());
    plot.displayPie(300, 325, userSWA.getposPercentage(), userSWA.getneutPercentage(), userSWA.getnegPercentage());
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("CNN", 100, 225);
    text("FOX", 300, 225);
    text("NBC", 100, 395);
    text(userID, 300, 395);
    textSize(12);
    text("NEG", 87, 65);
    text("POS", 162, 65);
    text("NEU", 242, 65);
    text("NONE", 312, 65);
  }
  if (mouseX > 0 && mouseY > 0 && mouseX < 80 && mouseY < 25) {
    hover.highLine(10, 25, 75);
    cursor(HAND);
  }
  else cursor(ARROW);
}

