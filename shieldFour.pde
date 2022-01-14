class shieldFour extends GameObject {

  float angle;

  shieldFour() {
    location = new PVector (0, 1);
    size = 10;
    hpMax = 100000000;
    angle = PI + PI/2;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    if (angle >= TWO_PI) {
      angle = 0;
    } else {
      angle += 0.03;
    }
    location = new PVector (myHero.location.x + cos(angle)*60, myHero.location.y + sin(angle)*60);
    fill(180);
    imageMode(CENTER);
    image(shield, location.x, location.y, size*3, size*3);
  }

  void act() {
    super.act();
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject obj = myObjects.get(i);
      if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
        if (obj instanceof EnemyBullets && isCollidingWith(obj)) {
          obj.hp = 0;
        }
        if (obj instanceof Enemy && isCollidingWith(obj)) {
          obj.hp -= 10;
        }
      }
    }
  }
}
