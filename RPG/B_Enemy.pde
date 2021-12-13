class Enemy extends GameObject {

  Enemy() {
    location = new PVector (width/2 + 150, height/2 + 150);
    velocity = new PVector (0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
  }

  Enemy(int ehp, int s, int x, int y) {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = ehp;
    size = s;
    roomX = x;
    roomY = y;
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

  void act() {
    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {
        int t = 0;
        while (t < 30) {
          myObjects.add(new bparticles(5, location.x, location.y, chocolate));
          t++;
        }
        println("gun:" + gun);
        if (gun == 0) {
          hp = 0;
          obj.hp = 0;
          println(1);
        } else if (gun == 2) {
          hp = hp - 10;
          obj.hp = 0;
        } else {
          hp = hp - int(obj.velocity.mag()*dmgmult);
          obj.hp = 0;
        }
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
