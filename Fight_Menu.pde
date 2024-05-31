boolean callTyranitarAnimation = false;
boolean callEspeaonAnimation = false;
boolean callSnivyAnimation = false;
boolean callRegiceAnimation = false;
boolean callRaichuAnimation = false;


void FightMenu(){
  image(tyranitar, 20, 20, 100, 100); //width = height * 1
  image(espeaon, 20, 160, 100, 100); //width = height * 1
  image(snivy, 20, 300, 110, 100); //width = height * 1.1
  image(regice, 20, 440, 100, 100); //width = height * 1
  image(raichu, 20, 580, 125, 100); //width = height * 1.25
}


void ChooseOpponent(){
  if(mouseX > 20 && mouseX < 120 && mouseY > 20 && mouseY < 120){ //choose tyranitar
    callTyranitarAnimation = true;
    callEspeaonAnimation = false;
    callSnivyAnimation = false;
    callRegiceAnimation = false;
    callRaichuAnimation = false;
    opponentShocked = false;
    addRedBar = false;
    addRedBarOnX = 0;
    xPositionOfOpponent = xPositionOfTyranitar;
    yPositionOfOpponent = yPositionOfTyranitar;
    opponentHeight = tyranitarHeight;
    desiredXPositionOfOpponent = 150;
    OpponentOnScreenFrameCount = 0;
  }
  else if(mouseX > 20 && mouseX < 120 && mouseY > 160 && mouseY < 260){ //choose espeaon
    callTyranitarAnimation = false;
    callEspeaonAnimation = true;
    callSnivyAnimation = false;
    callRegiceAnimation = false;
    callRaichuAnimation = false;
    opponentShocked = false;
    addRedBar = false;
    addRedBarOnX = 0;
    xPositionOfOpponent = xPositionOfEspeaon;
    yPositionOfOpponent = yPositionOfEspeaon;
    opponentHeight = espeaonHeight;
    desiredXPositionOfOpponent = 150;
    OpponentOnScreenFrameCount = 0;
  }
  else if(mouseX > 20 && mouseX < 130 && mouseY > 300 && mouseY < 400){ //choose snivy
    callTyranitarAnimation = false;
    callEspeaonAnimation = false;
    callSnivyAnimation = true;
    callRegiceAnimation = false;
    callRaichuAnimation = false;
    opponentShocked = false;
    addRedBar = false;
    addRedBarOnX = 0;
    xPositionOfOpponent = xPositionOfSnivy;
    yPositionOfOpponent = yPositionOfSnivy;
    opponentHeight = snivyHeight;
    desiredXPositionOfOpponent = 150;
    OpponentOnScreenFrameCount = 0;
  }
  else if(mouseX > 20 && mouseX < 120 && mouseY > 440 && mouseY < 540){ //choose regice
    callTyranitarAnimation = false;
    callEspeaonAnimation = false;
    callSnivyAnimation = false;
    callRegiceAnimation = true;
    callRaichuAnimation = false;
    opponentShocked = false;
    addRedBar = false;
    addRedBarOnX = 0;
    xPositionOfOpponent = xPositionOfRegice;
    yPositionOfOpponent = yPositionOfRegice;
    opponentHeight = regiceHeight;
    desiredXPositionOfOpponent = 150;
    OpponentOnScreenFrameCount = 0;
  }
  else if(mouseX > 20 && mouseX < 145 && mouseY > 580 && mouseY < 680){ //choose raichu
    callTyranitarAnimation = false;
    callEspeaonAnimation = false;
    callSnivyAnimation = false;
    callRegiceAnimation = false;
    callRaichuAnimation = true;
    opponentShocked = false;
    addRedBar = false;
    addRedBarOnX = 0;
    xPositionOfOpponent = xPositionOfRaichu;
    yPositionOfOpponent = yPositionOfRaichu;
    opponentHeight = raichuHeight;
    desiredXPositionOfOpponent = 150;
    OpponentOnScreenFrameCount = 0;
  }
}
