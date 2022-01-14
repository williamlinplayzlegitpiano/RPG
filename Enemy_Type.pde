    class Follower extends Enemy {

  Follower(int locx, int locy, int x, int y) {
    super(locx, locy, 4000, 50, x, y);
    xp = 2;
    currentAction = mushroomIdle;
  }

  void show() {
    currentAction.show(location.x, location.y, size*1.5, size*1.5);
    drawHealthBar();
  }

  void act() {
    super.act();
    velocity = new PVector(myHero.location.x-location.x, myHero.location.y-location.y);
    velocity.setMag(3);
  }
}

class Shooter extends Enemy {

  int stimer;
  int bulletspeed;

  Shooter(int locx, int locy, int x, int y) {
    super(locx, locy, 3000, 50, x, y);
    stimer = 0;
    bulletspeed = 10;
    xp = 10;
    currentAction = rangerIdle;
  }

  void show() {
    currentAction.show(location.x, location.y, size*1.5, size*1.5);
    drawHealthBar();
  }

  void act() {
    super.act();
    stimer++;
    if (myHero.location.x - location.x <= 50 && myHero.location.y - location.y <= 50) {
      velocity = new PVector(myHero.location.x-location.x, myHero.location.y-location.y);
      velocity.rotate(PI);
      velocity.setMag(0.8);
      if (stimer == 120) {
        PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
        aimVector.setMag(bulletspeed);
        myObjects.add(new EnemyBullets(aimVector, location.x, location.y, pink, 10));
        stimer = 0;
      }
    } else {
      if (stimer == 120) {
        PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
        aimVector.setMag(bulletspeed);
        myObjects.add(new EnemyBullets(aimVector, location.x, location.y, pink, 10));
        stimer = 0;
      }
    }
  }
}

class Pool extends Enemy {  

  int spawntimer, dronespeed;

  Pool(int locx, int locy, int x, int y) {
    super(locx, locy, 15000, 100, x, y);
    spawntimer = 0;
    dronespeed = 5;
    xp = 50;
    currentAction = golemIdle;
  }

  void show() {
    currentAction.show(location.x, location.y, size*1.5, size*1.5);
    drawHealthBar();
  }

  void act() {
    super.act();
    spawntimer++;
    if (spawntimer == 120) {
      PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      aimVector.setMag(dronespeed);
      myObjects.add(new Dronebullet(aimVector, location.x, location.y, pink, 10));
      spawntimer = 0;
    }
  }
}

class Drone extends Enemy {

  Drone(int x, int y, float lx, float ly) {
    super(1000, 25, x, y);
    location = new PVector (lx, ly);
    xp = 1;
    currentAction = golemIdle;
  }

  void show() {
    currentAction.show(location.x, location.y, size*1.5, size*1.5);
    drawHealthBar();
  }

  void act() {
    super.act();

    velocity = new PVector(myHero.location.x-location.x, myHero.location.y-location.y);
    velocity.setMag(2);
  }
}
