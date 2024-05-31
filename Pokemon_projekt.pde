
void setup() {
  size(1639, 691);
  frameRate(60);
  background = loadImage("landscape.png");
  pokemonSign = loadImage("pokemon_sign.png", "png");
  fightSign = loadImage("fight.png", "png");
  charizardForward = loadImage("charizard_forward.png", "png");
  charizardBack = loadImage("charizard_back.png", "png");
  aerodactylForward = loadImage("aerodactyl_forward.png", "png");
  aerodactylBack = loadImage("aerodactyl_back.png", "png");
  fearowForward = loadImage("fearow_forward.png", "png");
  fearowBack = loadImage("fearow_back.png", "png");
  pikachu = loadImage("pikachu.png", "png");
  pikachuInv = loadImage("pikachu_invert.png", "png");
  bolt = loadImage("bolt.png", "png");
  boltInv = loadImage("bolt_invert.png", "png");
  ashStanding = loadImage("ash_standing.png", "png");
  ashThrowing= loadImage("ash_throwing.png", "png");
  pokeball = loadImage("pokeball.png", "png");
  pokeballExplosion = loadImage("pokeball_explosion.png", "png");
  tyranitar = loadImage("tyranitar.png", "png");
  tyranitarInv = loadImage("tyranitar_invert.png", "png");
  espeaon = loadImage("espeaon.png", "png");
  espeaonInv = loadImage("espeaon_invert.png", "png");
  snivy = loadImage("snivy.png", "png");
  snivyInv = loadImage("snivy_invert.png", "png");
  regice = loadImage("regice.png", "png");
  regiceInv = loadImage("regice_invert.png", "png");
  raichu = loadImage("raichu.png", "png");
  raichuInv = loadImage("raichu_invert.png", "png");
  opponentExp = loadImage("opponent_explosion.png", "png");
}

void draw() {
  DrawBackground();
  IntroSequence();
  if(IntroSequenceEnd == true){
    FlyingAnimations();
    FightMenu(); //<>//
    OpponentChosen();
    AshAnimation();
  }
}

void keyPressed() {
 ControlPikachu();
}

void mousePressed() {
  ChooseOpponent();
}
