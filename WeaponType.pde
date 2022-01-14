class Avada extends Weapons {
  Avada() {
    super(800, 30, green);
    laserbeam = false;
    gun = 4;
  }
}

class Stupefy extends Weapons {
  Stupefy() {
    super(5, 15, red);
    laserbeam = false;
    gun = 1;
  }
}

class Aguamenti extends Weapons {
  Aguamenti() {
    super(0.05, 20, blue);
    gun = 3;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
      aimVector.setMag(bulletspeed);
      laserbeam = true;
      myObjects.add(new Bullet(aimVector, blue, 10));
      shotTimer = 0;
    }
  }
}

class Bombardo extends Weapons {

  Bombardo() {
    laserbeam = false;
    gun = 2;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      for (int i = 0; i < 15; i++) {
        PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
        aimVector.rotate(random(-0.3, 0.3));
        aimVector.setMag(bulletspeed*2);
        myObjects.add(new Bullet(aimVector, white, 10));
      }
      shotTimer = 0;
    }
  }
}

class turretbullet extends Weapons {
  turretbullet() {
    super(10, 20, yellow);
    gun = 3;
  }

  void turret(float x, float y, float tx, float ty) {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(x-tx, y-ty);
      aimVector.setMag(bulletspeed);
      laserbeam = true;
      myObjects.add(new TurretBullets(aimVector, tx, ty, yellow, 10));
      shotTimer = 0;
    }
  }
}
