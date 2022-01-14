class sideturret extends GameObject { //helped by leo qi

  float angle;
  turretbullet w;

  sideturret() {
    location = new PVector (0, 1);
    size = 20;
    hpMax = 100000000;
    angle = 0;
    w = new turretbullet();
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    if (angle >= TWO_PI) {
      angle = 0;
    } else {
      angle += 0.05;
    }
    location = new PVector (myHero.location.x + cos(angle)*100, myHero.location.y + sin(angle)*100);
    fill(blue);
    fairy.show(location.x, location.y, size*2, size*2);
  }

  void act() {
    super.act();
    w.update();
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject obj = myObjects.get(i);
      if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
        if (obj instanceof Enemy) {
          w.turret(obj.location.x, obj.location.y, location.x, location.y);
        }
      }
    }
  }
}
