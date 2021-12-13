import processing.javafx.*;

final int DMG = 0;
final int HEALTH = 1;
final int WEAPON = 2;
final int SPEED = 3;

int gun;
int globaltimer;
float dmgmult;

boolean laserbeam;

int mode;
final int titlescreen = 1;
final int presetting = 2;
final int game = 3;
final int pause = 4;
final int revive = 5;
final int gameover = 6;

AnimatedGIF introGIF;
AnimatedGIF manLeft;
AnimatedGIF manRight;

boolean w, a, s, d, space;

color chocolate = #774F38;
color strawberry = #E08E79;
color cake = #F1D4AF;
color vanilla = #ECE5CE;
color sprinkle = #C5E0DC;

int textAngle;
PFont Candy1;
PFont Candy2;
PFont Candy3;

//PImage map;
color northRoom, eastRoom, southRoom, westRoom;

boolean mouseReleased;
boolean wasPressed;

ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Hero myHero;

Button startButton, pauseButtonHealth, pauseButtonSpeed, pauseButtonDmg, pauseButton, pauseButtonClose;
//Button blueButton, greenButton, pinkButton, blackButton;
//color bkg;

color blue   = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;
color red = #FC1414;

PImage map;

int immunity, immunitytimer;

void setup() {

  gun = 1;
  globaltimer = 0;
  dmgmult = 1;

  laserbeam = false;

  size(800, 600, FX2D);
  mode = 1;

  introGIF = new AnimatedGIF(13, 2, "introgif/frame_", "_delay-0.1s.gif", 0, 0, 50, 50);
  manLeft = new AnimatedGIF(4, 10, "wizard/left/left_f", ".png");
  manRight = new AnimatedGIF(4, 10, "wizard/right/right_f", ".png");

  Candy1 = createFont("Delight Candles .ttf", 200);
  Candy2 = createFont("Snowy Holiday.ttf", 200);
  Candy3 = createFont("Snowy Night.ttf", 200);

  startButton = new Button("PLAY", 400, 340, 200, 100, sprinkle, chocolate, 45);

  pauseButtonHealth = new Button("+ 10", 150, 175, 50, 50, sprinkle, chocolate, 15);
  pauseButtonSpeed = new Button("+ 0.2", 150, 325, 50, 50, sprinkle, chocolate, 15);
  pauseButtonDmg = new Button("x "+dmgmult, 150, 475, 50, 50, sprinkle, chocolate, 15);
  pauseButton = new Button("PAUSE", 760, 40, 50, 50, sprinkle, chocolate, 10);
  pauseButtonClose = new Button("X", 760, 40, 50, 50, sprinkle, chocolate, 20);

  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  myHero = new Hero();
  myObjects = new ArrayList<GameObject>(1000);
  myObjects.add(myHero);

  map = loadImage("map.png");

  int a = 0;
  int b = 0;
  while (b < map.height) {
    color c = map.get(a, b);
    if (c == pink) {
      myObjects.add(new Follower(a, b));
    }
    if (c == blue) {
      myObjects.add(new Shooter(a, b));
    }
    if (c == green) {
      myObjects.add(new Pool(a, b));
    }
    if (c == yellow) {
    }
    a++;
    if (a == map.width) {
      a = 0;
      b++;
    }
  }

  darkness = new ArrayList<DarknessCell>(1000);
  float size = 5;
  int x = 0, y = 0;
  while (y <height) {
    darkness.add(new DarknessCell(x, y, size));
    x += size;
    if (x >= width) {
      x = 0;
      y += size;
    }
  }
}


void draw() {

  globaltimer++;
  click();

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


void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
