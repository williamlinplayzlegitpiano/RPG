class Weapons {

  int shotTimer;
  float threshold;
  int bulletspeed;
  color c;

  Weapons() {
    shotTimer = 0;
    threshold = 30;
    bulletspeed = 5;
  }

  Weapons(float thr, int bs, color bc) {
    shotTimer = 0;
    threshold = thr;
    bulletspeed = bs;
    c = bc;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
      aimVector.setMag(bulletspeed);
      myObjects.add(new Bullet(aimVector, c, 10));
      shotTimer = 0;
    }
  }
}
