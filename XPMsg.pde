class Message extends GameObject {

  int ts;

  Message(int rx, int ry, float lx, float ly, int _xp) {
    roomX = rx;
    roomY = ry;
    location = new PVector(lx, ly);
    velocity = new PVector(0, -1);
    xp = _xp;
    hp = 255;
    ts = 40;
  }

  void show() {
    textFont(Candy3);
    textSize(ts);
    fill(red, hp);
    text("+"+xp, location.x, location.y);
  }

  void act() {
    super.act();
    hp = hp - 2;
    if (myHero.roomX != roomX && myHero.roomY != roomY) {
      hp = 0;
    }
  }
}
