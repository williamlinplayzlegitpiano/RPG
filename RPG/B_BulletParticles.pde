class bparticles extends GameObject {

  int t;
  color c;

  bparticles(int s, float x, float y, color _c) {
    hp = 1;
    size = s;
    c = _c;
    t = int(random(200, 255));
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(random(-PI, PI));
    velocity.setMag(6);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    rectMode(CENTER);
    stroke(c, t);
    noFill();
    square(location.x, location.y, size);
  }

  void act() {
    super.act();
    t = t - 10;
    if (t <= 0 ) hp = 0;
  }
}
