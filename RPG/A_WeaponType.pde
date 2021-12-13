class Avada extends Weapons {
  Avada() {
    super(60, 33, green);
    laserbeam = false;
    gun = 0;
  }
}

class Stupefy extends Weapons {
  Stupefy() {
    super(25, 3, red);
    laserbeam = false;
    gun = 1;
  }
}

class Aguamenti extends Weapons {
  Aguamenti() {
    super(0.05, 20, blue);
    gun = 2;
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
    super(100, 5, white);
    laserbeam = false;
    gun = 3;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      for (int i = 0; i < 15; i++) {
        PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
        aimVector.rotate(random(-0.3, 0.3));
        aimVector.setMag(bulletspeed*2);
        myObjects.add(new Bullet(aimVector, strawberry, 10));
      }
      shotTimer = 0;
    }
  }
}
