// Initial connection
void connectTwitter() {  
  ConfigurationBuilder cb = new ConfigurationBuilder();  
  cb.setOAuthConsumerKey("060km2qDOIche6V5T1jzA");
  cb.setOAuthConsumerSecret("s0ZvQllFcIdqd8qeZitsO9Wnhk7ExpQUvqF8jh9uUP8");
  cb.setOAuthAccessToken("2163139279-zfDwbIl1vZ8XBa1YckjCVuZ49A86B0V4auOMyjU");
  cb.setOAuthAccessTokenSecret("sR9YNUr7hdcTLghlqNyplttF8tBS4W5Ixtkrch8YY1IBL");

  twitterFactory = new TwitterFactory(cb.build());    
  twitter = twitterFactory.getInstance();  

  println("connected");
  listen.play();
} 

ArrayList<String> getTimeline(String userName, ArrayList<String> tweets) {     
  try {        
    statuses = twitter.getUserTimeline(userName);
  }   
  catch(TwitterException e) {         
    println("Get timeline: " + e + " Status code: " + e.getStatusCode());
  }     
  for (Status status:statuses) {               
    tweets.add(status.getText());
    //println(status.getUser().getName() + ": " + status.getText());
  }
  return tweets;
  //return null;
}  

void drawUserField()
{
 // textFont(queryFont, 22);
  textAlign(CENTER);
  text(searchString, width/2, height/2+50);
}

public void keyPressed()
{
  if (keyCode == ENTER)
  {
    if (searching)
    {
      if (searchString.length() > 0)
      {
        lastSearch.add(0, searchString) ;
        searching = false;
        page = false;
      }
    }
    else {
      searching = true;
      searchString = new String();
    }
  }
  else if (keyCode == BACKSPACE)
  {
    if (page==false) {
      page = true;
      searching = true;
    }
    else if (searchString.length()>0)
    {
      searchString = searchString.substring(0, searchString.length()-1);
    }
    else
    {
      searching = false;
    }
  }
  else if (searching)
  {
    searchString += key;
  }
}

void mousePressed() {
if(mouseX > 240 && mouseY >230 && mouseX < 360 && mouseY < 260){
  page = false;
  list = stringOfTweets(theseTweets);
}

else if(mouseX > 0 && mouseY > 0 && mouseX < 80 && mouseY < 25) {  
  page = true;
  chart=false;
  timer = 0;
  }

else if(mouseX < 100 && mouseY >293 && mouseY < 400){
  thisSWA = cnnSWA;
  theseTweets = cnnTweets;
  whichID = "CNN";
}

else if(mouseX < 200 && mouseX > 100 && mouseY >293 && mouseY < 400){
  thisSWA = foxSWA;
  theseTweets = foxTweets;
  whichID = "FOXNews";
}
else if(mouseX < 300 && mouseX > 200 && mouseY > 293 && mouseY < 400){
  thisSWA = nbcSWA;
  theseTweets = nbcTweets;
  whichID = "NBC";
}

else if(mouseX > 300 && mouseY >293 && mouseY < 400){
  thisSWA = userSWA;
  theseTweets = userTweets;
  whichID = userID;
}
else if(mouseX > 20 && mouseY >  400 && mouseX < 140){
  page = false;  
  chart = true;
    timer = 0;
  }else if(mouseX > 345 && mouseY >  400){
    call();
  }

}

void call(){
  checkedMin = minute();
  checkedHour = hour();
  
  if (checkedHour == 0) {
    checkedHour = 12;
    checkedDN = "am";
  }
  else if (checkedHour > 12) {
    checkedDN = "pm";
    checkedHour-=12;
  }
  else if(checkedHour == 12){
    checkedDN = "pm";
  }
  else
    checkedDN = "am";

  if (checkedMin <10) {
    checkedMinute = "0" + checkedMin;
  }else checkedMinute = "" + checkedMin;
  
  cnnTweets = getTimeline("CNN", cnnTweets);
  foxTweets = getTimeline("FoxNews", foxTweets);
  nbcTweets = getTimeline("NBC", nbcTweets);
  userTweets = getTimeline(userID, userTweets);
  theseTweets = cnnTweets;
  cnnSWA = new SocialWeatherAnalysis(cnnTweets);
  foxSWA = new SocialWeatherAnalysis(foxTweets);
  nbcSWA = new SocialWeatherAnalysis(nbcTweets);
  userSWA = new SocialWeatherAnalysis(userTweets);
  thisSWA = cnnSWA;
}

String stringOfTweets(ArrayList<String> twts){
  String str = "";
  for(int i = 0; i < 10; i++){
    str = str + twts.get(i) + "\n";
  }
  return str;
}

class Chart{
    
 void displayPie(int x, int y, float a, float b, float c){
  float p = 360*a/100;
  float u = 360*b/100;
  float n = 360*c/100;
  fill(0, 255 ,0);
  arc(x, y, 100, 100, radians(0), radians(p));
  fill(0,0, 255);
  arc(x, y, 100, 100, radians(p), radians(p+u));
  fill(255, 0, 0); 
  arc(x, y, 100, 100, radians(p+u), radians(p+u+n));
  fill(100,100,100); 
  arc(x, y, 100, 100, radians(p+u+n), radians(360));
 }
 

}


