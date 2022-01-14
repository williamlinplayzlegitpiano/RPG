class items extends GameObject {

  int type, randomizerone, randomizertwo;
  color c;

  items(float x, float y, int rx, int ry) {
    type = 0;
    hp = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 0);
    size = 30;
    roomX = rx;
    roomY = ry;
    c = yellow;
    randomizerone = int(random(0, 100));
    randomizertwo = int(random(0, 100));
  }

  void show() {
    if (randomizerone >=50 && randomizertwo >= 50) {
      type = WEAPON;
      image(magic, location.x, location.y, size, size);
    } else if (randomizerone >= 50 && randomizertwo < 50) {
      type = HEALTH;
      image(heal, location.x, location.y, size, size);
    } else if (randomizerone < 50 && randomizertwo >= 50) {
      type = DMG;
      image(dmg, location.x, location.y, size, size);
    } else {
      type = SPEED;
      image(run, location.x, location.y, size, size);
    }
  }
}
