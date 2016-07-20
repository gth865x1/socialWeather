class SocialWeatherAnalysis {
  
  float posCount;
  float negCount;
  float neutCount;
  float posPercentage;
  float negPercentage;
  float neutPercentage;
  
  SocialWeatherAnalysis(ArrayList<String> tweetArray){
    
    posCount = 0;
    negCount = 0;
    neutCount = 0;
    
    for(int i = 0; i < tweetArray.size(); i++){
      String text = tweetArray.get(i);
      
      if (text.contains("absolutely")||text.contains("adorable")||text.contains("accepted")
        ||text.contains("acclaimed")||text.contains("accomplish")||  text.contains("accomplishment")
        ||text.contains("achievement")||text.contains("admire")||text.contains("affirmative")
        ||text.contains("affluent")  ||  text.contains("agree")||text.contains("agreeable")
        ||text.contains("amazing")||text.contains("angelic")||  text.contains("appealing")
        ||text.contains("approve")|| text.contains("aptitude")||text.contains("attractive")
        ||text.contains("awesome")||text.contains("beaming")||text.contains("beautiful")||
        text.contains("believe")||text.contains("beneficial")||  text.contains("bliss")||
        text.contains("bountiful")||text.contains("bounty")||text.contains("brave")||
        text.contains("bravo")||text.contains("brilliant")||text.contains("bubbly")||
        text.contains("celebrated")||text.contains("certain")||text.contains("champ")||
        text.contains("champion")||  text.contains("charming")||  text.contains("cheery")||
        text.contains("clean")||text.contains("commend")||  text.contains("composed")||
          text.contains("congratulation")||text.contains("constant")||
          text.contains("courageous")||
          text.contains("creative")||
          text.contains("cute")||
          text.contains("dazzling")||
          text.contains("delight")||
          text.contains("delightful")||
          text.contains("distinguished")||
          text.contains("divine")||

          text.contains("earnest")||
          text.contains("easy")||
          text.contains("ecstatic")||
          text.contains("effective")||
          text.contains("effervescent")||
          text.contains("efficient")||
          text.contains("effortless")||
          text.contains("electrifying")||
          text.contains("elegant")||
          text.contains("enchanting")||
          text.contains("encouraging")||
          text.contains("endorsed")||
          text.contains("energetic")||
          text.contains("energized")||
          text.contains("engaging")||
          text.contains("enthusiastic")||
          text.contains("essential")||
          text.contains("esteemed")||
          text.contains("ethical")||
          text.contains("excellent")||
          text.contains("exciting")||
          text.contains("exquisite")||
          text.contains("fabulous")||
          text.contains("fair")||
          text.contains("familiar")||
          text.contains("famous")||
          text.contains("fantastic")||
          text.contains("favorable")||
          text.contains("fetching")||
          text.contains("fine")||
          text.contains("flourishing")||
          text.contains("fortunate")||
          text.contains("free")||
          text.contains("fresh")||
          text.contains("friendly")||
          text.contains("fun")||
          text.contains("funny")||
          text.contains("generous")||
          text.contains("genius")||
          text.contains("genuine")||
          text.contains("giving")||
          text.contains("glamorous")||
          text.contains("glowing")||
          text.contains("good")||
          text.contains("gorgeous")||
          text.contains("graceful")||
          text.contains("great")||
          text.contains("grin")||
          text.contains("growing")||
          text.contains("handsome")||
          text.contains("happy")||
          text.contains("harmonious")||
          text.contains("healing")||
          text.contains("healthy")||
          text.contains("hearty")||
          text.contains("heavenly")||
          text.contains("honest")||
          text.contains("honorable")||
          text.contains("honored")||
          text.contains("hug")||
          text.contains("idea")||
          text.contains("ideal")||
          text.contains("imaginative")||
          text.contains("imagine")||
          text.contains("impressive")||
          text.contains("independent")||
          text.contains("innovate")||
          text.contains("innovative")||
          text.contains("instinctive")||
          text.contains("intuitive")||
          text.contains("intellectual")||
          text.contains("intelligent")||
          text.contains("inventive")||
          text.contains("jovial")||
          text.contains("joy")||
          text.contains("jubilant")||
          text.contains("keen")
          ||text.contains("kind")||
          text.contains("knowing")||
          text.contains("knowledgeable")||
          text.contains("laugh")||
          text.contains("light")||
          text.contains("learned")||
          text.contains("lively")||
          text.contains("lovely")||
          text.contains("lucky")||
          text.contains("love")||
          text.contains("lovable")||
          text.contains("luminous")||
          text.contains("marvelous")||
          text.contains("masterful")||
          text.contains("meaningful")||
          text.contains("merit")||
          text.contains("meritorious")||
          text.contains("miraculous")||
          text.contains("motivating")||
          text.contains("moving")||
          text.contains("natural")||
          text.contains("nice")||
          text.contains("novel")||
          text.contains("now")||
          text.contains("nurturing")||
          text.contains("nutritious")||
          text.contains("open")||
          text.contains("optimistic")||
          text.contains("paradise")||
          text.contains("perfect")||
          text.contains("phenomenal")||
          text.contains("pleasurable")||
          text.contains("plentiful")||
          text.contains("poised")||
          text.contains("polished")||
          text.contains("popular")||
          text.contains("positive")||
          text.contains("powerful")||
          text.contains("prepared")||
          text.contains("pretty")||
          text.contains("principled")||
          text.contains("productive")||
          text.contains("progress")||
          text.contains("prominent")||
          text.contains("protected")||
          text.contains("proud")||
          text.contains("quality")||
          text.contains("quick")||
          text.contains("ready")||
          text.contains("reassuring")||
          text.contains("refined")||
          text.contains("refreshing")||
          text.contains("rejoice")||
          text.contains("reliable")||
          text.contains("remarkable")||
          text.contains("resounding")||
          text.contains("respected")||
          text.contains("restored")||
          text.contains("reward")||
          text.contains("rewarding")||
          text.contains("right")||
          text.contains("robust")||
          text.contains("safe")||
          text.contains("satisfactory")||
          text.contains("secure")||
          text.contains("seemly")||
          text.contains("simple")||
          text.contains("skilled")||
          text.contains("skillful")||
          text.contains("smile")||
          text.contains("soulful")||
          text.contains("sparkling")||
          text.contains("special")||
          text.contains("spirited")||
          text.contains("spiritual")||
          text.contains("stirring")||
          text.contains("stupendous")||
          text.contains("stunning")||
          text.contains("success")||
          text.contains("successful")||
          text.contains("sunny")||
          text.contains("super")||
          text.contains("superb")||
          text.contains("supporting")||
          text.contains("surprising")||
          text.contains("terrific")||
          text.contains("thorough")||
          text.contains("thrilling")||
          text.contains("thriving")||
          text.contains("tranquil")||
          text.contains("transforming")||
          text.contains("transformative")||
          text.contains("trusting")||
          text.contains("truthful")||
          text.contains("unwavering")||
          text.contains("up")||
          text.contains("upbeat")||
          text.contains("upright")||
          text.contains("upstanding")||
          text.contains("valued")||
          text.contains("vibrant")||
          text.contains("victorious")||
          text.contains("victory")||
          text.contains("vigorous")||
          text.contains("virtuous")||
          text.contains("vital")||
          text.contains("vivacious")||
          text.contains("wealthy")||
          text.contains("welcome")||
          text.contains("well")||
          text.contains("whole")||
          text.contains("wholesome")||
          text.contains("willing")||
          text.contains("wonderful")||
          text.contains("wondrous")||
          text.contains("worthy")||
          text.contains("wow")||
          text.contains("yes")||
          text.contains("yummy")||text.contains("zeal")||text.contains("zealous")||text.contains("fight")||text.contains("crazy")||text.contains("quirky")){
  tweetArray.set(i, text + " POS");      
        posCount++;
      }
    else if (text.contains("abysmal")||
          text.contains("adverse")||
          text.contains("alarming")||
          text.contains("angry")||
          text.contains("annoy")||
          text.contains("anxious")||
          text.contains("apathy")||
          text.contains("appalling")||
          text.contains("atrocious")||
          text.contains("awful")||
          text.contains("bad")||
          text.contains("banal")||
          text.contains("barbed")||
          text.contains("belligerent")||
          text.contains("bemoan")||
          text.contains("beneath")||text.contains("bitchfit")||text.contains("bitch")||
          text.contains("boring")||
          text.contains("broken")||
          text.contains("callous")||
          text.contains("can't")||text.contains("cannot")||
          text.contains("clumsy")||
          text.contains("coarse")||
          text.contains("cold")||
          text.contains("cold-hearted")||
          text.contains("collapse")||text.contains("confound")||text.contains("confounds")||
          text.contains("confused")||
          text.contains("contradictory")||
          text.contains("contrary")||
          text.contains("corrosive")||
          text.contains("corrupt")||
          text.contains("crazy")||
          text.contains("creepy")||
          text.contains("criminal")||
          text.contains("cruel")||
          text.contains("cry")||
          text.contains("cutting")||
          text.contains("dead")||
          text.contains("decaying")||
          text.contains("damage")||
          text.contains("damaging")||
          text.contains("dastardly")||
          text.contains("deplorable")||
          text.contains("depressed")||
          text.contains("deprived")||
          text.contains("deformed")||
          text.contains("deny")||
          text.contains("despicable")||
          text.contains("detrimental")||text.contains("dire")||
          text.contains("dirty")||
          text.contains("disease")||
          text.contains("disgusting")||
          text.contains("disheveled")||
          text.contains("dishonest")||
          text.contains("dishonorable")||
          text.contains("dismal")||
          text.contains("distress")||
          text.contains("don't")||
          text.contains("dreadful")||
          text.contains("dreary")||
          text.contains("enraged")||
          text.contains("eroding")||
          text.contains("evil")||
          text.contains("fail")||
          text.contains("faulty")||
          text.contains("fear")||
          text.contains("feeble")||
          text.contains("fight")||
          text.contains("filthy")||
          text.contains("foul")||
          text.contains("frighten")||
          text.contains("frightful")||
          text.contains("gawky")||
          text.contains("ghastly")||
          text.contains("grave")||
          text.contains("greed")||
          text.contains("grim")||
          text.contains("grimace")||
          text.contains("gross")||
          text.contains("grotesque")||
          text.contains("gruesome")||
          text.contains("guilty")||
          text.contains("haggard")||
          text.contains("hard")||
          text.contains("hard-hearted")||
          text.contains("harmful")||
          text.contains("hate")||
          text.contains("hideous")||
          text.contains("homely")||
          text.contains("horrendous")||
          text.contains("horrible")||
          text.contains("hostile")||
          text.contains("hurt")||
          text.contains("hurtful")||
          text.contains("icky")||
          text.contains("ignore")||
          text.contains("ignorant")||
          text.contains("ill")||
          text.contains("immature")||
          text.contains("imperfect")||
          text.contains("impossible")||
          text.contains("inane")||
          text.contains("inelegant")||text.contains("infection")||
          text.contains("infernal")||
          text.contains("injure")||
          text.contains("injurious")||
          text.contains("insane")||
          text.contains("insidious")||
          text.contains("insipid")||
          text.contains("jealous")||
          text.contains("junky")||
          text.contains("lose")||
          text.contains("lousy")||
          text.contains("lumpy")||
          text.contains("malicious")||
          text.contains("mean")||
          text.contains("menacing")||
          text.contains("messy")||
          text.contains("misshapen")||
          text.contains("missing")||
          text.contains("misunderstood")||
          text.contains("moan")||
          text.contains("moldy")||
          text.contains("monstrous")||
          text.contains("nasty")||
          text.contains("naughty")||
          text.contains("negate")||
          text.contains("negative")||
          text.contains("never")||
          text.contains("no")||
          text.contains("nobody")||
          text.contains("nondescript")||text.contains("nonsense")||
          text.contains("not")||
          text.contains("noxious")||
          text.contains("objectionable")||
          text.contains("odious")||
          text.contains("offensive")||
          text.contains("old")||
          text.contains("oppressive")||
          text.contains("pain")||
          text.contains("perturb")||
          text.contains("pessimistic")||
          text.contains("petty")||
          text.contains("poisonous")||
          text.contains("poor")||
          text.contains("prejudice")||
          text.contains("questionable")||
          text.contains("quit")||
          text.contains("reject")||
          text.contains("renege")||
          text.contains("repellant")||
          text.contains("reptilian")||
          text.contains("repulsive")||
          text.contains("repugnant")||
          text.contains("revenge")||
          text.contains("revolting")||
          text.contains("rocky")||
          text.contains("rotten")||
          text.contains("rude")||
          text.contains("ruthless")||
          text.contains("sad")||
          text.contains("savage")||
          text.contains("scare")||
          text.contains("scary")||
          text.contains("scream")||
          text.contains("severe")||
          text.contains("shoddy")||
          text.contains("shocking")||
          text.contains("sick")||
          text.contains("sickening")||
          text.contains("sinister")||
          text.contains("slimy")||
          text.contains("smelly")||
          text.contains("sobbing")||
          text.contains("sorry")||
          text.contains("spiteful")||
          text.contains("sticky")||
          text.contains("stinky")||
          text.contains("stormy")||
          text.contains("stressful")||
          text.contains("stuck")||
          text.contains("stupid")||
          text.contains("substandard")||
          text.contains("suspect")||
          text.contains("suspicious")||
          text.contains("tense")||
          text.contains("terrible")||
          text.contains("terrifying")||
          text.contains("threatening")||
          text.contains("ugly")||
          text.contains("undermine")||
          text.contains("unfair")||
          text.contains("unfavorable")||
          text.contains("unhappy")||
          text.contains("unhealthy")||
          text.contains("unjust")||
          text.contains("unlucky")||
          text.contains("unpleasant")||
          text.contains("upset")||
          text.contains("unsatisfactory")||
          text.contains("unsightly")||
          text.contains("untoward")||
          text.contains("unwanted")||
          text.contains("unwelcome")||
          text.contains("unwholesome")||
          text.contains("unwieldy")||
          text.contains("unwise")||
          text.contains("upset")||
          text.contains("vice")||
          text.contains("vicious")||
          text.contains("vile")||
          text.contains("villainous")||
          text.contains("vindictive")||
          text.contains("wary")||
          text.contains("weary")||
          text.contains("wicked")||
          text.contains("woeful")||
          text.contains("worthless")||
          text.contains("wound")||
          text.contains("yell")||
          text.contains("yucky")||
          text.contains("zero")){
    tweetArray.set(i, text + " NEG");      
    if(posCount > 0) posCount--;
        negCount++;
      }
      else{
    tweetArray.set(i, text + " NEU");      
        neutCount++;
      }
    }
    
    posPercentage = ((posCount / tweetArray.size())* 100);
//System.out.println("" + posCount);
    negPercentage = ((negCount/ tweetArray.size())*100);
    neutPercentage = ((neutCount/tweetArray.size())*100);
    
}

float getposPercentage(){
  return posPercentage;
}

float getnegPercentage(){
  return negPercentage;
}

float getneutPercentage(){
  return neutPercentage;
}

}

