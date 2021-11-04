class Hero extends GameObject {
  float speed;
  int roomX, roomY;
  Weapons myWeapon;

  Hero() {
    super();
    speed = 5;
    roomX = 1;
    roomY = 1;
    myWeapon = new Weapons();
  }

  void show() {
    fill(chocolate);
    stroke(strawberry);
    strokeWeight(2);
    circle(location.x, location.y, 40);
  }

  void act() {
    super.act();
    if (w) velocity.y = -speed;
    if (s) velocity.y = speed;
    if (a) velocity.x = -speed;
    if (d) velocity.x = speed;

    if (velocity.mag() > speed) velocity.setMag(speed);

    if (!w && !s) velocity.y = velocity.y * 0.8;
    if (!a && !d) velocity.x = velocity.x * 0.8;

    if (northRoom != #FFFFFF && location.y == height*0.1 && location.x >= width/2-50 && location.x <= width/2 + 50) {
      roomY--;
      location = new PVector (width/2, height*0.9-10);
    }
    if (eastRoom != #FFFFFF && location.x == width*0.9 && location.y >= height/2 -50 && location.y <=height/2 +50) {
      roomX++;
      location = new PVector (width*0.1+10, height/2);
    }
    if (southRoom != #FFFFFF && location.y == height*0.9 && location.x >= width/2-50 && location.x <= width/2 +50) {
      roomY++;
      location = new PVector (width/2, height*0.1+10);
    }

    if (westRoom != #FFFFFF && location.x == width*0.1 && location.y >= height/2 - 50 && location.y <= height/2 + 50) {
      roomX--;
      location = new PVector (width*0.9-10, height/2);
    }
    myWeapon.update();
    if (space) myWeapon.shoot();
  }
}
