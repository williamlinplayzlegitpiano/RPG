import processing.javafx.*;

int mode;
final int titlescreen = 1;
final int presetting = 2;
final int game = 3;
final int revive = 4;
final int gameover = 5;

AnimatedGIF introGIF;
//AnimatedButton introButton;

boolean w, a, s, d;

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

Button startButton;
//Button blueButton, greenButton, pinkButton, blackButton;
//color bkg;

color blue   = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;

PImage map;

int guntype;

void setup() {
  size(800, 600, FX2D);
  mode = 1;

  introGIF = new AnimatedGIF(14, "frame_", "_delay-0.15s.gif");

  Candy1 = createFont("Delight Candles .ttf", 200);
  Candy2 = createFont("Snowy Holiday.ttf", 200);
  Candy3 = createFont("Snowy Night.ttf", 200);

  startButton = new Button("Candy Thief", 400, 340, 200, 100, sprinkle);
  //bkg = white;
  //blueButton  = new Button("BLUE", 200, 200, 200, 150, blue, pink);
  //greenButton = new Button("GREEN", 200, 400, 200, 150, green, yellow);
  //pinkButton  = new Button("PINK", 400, 650, 600, 200, pink, blue);
  //blackButton = new Button("BLACK", 550, 300, 400, 350, black, white);

  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  myHero = new Hero();
  myObjects = new ArrayList<GameObject>(1000);
  myObjects.add(myHero);
  map = loadImage("map.png");

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

  click();

  //if (blueButton.clicked) {
  //  bkg = blue;
  //}
  //if (greenButton.clicked) {
  //  bkg = green;
  //}
  //if (pinkButton.clicked) {
  //  bkg = pink;
  //}
  //if (blackButton.clicked) {
  //  bkg = black;
  //}

  //guntype

  if (mode == titlescreen) {
    titlescreen();
  } else if (mode == presetting) {
    presetting();
  } else if (mode == game) {
    game();
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
