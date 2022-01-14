class Hero extends GameObject {

  Weapons myWeapon;
  AnimatedGIF currentAction;
  int transparency_counter;
  boolean right;

  Hero() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp = hpMax = 100;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 40;
    myWeapon = new Stupefy();
    immunity = 0;
    currentAction = manLeft;
    transparency_counter = 255;
  }

  void show() {
    currentAction.show(location.x, location.y, size*1.5, size*1.5);
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
    super.act();

    if (one) {
      myWeapon = new Stupefy();
    }
    if (two && spellOne == true) {
      myWeapon = new Bombardo();
    }
    if (three && spellTwo == true) {
      myWeapon = new Aguamenti();
    }
    if (four && spellThree == true) {
      myWeapon = new Avada();
    }
    immunity++;
    int i = 0;
    while (i<myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if ((obj instanceof Enemy) && isCollidingWith(obj)) {
        if (immunity >= 180) {
          hp = hp - 10;
          immunity = 0;
        }
      }
      if ((obj instanceof EnemyBullets) && isCollidingWith(obj)) {
        if (immunity >= 180) {
          hp = hp - 10;
          obj.hp = 0;
          immunity = 0;
        }
      }
      if (obj instanceof items && isCollidingWith(obj)) {
        items item = (items) obj;
        if (item.type == WEAPON) {
          if (spellOne == true && spellTwo == true) {
            spellThree = true;
          } else if (spellOne == true) {
            spellTwo = true;
          } else {
            spellOne = true;
          }
          item.hp = 0;
        } else if (item.type == HEALTH) {
          if (hp <= hpMax) {
            if (hp < hpMax - 30) {
              hp+=30;
              item.hp = 0;
            } else if (hp > hp - 30 && hp != hpMax) {
              hp = hpMax;
              item.hp = 0;
            } else {
              hp = hpMax;
              item.hp = 0;
            }
          } else {
            item.hp = 0;
          }
        } else if (item.type == DMG) {
          dmgmult = dmgmult + 1;
          item.hp = 0;
        } else {
          speed = speed + 0.3;
          item.hp = 0;
        }
      }
      i++;
    }

    if (w) {
      velocity.y = -speed;
      right = true;
      currentAction = manRight;
    }
    if (s) {
      velocity.y = speed;
      right = false;
      currentAction = manLeft;
    }
    if (a) {
      velocity.x = -speed;
      right = false;
      currentAction = manLeft;
    }
    if (d) {
      velocity.x = speed;
      right = true;
      currentAction = manRight;
    }

    if (velocity.mag() > speed) velocity.setMag(speed);

    if (!w && !s) velocity.y = velocity.y * 0.8;
    if (!a && !d) velocity.x = velocity.x * 0.8;

    if (northRoom != #000000 && location.y == height*0.1 && location.x >= width/2-50 && location.x <= width/2 + 50) {
      roomY--;
      location = new PVector (width/2, height*0.9-10);
    }
    if (eastRoom != #000000 && location.x == width*0.9 && location.y >= height/2 -50 && location.y <=height/2 +50) {
      roomX++;
      location = new PVector (width*0.1+10, height/2);
    }
    if (southRoom != #000000 && location.y == height*0.9 && location.x >= width/2-50 && location.x <= width/2 +50) {
      roomY++;
      location = new PVector (width/2, height*0.1+10);
    }

    if (westRoom != #000000 && location.x == width*0.1 && location.y >= height/2 - 50 && location.y <= height/2 + 50) {
      roomX--;
      location = new PVector (width*0.9-10, height/2);
    }
    myWeapon.update();
    if (space) myWeapon.shoot();
    if (hp <= 0) {
      mode = gameover;
    }
  }
}
