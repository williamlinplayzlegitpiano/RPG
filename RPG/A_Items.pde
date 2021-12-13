class items extends GameObject {

  int type, randomizerone, randomizertwo;
  color c;
  Weapons w;

  items(float x, float y, int rx, int ry) {
    type = 0;
    w = new Bombardo();
    hp = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
    c = yellow;
    randomizerone = int(random(0, 100));
    randomizertwo = int(random(0, 100));
  }

  void show() {
    if (randomizerone >=50 && randomizertwo >= 50) {
      type = WEAPON;
      stroke(black);
      strokeWeight(2);
      fill(255, 0, 0);
      circle(location.x, location.y, size);
    } else if (randomizerone >= 50 && randomizertwo < 50) {
      type = HEALTH;
      stroke(black);
      strokeWeight(2);
      fill(green);
      circle(location.x, location.y, size);
    } else if (randomizerone < 50 && randomizertwo >= 50) {
      type = DMG;
      stroke(black);
      strokeWeight(2);
      fill(yellow);
      circle(location.x, location.y, size);
    } else {
      type = SPEED;
      stroke(black);
      strokeWeight(2);
      fill(blue);
      circle(location.x, location.y, size);
    }
  }
}
