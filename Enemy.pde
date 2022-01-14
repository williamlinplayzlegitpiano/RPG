class Enemy extends GameObject {

  AnimatedGIF currentAction;
  int transparency_counter;
  int hpMax;

  Enemy() {
    location = new PVector (width/2 + 150, height/2 + 150);
    velocity = new PVector (0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
    transparency_counter = 255;
  }

  Enemy(int ehp, int s, int x, int y) {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = ehp;
    hpMax = ehp;
    size = s;
    roomX = x;
    roomY = y;
    transparency_counter = 255;
  }

  Enemy(int lx, int ly, int ehp, int s, int x, int y) {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = ehp;
    hpMax = ehp;
    size = s;
    roomX = x;
    roomY = y;
    transparency_counter = 255;
    location.x = lx;
    location.y = ly;
  }


  void show() {

    fill(chocolate);
    stroke(black);
    strokeWeight(2);
    ellipse(location.x, location.y, size, size);
    fill(black);
    textAlign(CENTER);
    textFont(Candy1);
    textSize(20);
    text(hp, location.x, location.y);
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
    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {
        int t = 0;
        while (t < 20) {
          myObjects.add(new bparticles(5, location.x, location.y, chocolate));
          t++;
        }
        if (gun == 4) {
          hp = 0;
          obj.hp = 0;
        } else if (gun == 1) {
          hp = hp - 50*dmgmult;
          obj.hp = 0;
        } else if (gun == 3) {
          hp = hp - 20*dmgmult;
          obj.hp = 0;
        } else if (gun == 2) {//farther = less dmg
          float dis, dmgx;
          dis = dist(location.x, location.y, myHero.location.x, myHero.location.y);
          dmgx = map (dis, 0, 200, 50, 1);
          hp = hp - int(dmgx)*dmgmult;
          obj.hp = 0;
        }
      }
      if (obj instanceof TurretBullets && isCollidingWith(obj)) {
        int t = 0;
        while (t < 20) {
          myObjects.add(new bparticles(5, location.x, location.y, chocolate));
          t++;
        }
        hp -= 20;
        obj.hp = 0;
      }
      i++;
    }


    if (hp <= 0) {
      myObjects.add(new Message(roomX, roomY, location.x, location.y, xp));
      myHero.xp += xp;
      if (globaltimer%2 == 0) {
        myObjects.add(new items(location.x, location.y, roomX, roomY));
      }
    }
  }
}
