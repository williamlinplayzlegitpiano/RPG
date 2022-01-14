class Bullet extends GameObject {

  color col;
  int rectlength;

  Bullet(PVector a, color c, int s) {
    hp = 1;
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = a;
    velocity.add(myHero.velocity);
    col = c;
    size = s;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  Bullet(PVector a, color c, int s, int l) {
    hp = 1;
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = a;
    velocity.add(myHero.velocity);
    col = c;
    size = s;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    fill(col);
    stroke(col);
    if (laserbeam == true) {
      circle(location.x, location.y, size);
    } else {
      circle(location.x, location.y, size);
    }
  }

  void act() {
    location.add(velocity);
    if (location.x > width*0.9 || location.x < width*0.1 || location.y > height*0.9 || location.y < height*0.1) {
      hp = 0;
      int i = 0;
      while (i < 30) {
        myObjects.add(new bparticles(5, location.x, location.y, col));
        i++;
      }
    }
  }
}

class EnemyBullets extends GameObject {

  color bulletcolor;

  EnemyBullets(PVector a, float x, float y, color c, int s) {
    size = s;
    hp = 1;
    location = new PVector(x, y);
    velocity = a;
    bulletcolor = c;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    stroke(white);
    fill(bulletcolor);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);

    if (hp == 0) {
      int i = 0;
      while (i < 30) {
        myObjects.add(new bparticles(5, location.x, location.y, chocolate));
        i++;
      }
    }
  }
}

class Dronebullet extends GameObject {

  color bulletcolor;
  int t;

  Dronebullet(PVector a, float x, float y, color c, int s) {
    size = s;
    hp = 1;
    location = new PVector(x, y);
    velocity = a;
    bulletcolor = c;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    t = 0;
  }

  void show() {
    stroke(white);
    fill(bulletcolor);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    float d = dist(location.x, location.y, myHero.location.x, myHero.location.y);
    if (location.x > width*0.9 || location.x < width*0.1 || location.y > height*0.9 || location.y < height*0.1 || d <= size/2 + myHero.size/2) {
      velocity.x=0;
      velocity.y=0;
      t++;
      if (t == 0) {
        myObjects.add(new Drone(roomX, roomY, location.x, location.y));
        t++;
      } else if (t == 20) {
        myObjects.add(new Drone(roomX, roomY, location.x, location.y));
        t++;
      } else if (t == 40) {
        myObjects.add(new Drone(roomX, roomY, location.x, location.y));
        t++;
      } else if (t == 60) {
        myObjects.add(new Drone(roomX, roomY, location.x, location.y));
        t++;
      } else if (t == 80) {
        myObjects.add(new Drone(roomX, roomY, location.x, location.y));
        t++;
        hp = 0;
      } else {
      }
    }
  }
}


class TurretBullets extends GameObject {

  color bulletcolor;

  TurretBullets(PVector a, float x, float y, color c, int s) {
    size = s;
    hp = 1;
    location = new PVector(x, y);
    velocity = a;
    bulletcolor = c;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {
    stroke(white);
    fill(white);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    if (hp == 0) {
      int i = 0;
      while (i < 30) {
        myObjects.add(new bparticles(5, location.x, location.y, chocolate));
        i++;
      }
    }
  }
}
