PImage pikachu;
PImage pikachuInv;
PImage bolt;
PImage boltInv;
boolean callPikachuAnimation = false;
boolean pikachuBool = false;
boolean pikachuRight = false;
boolean pikachuLeft = true;
boolean showBolt = false;
float xPositionOfPikachu = 1639;  
float yPositionOfPikachu; 
float pikachuDelay;
float boltLength = 100;
float boltTime;
int boltFrameCount;
////////////////////////////////////////////////////////////////////////////////////////
PImage ashStanding, ashThrowing;
float xPositionOfAshStanding = 1639;
float yPositionOfAshStanding;
float speedOfAsh = 10;
boolean ashStandingBool = true;
boolean ashThrowingBool = true;
int ashFrameCount;
/////////////////////////////////////////////////////////////////
PImage pokeball;
PImage pokeballExplosion;
boolean pokeballBool = true;
boolean pokeballExplosionBool = true;
float xPositionOfPokeball = 1400;
float yPositionOfPokeball = 550;
float speedOfPokeball = 15; 
int pokeballExplosionCount;




void PikachuAnimation(){
  push();
  if(pikachuRight == true){
    image(pikachuInv, xPositionOfPikachu, yPositionOfPikachu, 123, 115); // width = 1.07*height
    if(showBolt == true && boltFrameCount < boltTime){
      image(boltInv, xPositionOfPikachu + 90, yPositionOfPikachu + 30, boltLength, boltLength * 0.78); // height = width * 0.78
      boltFrameCount++;
    }
    else showBolt = false;
  }
  else if(pikachuLeft == true){
    image(pikachu, xPositionOfPikachu, yPositionOfPikachu, 123, 115); // width = 1.07*height
    if(showBolt == true && boltFrameCount < boltTime){
      image(bolt, xPositionOfPikachu - 65, yPositionOfPikachu + 30, boltLength, boltLength * 0.78); // height = width * 0.78
      boltFrameCount++;
    }
    else showBolt = false;
  }
  pop();
}



void ControlPikachu(){
  if(key == CODED && pikachuBool == true){
     if (keyCode == LEFT && xPositionOfPikachu > 0){
       pikachuLeft = true;
       pikachuRight = false;
       yPositionOfPikachu = map(sin(frameCount * 5), -1, 1, yPositionOfPokeball-80, yPositionOfPokeball-100);
       xPositionOfPikachu -= 5;
    }
    if (keyCode == RIGHT && xPositionOfPikachu < 1516){
      pikachuLeft = false;
      pikachuRight = true;
      yPositionOfPikachu = map(sin(frameCount * 5), -1, 1, yPositionOfPokeball-80, yPositionOfPokeball-100);
      xPositionOfPikachu += 5;
    }
  }
  if (key == 32 && pikachuBool == true){
      boltTime = 1 * frameRate;
      boltFrameCount = 0;
      showBolt = true;  
    }
}





void AshAnimation(){
  pikachuDelay = 4 * frameRate;
  ashFrameCount++;
  float ashStandingDelay = 0 * frameRate;
  float pokeballDelay = 1 * frameRate;
  if(ashFrameCount > ashStandingDelay && ashStandingBool == true){
    image(ashStanding, xPositionOfAshStanding, yPositionOfAshStanding, 187, 250); //height = width * 1.33
    if(xPositionOfAshStanding >= 1400){
      yPositionOfAshStanding = map(sin(frameCount * 5), -1, 1, 395, 375);
      xPositionOfAshStanding -= speedOfAsh; 
    } else yPositionOfAshStanding = 395;
  }
  if(OpponentOnScreenFrameCount > pikachuDelay || callPikachuAnimation == true){
    callPikachuAnimation = true;
    ashStandingBool = false;
    if(ashThrowingBool == true){
      image(ashThrowing, 1420, 395, 166, 250); //height = width * 1.5 
    }
    if(pokeballBool == true){
       image(pokeball, xPositionOfPokeball, yPositionOfPokeball, 40, 40); 
       xPositionOfPokeball -= speedOfPokeball;
       yPositionOfPokeball += speedOfPokeball/1.8;
    }
   if (yPositionOfPokeball > 610) {
     pokeballBool = false;
     pokeballExplosionCount++;
     if(pokeballExplosionBool == true){
       image(pokeballExplosion, xPositionOfPokeball-93, yPositionOfPokeball-150, 226 , 200); //width = height * 1.13
     }
     if(pokeballExplosionCount > pokeballDelay){
       if(pokeballExplosionBool == true){
         xPositionOfPikachu = xPositionOfPokeball-35;
         yPositionOfPikachu = yPositionOfPokeball-80;
       }
       ashThrowingBool = false;
       ashStandingBool = true;
       PikachuAnimation();
       pikachuBool = true;
       pokeballExplosionBool = false;
     }
    }
  }
}
