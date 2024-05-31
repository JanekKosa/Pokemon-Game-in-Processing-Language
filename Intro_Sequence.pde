PImage pokemonSign;
float xPositionOfPokemonSign = 127;
float yPositionOfPokemonSign = 95;
float pokemonSignHeight = 500; //width = height * 2.77
float pokemonSignDelay;
int pokemonSignFrameCount = 0;
int alpha = 255;
boolean pokemonSignEnd = false;
/////////////////////////////////////////////////////////////////////
PImage fightSign;
float xPositionOfFightSign = 520;
float yPositionOfFightSign = 196;
float fightSignHeight = 300; //width = height * 2
float fightSignDelay;
int fightSignFrameCount = 0;
boolean IntroSequenceEnd = false;



void IntroSequence(){
  if(IntroSequenceEnd == false){
    PokemonSignAnimation();
    FightSignAnimation();
  }
}



void PokemonSignAnimation(){  //<>//
  pokemonSignDelay = 2 * frameRate;
  pokemonSignFrameCount++;
  if(pokemonSignFrameCount < pokemonSignDelay){
    image(pokemonSign, xPositionOfPokemonSign, yPositionOfPokemonSign,pokemonSignHeight * 2.77, pokemonSignHeight);
  }
  else{
    alpha -= 4;
    if(alpha > 150){
      tint(255,alpha);
      image(pokemonSign, xPositionOfPokemonSign, yPositionOfPokemonSign, pokemonSignHeight * 2.77, pokemonSignHeight); 
    }
    else if(alpha > 50 && alpha < 150){
      pokemonSignHeight += 100;
      xPositionOfPokemonSign = xPositionOfPokemonSign - ((100 * 2.77)/2);
      yPositionOfPokemonSign = yPositionOfPokemonSign - (100/2);
      tint(255,alpha);
      image(pokemonSign, xPositionOfPokemonSign, yPositionOfPokemonSign,pokemonSignHeight * 2.77, pokemonSignHeight); 
    }
    else if(alpha < 50){
      tint(255,255);
      pokemonSignEnd = true;
      return;
    }
  }
}


void FightSignAnimation(){ 
  if(pokemonSignEnd == true){
    fightSignDelay = 5 * frameRate;
    fightSignFrameCount++;
    if(fightSignFrameCount < fightSignDelay){
      fightSignHeight = map(sin(frameCount * 0.5), -1, 1, 100, 300);
      xPositionOfFightSign = width/2 - 2*(fightSignHeight/2);
      yPositionOfFightSign = height/2 - fightSignHeight/2;
      image(fightSign, xPositionOfFightSign, yPositionOfFightSign,fightSignHeight * 2, fightSignHeight);
    }
    else{
      image(fightSign, xPositionOfFightSign, yPositionOfFightSign,fightSignHeight * 2, fightSignHeight);
      fightSignHeight -= 20;
      xPositionOfFightSign = xPositionOfFightSign + ((20 * 2)/2);
      yPositionOfFightSign = yPositionOfFightSign + (20/2);
      if(fightSignHeight < 0){
        IntroSequenceEnd = true;
        return;
      }
    }  
  }
}
