class Follower extends Enemy {

  Follower(int x, int y) {
    super(1000, 50, x, y);
    xp = 2;
  }

  void show() {
    fill(sprinkle);
    stroke(sprinkle);
    strokeWeight(2);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textAlign(CENTER);
    textFont(Candy1);
    textSize(20);
    text(hp, location.x, location.y);  
  }

  void act() {
    super.act();

    if (myHero.location.x - location.x <= 50 && myHero.location.y - location.y <= 200) {
      velocity = new PVector(myHero.location.x-location.x, myHero.location.y-location.y);
      velocity.setMag(2);
    } else {
      velocity = new PVector (0, 1);
      velocity.rotate(random(0, TWO_PI));
      velocity.setMag(4);
    }
  }
}

class Shooter extends Enemy {

  int stimer;
  int bulletspeed;

  Shooter(int x, int y) {
    super(5000, 50, x, y);
    stimer = 0;
    bulletspeed = 10;
    xp = 10;
  }

  void show() {
    fill(blue);
    stroke(blue);
    strokeWeight(2);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textAlign(CENTER);
    textFont(Candy1);
    textSize(20);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();
    stimer++;
    if (stimer == 120) {
      PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      aimVector.setMag(bulletspeed);
      myObjects.add(new EnemyBullets(aimVector, location.x, location.y, pink, 10));
      stimer = 0;
    }
  }
}

class Pool extends Enemy {

  int spawntimer, dronespeed;

  Pool(int x, int y) {
    super(20000, 100, x, y);
    spawntimer = 0;
    dronespeed = 5;
    xp = 50;
  }

  void show() {
    fill(yellow);
    stroke(yellow);
    strokeWeight(2);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textAlign(CENTER);
    textFont(Candy1);
    textSize(20);
    text(hp, location.x, location.y);
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
    super(100, 25, x, y);
    location = new PVector (lx, ly);
    xp = 1;
  }

  void show() {
    fill(sprinkle);
    stroke(sprinkle);
    strokeWeight(2);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textAlign(CENTER);
    textFont(Candy1);
    textSize(20);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();

    velocity = new PVector(myHero.location.x-location.x, myHero.location.y-location.y);
    velocity.setMag(2);
  }
}
