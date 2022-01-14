class Boss extends GameObject {

  AnimatedGIF currentAction;
  int transparency_counter;
  int hpMax;
  int spawntimer, dronespeed;

  Boss(int x, int y) {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    size = 100;
    roomX = x;
    roomY = y;
    transparency_counter = 255;
    hp = 50000;
    hpMax = 50000;
    spawntimer = 0;
    dronespeed = 10;
    xp = 200;
    currentAction = golemIdle;
  }

  void show() {
    currentAction.show(location.x, location.y, size*2, size*2);
    drawHealthBar();
  }

  void drawHealthBar() {
    rectMode(CORNER);
    noStroke();
    fill(0, transparency_counter);
    rect(location.x - 15, location.y - (size/2+12), 30, 6);

    fill(#FF717C, transparency_counter);
    rect(location.x - 14, location.y - (size/2+11), 28, 4);

    fill(#7CFF70, transparency_counter);
    float lifemeter = map (hp, 0, hpMax, 0, 28);
    rect(location.x - 14, location.y - (size/2+11), lifemeter, 4);
  }

  void act() {
    spawntimer++;
    if (spawntimer == 120) {
      PVector aimVector = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      aimVector.setMag(dronespeed);
      myObjects.add(new Dronebullet(aimVector, location.x, location.y, pink, 10));
      spawntimer = 0;
    }
    int i = 0;
    while (i < myObjects.size()) {//collision code
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {
        int t = 0;
        while (t < 30) {
          myObjects.add(new bparticles(5, location.x, location.y, chocolate));
          t++;
        }
        if (gun == 4) {
          hp = hp - 25000;
          obj.hp = 0;
        } else if (gun == 1) {
          hp = hp - 50*dmgmult;
          obj.hp = 0;
        } else if (gun == 3) {
          hp = hp - 20*dmgmult;
          obj.hp = 0;
        } else if (gun == 2) {
          float dis, dmgx;
          dis = dist(location.x, location.y, myHero.location.x, myHero.location.y);
          dmgx = map (dis, 0, 200, 50, 1);
          hp = hp - int(dmgx)*dmgmult;
          obj.hp = 0;
        }
      }
      i++;
    }

    if (hp <= 0) {
      myObjects.add(new Message(roomX, roomY, location.x, location.y, xp));
      myHero.xp += xp;
    }
  }
}
