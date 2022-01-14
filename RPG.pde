import processing.javafx.*;
//item variable designation
final int DMG = 0;
final int HEALTH = 1;
final int WEAPON = 2;
final int SPEED = 3;

//global variable for gun held
int gun;

//general timer for randomizers
int globaltimer;

//intro timer for instruction rotation
int introtimer;

//damage multiplier
int dmgmult;

//laser gun toggle (circles -> squares)
boolean laserbeam;

//mode framework variable initialization
int mode;
final int titlescreen = 1;
final int presetting = 2;
final int game = 3;
final int pause = 4;
final int revive = 5;
final int gameover = 6;

//GIF variable initializationrf22
AnimatedGIF introGIF;//title

AnimatedGIF manLeft;//hero animations
AnimatedGIF manRight;

AnimatedGIF rangerIdle;//enemy animations
AnimatedGIF mushroomIdle;
AnimatedGIF golemIdle;

AnimatedGIF portalGIF;//pre-win animation

AnimatedGIF rick;//lose animation
AnimatedGIF poggers;//win animation

AnimatedGIF fairy;//personal turret

boolean w, a, s, d, space, one, two, three, four;//keyboard interaction variables
boolean spellOne, spellTwo, spellThree;//weapon unlock and held variables

//colour palette
color chocolate = #774F38;
color strawberry = #E08E79;
color cake = #F1D4AF;
color vanilla = #ECE5CE;
color sprinkle = #C5E0DC;
color blue   = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;
color red = #FC1414;


//font variable and designation
int textAngle;
PFont Candy1;
PFont Candy2;
PFont Candy3;

//PImage map;
color northRoom, eastRoom, southRoom, westRoom;

//mouse click vairable
boolean mouseReleased;
boolean wasPressed;

//Arraylists
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
ArrayList<grid> myTiles;

//hero variable
Hero myHero;
sideturret myTurret;
shieldOne myShieldOne;
shieldTwo myShieldTwo;
shieldThree myShieldThree;
shieldFour myShieldFour;

//Button Variables
Button startButton, pauseButtonHealth, pauseButtonSpeed, pauseButtonDmg, pauseButton, pauseButtonClose, againButton;

//Map Image
PImage map;

//Item Icons
PImage heal;
PImage dmg;
PImage run;
PImage magic;

//Background Icon
PImage brick;

//Inventory Icons
PImage stunspell;
PImage waterspell;
PImage killspell;
PImage bombspell;

//shield Icon

PImage shield;

//immunity variables
int immunity, immunitytimer;

//win variable for gameover outcome
boolean win;

//portal timer
int endgametimer;

void setup() {
  //variable initializations
  gun = 1;
  globaltimer = 0;
  dmgmult = 1;
  spellOne = spellTwo = spellThree = false;
  win = false;
  endgametimer = 0;
  laserbeam = false;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);


  //parameters
  size(800, 600, FX2D);
  mode = 1;

  //gif load
  introGIF = new AnimatedGIF(13, 2, "introgif/frame_", "_delay-0.1s.gif", 0, 0, 50, 50);

  manLeft = new AnimatedGIF(4, 10, "wizard/left/left_f", ".png");
  manRight = new AnimatedGIF(4, 10, "wizard/right/right_f", ".png");

  rangerIdle = new AnimatedGIF(4, 10, "ranger/idle/idle_f", ".png");
  mushroomIdle = new AnimatedGIF(4, 10, "mushroom/idle_f", ".png");
  golemIdle =  new AnimatedGIF(4, 10, "golem/idle_f", ".png");

  portalGIF = new AnimatedGIF(6, 4, "portalgif/frame_", "_delay-0.13s.gif");

  rick = new AnimatedGIF(90, 3, "gameover/lose/frame_", "_delay-0.05s.gif");
  poggers = new AnimatedGIF(15, 10, "gameover/win/frame_", "_delay-0.04s.gif");
  
  fairy = new AnimatedGIF(4, 10, "turret/idle_f", ".png");

  //font load
  Candy1 = createFont("fonts/Delight Candles .ttf", 200);
  Candy2 = createFont("fonts/Snowy Holiday.ttf", 200);
  Candy3 = createFont("fonts/Snowy Night.ttf", 200);

  //button load
  startButton = new Button("PLAY", 400, 340, 200, 100, sprinkle, chocolate, 45);

  pauseButtonHealth = new Button("+ 10", 150, 175, 50, 50, sprinkle, chocolate, 15);
  pauseButtonSpeed = new Button("+ 0.2", 150, 325, 50, 50, sprinkle, chocolate, 15);
  pauseButtonDmg = new Button("x "+dmgmult, 150, 475, 50, 50, sprinkle, chocolate, 15);
  pauseButton = new Button("PAUSE", 760, 40, 50, 50, sprinkle, chocolate, 10);
  pauseButtonClose = new Button("X", 760, 40, 50, 50, sprinkle, chocolate, 20);
  
  againButton = new Button("AGAIN?", 400, 340, 200, 100, sprinkle, chocolate, 45);

  //free load -> me

  //Variable + Class initialization
  myHero = new Hero();
  myTurret = new sideturret();
  myShieldOne = new shieldOne();
  myShieldTwo = new shieldTwo();
  myShieldThree = new shieldThree();
  myShieldFour = new shieldFour();
  myObjects = new ArrayList<GameObject>(1000);
  myObjects.add(myHero);
  myObjects.add(myTurret);
  myObjects.add(myShieldOne);
  myObjects.add(myShieldTwo);
  myObjects.add(myShieldThree);
  myObjects.add(myShieldFour);

  //image load

  map = loadImage("game/map.png");

  heal = loadImage("items/heal.png");
  dmg = loadImage("items/dmg.png");
  run = loadImage("items/run.png");
  magic = loadImage("items/magic.png");

  brick = loadImage("game/brick.png");

  stunspell = loadImage ("wand/red.png");
  waterspell = loadImage ("wand/blue.png");
  killspell = loadImage ("wand/green.png");
  bombspell = loadImage ("wand/white.png");
  
  shield = loadImage ("shield/shield.png");

  //room initialization
  int a = 0;
  int b = 0;
  while (b < map.height) {
    color c = map.get(a, b);
    if (c == pink) {
      myObjects.add(new Follower(140, 160, a, b));
      myObjects.add(new Follower(160, 140, a, b));
      myObjects.add(new Follower(640, 680, a, b));
      myObjects.add(new Follower(670, 640, a, b));
      myObjects.add(new Follower(400, 300, a, b));
      myObjects.add(new Follower(400, 300, a, b));
    }
    if (c == blue) {
      myObjects.add(new Shooter(150, 150, a, b));
      myObjects.add(new Shooter(650, 450, a, b));
      myObjects.add(new Follower(150, 150, a, b));
      myObjects.add(new Follower(650, 450, a, b));
    }
    if (c == green) {
      myObjects.add(new Boss(a, b));
      myObjects.add(new Shooter(150, 150, a, b));
      myObjects.add(new Shooter(150, 450, a, b));
      myObjects.add(new Shooter(650, 150, a, b));
      myObjects.add(new Shooter(650, 450, a, b));
    }
    if (c == yellow) {
      myObjects.add(new Pool(400, 300, a, b));
    }
    a++;
    if (a == map.width) {
      a = 0;
      b++;
    }
  }

  //darkness cell initialization
  darkness = new ArrayList<DarknessCell>(1000);
  float darknessSize = 5;
  int dx = 0, dy = 0;
  while (dy <height) {
    darkness.add(new DarknessCell(dx, dy, darknessSize));
    dx += darknessSize;
    if (dx >= width) {
      dx = 0;
      dy += darknessSize;
    }
  }

  //background tiles initialization
  myTiles = new ArrayList<grid>(1000);
  float tileSize = 5;
  float tx = 80, ty = 60;
  while (ty < height-50) {
    myTiles.add(new grid(tx, ty, tileSize));
    tx += tileSize;
    if (tx >= width-80) {
      tx = 80;
      ty += tileSize;
    }
  }
}


void draw() {
  //timer run
  globaltimer++;

  //see below
  click();

  //mode framework
  if (mode == titlescreen) {
    titlescreen();
  } else if (mode == presetting) {
    presetting();
  } else if (mode == game) {
    game();
  } else if (mode == pause) {
    pause();
  } else if (mode == revive) {
    revive();
  } else if (mode == gameover) {
    gameover();
  } else {
    println("ERROR: Mode = " + mode);
  }
}

//clicker
void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
