PImage charizardForward;
PImage charizardBack;
float xPositionOfCharizardF = 1639;
float xPositionOfCharizardB = -75;
boolean charizardF = true;
boolean charizardB = false;
boolean runChizard = true;
int charizardAnimationRepeat = 0;
float charizardTimeDelay;
float yPositionOfCharizard = 0;
float xSpeedOfCharizard = 23; 
float charizardHeight = 300; //width = height * 1.25
int charizardFrameCount = 0;
//////////////////////////////////////////////////////////////////////////////////////////////
PImage aerodactylForward;
PImage aerodactylBack;
float xPositionOfAerodactylF = 1639;
float xPositionOfAerodactylB = -75;
boolean aerodactylF = true;
boolean aerodactylB = false;
boolean runAerodactyl = false;
int AerodactylAnimationRepeat = 0;
float aerodactylTimeDelay;
float yPositionOfAerodactyl = 0;
float xSpeedOfAerodactyl = 23; 
float aerodactylHeight = 300; // height = 1.08 * width
int aerodactylFrameCount = 0;
//////////////////////////////////////////////////////////////////////////////////////////////
PImage fearowForward;
PImage fearowBack;
float xPositionOfFearowF = -1000;
float xPositionOfFearowB = 1639;
boolean fearowF = true;
boolean fearowB = false;
boolean runFearow = false;
int fearowAnimationRepeat = 0;
float fearowTimeDelay;
float yPositionOfFearow = 0;
float xSpeedOfFearow = 23; 
float fearowHeight = 300; // width = 1.09 * height
int fearowFrameCount = 0;


void FlyingAnimations(){
  if(runChizard == true){
    CharizardAnimation();
  }
  if(runAerodactyl == true){
    AerodactylAnimation();
  }
  if(runFearow == true){
    FearowAnimation();
  }
}



void FearowAnimation(){
  fearowTimeDelay = 5*frameRate;
  fearowFrameCount++;
  if (xPositionOfFearowF > 1639) {
    fearowFrameCount = 0;
    xPositionOfFearowF = -1000;
    fearowB = true;
    fearowF = false;
  }
  else if(xPositionOfFearowB < -66){
    fearowAnimationRepeat++;
    fearowFrameCount = 0;
    xPositionOfFearowB = 1639;
    fearowB = false;
    fearowF = true;
  }
  if(fearowF == true && fearowFrameCount > fearowTimeDelay && fearowAnimationRepeat < 2){
    fearowHeight = 300;
    xSpeedOfFearow = 25;
    yPositionOfFearow = map(sin(frameCount * 0.7), -1, 1, 0, 50);
    image(fearowForward, xPositionOfFearowF, yPositionOfFearow, fearowHeight * 1.09, fearowHeight);
    xPositionOfFearowF += xSpeedOfFearow * frameRate / 10;
  }
  else if(fearowB == true && fearowFrameCount > fearowTimeDelay && fearowAnimationRepeat < 2){
    fearowHeight = 60;
    xSpeedOfFearow = 5;
    yPositionOfFearow = map(sin(frameCount * 0.5), -1, 1, 120, 128);
    image(fearowBack, xPositionOfFearowB, yPositionOfFearow, fearowHeight * 1.09, fearowHeight);
    xPositionOfFearowB -= xSpeedOfFearow * frameRate / 10;
  }
  if(fearowAnimationRepeat >= 2 && fearowFrameCount > fearowTimeDelay && runAerodactyl == false){
    if(xPositionOfFearowF > 10){
      image(fearowForward, xPositionOfFearowF, yPositionOfFearow, fearowHeight * 1.09, fearowHeight);
      xPositionOfFearowF += xSpeedOfFearow * frameRate / 10;
      if(xSpeedOfFearow > 10){
        xSpeedOfFearow -= 1;
      }
      if(fearowHeight > 100){
         fearowHeight -= 4;
        yPositionOfFearow = 150 - (fearowHeight/2);
      }
      
    } 
    else{
      fearowHeight = 300;
      xSpeedOfFearow = 25;
      yPositionOfFearow = map(sin(frameCount * 0.7), -1, 1, 0, 50);
      image(fearowForward, xPositionOfFearowF, yPositionOfFearow, fearowHeight * 1.09, fearowHeight);
      xPositionOfFearowF += xSpeedOfFearow * frameRate / 10;
    }
    if(xPositionOfFearowF > 1639){
      runFearow = false;
      //runAerodactyl = false;
      runChizard = false;
    }
  }
 
}

void AerodactylAnimation(){
  aerodactylTimeDelay = 5*frameRate;
  aerodactylFrameCount++;
  if (xPositionOfAerodactylF < -375) {
    aerodactylFrameCount = 0;
    xPositionOfAerodactylF = 1639;
    aerodactylB = true;
    aerodactylF = false;
  }
  else if(xPositionOfAerodactylB > 1639){
    AerodactylAnimationRepeat++;
    aerodactylFrameCount = 0;
    xPositionOfAerodactylB = -75;
    aerodactylB = false;
    aerodactylF = true;
  }
  if(aerodactylF == true && aerodactylFrameCount > aerodactylTimeDelay && AerodactylAnimationRepeat < 2){
    aerodactylHeight = 300;
    xSpeedOfAerodactyl = 25;
    yPositionOfAerodactyl = map(sin(frameCount * 0.7), -1, 1, 0, 50);
    image(aerodactylForward, xPositionOfAerodactylF, yPositionOfAerodactyl, aerodactylHeight/1.08, aerodactylHeight);
    xPositionOfAerodactylF -= xSpeedOfAerodactyl * frameRate / 10;
  }
  else if(aerodactylB == true && aerodactylFrameCount > aerodactylTimeDelay && AerodactylAnimationRepeat < 2){
    aerodactylHeight = 60;
    xSpeedOfAerodactyl = 5;
    yPositionOfAerodactyl = map(sin(frameCount * 0.5), -1, 1, 120, 128);
    image(aerodactylBack, xPositionOfAerodactylB, yPositionOfAerodactyl, aerodactylHeight/1.08, aerodactylHeight);
    xPositionOfAerodactylB += xSpeedOfAerodactyl * frameRate / 10;
  }
  if(AerodactylAnimationRepeat >= 2 && aerodactylFrameCount > aerodactylTimeDelay && runChizard == false){
    if(xPositionOfAerodactylF < 1000){
      image(aerodactylForward, xPositionOfAerodactylF, yPositionOfAerodactyl, aerodactylHeight/1.08, aerodactylHeight);
      xPositionOfAerodactylF -= xSpeedOfAerodactyl * frameRate / 10;
      if(xSpeedOfAerodactyl > 10){
        xSpeedOfAerodactyl -= 1;
      }
      if(aerodactylHeight > 50){
         aerodactylHeight -= 4;
        yPositionOfAerodactyl = 150 - (aerodactylHeight/2);
      }
      
    } 
    else{
      aerodactylHeight = 300;
      xSpeedOfAerodactyl = 25;
      yPositionOfAerodactyl = map(sin(frameCount * 0.7), -1, 1, 0, 50);
      image(aerodactylForward, xPositionOfAerodactylF, yPositionOfAerodactyl, aerodactylHeight/1.08, aerodactylHeight);
      xPositionOfAerodactylF -= xSpeedOfAerodactyl * frameRate / 10;
    }
    if(xPositionOfAerodactylF < -100){
      //runFearow = true;
      runAerodactyl = false;
      runChizard = false;
    }
  }
}




void CharizardAnimation(){
  charizardTimeDelay = 5*frameRate;
  charizardFrameCount++;
  if (xPositionOfCharizardF < -375) {
    charizardFrameCount = 0;
    xPositionOfCharizardF = 1639;
    charizardB = true;
    charizardF = false;
  }
  else if(xPositionOfCharizardB > 1639){
    charizardAnimationRepeat++;
    charizardFrameCount = 0;
    xPositionOfCharizardB = -75;
    charizardB = false;
    charizardF = true;
  }
  if(charizardF == true && charizardFrameCount > charizardTimeDelay && charizardAnimationRepeat < 2){
    charizardHeight = 300;
    xSpeedOfCharizard = 25;
    yPositionOfCharizard = map(sin(frameCount * 0.7), -1, 1, 0, 50);
    image(charizardForward, xPositionOfCharizardF, yPositionOfCharizard, charizardHeight * 1.25, charizardHeight);
    xPositionOfCharizardF -= xSpeedOfCharizard * frameRate / 10;
  }
  else if(charizardB == true && charizardFrameCount > charizardTimeDelay && charizardAnimationRepeat < 2){
    charizardHeight = 60;
    xSpeedOfCharizard = 5;
    yPositionOfCharizard = map(sin(frameCount * 0.5), -1, 1, 120, 128);
    image(charizardBack, xPositionOfCharizardB, yPositionOfCharizard, charizardHeight * 1.25, charizardHeight);
    xPositionOfCharizardB += xSpeedOfCharizard * frameRate / 10;
  }
  if(charizardAnimationRepeat >= 2 && charizardFrameCount > charizardTimeDelay && runFearow == false){
    if(xPositionOfCharizardF < 1100){
      image(charizardForward, xPositionOfCharizardF, yPositionOfCharizard, charizardHeight * 1.25, charizardHeight);
      xPositionOfCharizardF -= xSpeedOfCharizard * frameRate / 10;
      if(xSpeedOfCharizard > 10){
        xSpeedOfCharizard -= 1;
      }
      if(charizardHeight > 50){
        charizardHeight -= 3;
        yPositionOfCharizard = 150 - (charizardHeight/2);
      }
      
    } 
    else{
      charizardHeight = 300;
      xSpeedOfCharizard = 25;
      yPositionOfCharizard = map(sin(frameCount * 0.7), -1, 1, 0, 50);
      image(charizardForward, xPositionOfCharizardF, yPositionOfCharizard, charizardHeight * 1.25, charizardHeight);
      xPositionOfCharizardF -= xSpeedOfCharizard * frameRate / 10;
    }
    if(xPositionOfCharizardF < -100){
      runFearow = true;
      runAerodactyl = true;
      runChizard = false;
    }
  }

}
