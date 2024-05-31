boolean addRedBar = false;
float addRedBarOnX = 0;
////////////////////////////////////////////////////////
boolean opponentShocked = false;
int shockFrameCount = 0;
float shockDelay;
/////////////////////////////////////////////////////////////////////
PImage opponentExp;
float OpponentOnScreenFrameCount = 0;
boolean opponentDeath = false;
boolean opponentLost = false;
boolean opponentRight = true;
boolean opponentLeft = false;
boolean opponentReachedDesiredPosition = false;
float opponentSpeed = 15;
float xPositionOfOpponent;
float yPositionOfOpponent;
float prevXPositionOfOpponent;
float prevYPositionOfOpponent;
float opponentHeight;
float desiredXPositionOfOpponent;
float opponentExpDelay;
int opponentExpFrameCount = 0;
float oppoentExpHeight;
/////////////////////////////////////////////////////////////////
PImage tyranitar;
PImage tyranitarInv;
float tyranitarHeight = 350;
float xPositionOfTyranitar = -350;
float yPositionOfTyranitar = 315; // 665 - height
/////////////////////////////////////////////////
PImage espeaon;
PImage espeaonInv;
float espeaonHeight = 150;
float xPositionOfEspeaon = -150;
float yPositionOfEspeaon = 500; 
///////////////////////////////////////////////////
PImage snivy;
PImage snivyInv;
float snivyHeight = 175;
float xPositionOfSnivy = -193;
float yPositionOfSnivy = 490;
///////////////////////////////////////////////////////
PImage regice;
PImage regiceInv;
float regiceHeight = 250;
float xPositionOfRegice = -250;
float yPositionOfRegice = 400; 
//////////////////////////////////////////////////
PImage raichu;
PImage raichuInv;
float raichuHeight = 120;
float xPositionOfRaichu = -50;
float yPositionOfRaichu = 535; // 665 - height


void OpponentChosen(){
  if(callTyranitarAnimation == true){
    OpponentAnimation(tyranitar, tyranitarInv, tyranitarHeight, yPositionOfTyranitar);
  }
  if(callEspeaonAnimation == true){
    OpponentAnimation(espeaon, espeaonInv, espeaonHeight, yPositionOfEspeaon);
  }
  if(callSnivyAnimation == true){
    OpponentAnimation(snivy, snivyInv, snivyHeight, yPositionOfSnivy);
  }
  if(callRegiceAnimation == true){
    OpponentAnimation(regice, regiceInv, regiceHeight, yPositionOfRegice);
  }
  if(callRaichuAnimation == true){
    OpponentAnimation(raichu, raichuInv, raichuHeight, yPositionOfRaichu);
  }
}




void HealthBar(float xPositionOfOpponent, float yPositionOfOpponent, float opponentWidth){
  stroke(0);  
  strokeWeight(1);    
  noFill();          
  rect(xPositionOfOpponent + (opponentWidth/2.5), yPositionOfOpponent - 20, 100, 10);
  noStroke();
  fill(0, 255, 0);
  rect(xPositionOfOpponent + (opponentWidth/2.5), yPositionOfOpponent - 20, 100, 10-1);
  fill(255, 0, 0);
  rect(xPositionOfOpponent + (opponentWidth/2.5) + (100 - addRedBarOnX), yPositionOfOpponent - 20, addRedBarOnX, 10-1);
  if(addRedBar == true && showBolt == false && addRedBarOnX < 100){
    opponentShocked = true;
    shockFrameCount = 0;
    addRedBarOnX += 20;
    addRedBar = false;
  }
  else if(addRedBarOnX >= 100 && opponentLost == false){
    shockFrameCount = 0;
    opponentLost = true;
  }
  if(xPositionOfPikachu > xPositionOfOpponent - 203 && xPositionOfPikachu < xPositionOfOpponent + opponentWidth && pikachuRight == true && showBolt == true){
    addRedBar = true;
  }
  else if(xPositionOfPikachu < xPositionOfOpponent + opponentWidth+80 && xPositionOfPikachu > xPositionOfOpponent+40 && pikachuLeft == true && showBolt == true){
    addRedBar = true;
  }
}




void OpponentAnimation(PImage opponent, PImage opponentInv, float opponentHeight, float yPositionOfOpponentStatic){
    OpponentOnScreenFrameCount++;
    if(opponentRight == true && opponentDeath == false){
      image(opponent, xPositionOfOpponent, yPositionOfOpponent, opponentHeight, opponentHeight);
    }
    else if(opponentLeft == true && opponentDeath == false){
      image(opponentInv, xPositionOfOpponent, yPositionOfOpponent, opponentHeight, opponentHeight);
    }
    if(xPositionOfOpponent < desiredXPositionOfOpponent && opponentRight == true && opponentShocked == false && opponentLost == false){
      xPositionOfOpponent += opponentSpeed;
      prevXPositionOfOpponent = xPositionOfOpponent;
      yPositionOfOpponent = map(sin(frameCount * 5), -1, 1, yPositionOfOpponentStatic-20, yPositionOfOpponentStatic);
      prevYPositionOfOpponent = yPositionOfOpponent;
    }
    else if(xPositionOfOpponent > desiredXPositionOfOpponent && opponentLeft == true && opponentShocked == false && opponentLost == false){
      xPositionOfOpponent -= opponentSpeed;
      prevXPositionOfOpponent = xPositionOfOpponent;
      yPositionOfOpponent = map(sin(frameCount * 5), -1, 1, yPositionOfOpponentStatic-20, yPositionOfOpponentStatic);
      prevYPositionOfOpponent = yPositionOfOpponent;
    }
    if(xPositionOfPikachu > xPositionOfOpponent + 250 && opponentReachedDesiredPosition == false){
      opponentRight = true;
      opponentLeft = false;
    }
    else if(xPositionOfPikachu < xPositionOfOpponent && opponentReachedDesiredPosition == false){
      opponentLeft = true;
      opponentRight = false;
    }
    if(xPositionOfPikachu < xPositionOfOpponent + opponentHeight+80 && xPositionOfPikachu > xPositionOfOpponent && opponentReachedDesiredPosition == false){
      opponentReachedDesiredPosition = true;
      desiredXPositionOfOpponent = random(0, 1400);
      if(desiredXPositionOfOpponent > xPositionOfOpponent){
        opponentRight = true;
        opponentLeft = false;
      }
      else if(desiredXPositionOfOpponent < xPositionOfOpponent){
        opponentRight = false;
        opponentLeft = true;
      }
    }
    else if( xPositionOfPikachu > xPositionOfOpponent - 203 && xPositionOfPikachu < xPositionOfOpponent && opponentReachedDesiredPosition == false){
      opponentReachedDesiredPosition = true;
      desiredXPositionOfOpponent = random(0, 1400);
      if(desiredXPositionOfOpponent > xPositionOfOpponent){
        opponentRight = true;
        opponentLeft = false;
      }
      else if(desiredXPositionOfOpponent < xPositionOfOpponent){
        opponentRight = false;
        opponentLeft = true;
      }
   }
   if(xPositionOfOpponent >= desiredXPositionOfOpponent && opponentRight == true){
     opponentReachedDesiredPosition = false;
   } 
   else if(xPositionOfOpponent <= desiredXPositionOfOpponent && opponentLeft == true){
     opponentReachedDesiredPosition = false;
   }
   if(opponentDeath == false){
     HealthBar(xPositionOfOpponent, yPositionOfOpponent, opponentHeight);
   }
   shockDelay = 1.5 * frameRate;
   if(opponentShocked == true && shockFrameCount < shockDelay){
     shockFrameCount++;
     xPositionOfOpponent = map(sin(frameCount * 10), -1, 1, prevXPositionOfOpponent + 20, prevXPositionOfOpponent);
     yPositionOfOpponent = map(sin(frameCount * 10), -1, 1, prevYPositionOfOpponent + 20, prevYPositionOfOpponent);
   }
   else opponentShocked = false;
   
   if(opponentLost == true && shockFrameCount <  3 * frameRate){
     shockFrameCount++;
     xPositionOfOpponent = map(sin(frameCount * 10), -1, 1, prevXPositionOfOpponent + 20, prevXPositionOfOpponent);
     yPositionOfOpponent = map(sin(frameCount * 10), -1, 1, prevYPositionOfOpponent + 20, prevYPositionOfOpponent);
   }
   else if(shockFrameCount >=  3 * frameRate){
     opponentExpDelay = 2 * frameRate;
     if(opponentExpFrameCount < opponentExpDelay){
       opponentExpFrameCount++;
       oppoentExpHeight = opponentHeight * 1.5;
       image(opponentExp, xPositionOfOpponent - (opponentHeight/5), yPositionOfOpponent - (opponentHeight/5) , oppoentExpHeight * 1.17, oppoentExpHeight);
       opponentDeath = true;
     }
     else{
      OpponentOnScreenFrameCount = 0;
      opponentReachedDesiredPosition = false;
      callTyranitarAnimation = true;
      callPikachuAnimation = true;
      opponentDeath = false;
      opponentLost = false;
      opponentRight = true;
      opponentLeft = false;
      opponentShocked = false;
      shockFrameCount = 0;
      opponentExpFrameCount = 0;
      shockFrameCount = 0;
      addRedBar = false;
      addRedBarOnX = 0;
      callTyranitarAnimation = false;
      callEspeaonAnimation = false;
      callSnivyAnimation = false;
      callRegiceAnimation = false;
      callRaichuAnimation = false;
     }
   }
}
