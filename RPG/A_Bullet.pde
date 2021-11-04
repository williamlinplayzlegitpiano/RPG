class Bullet extends GameObject {

  PVector nudge;
  int size;

  Bullet() {
    hp = 1;
    location = new PVector(myHero.location.x, myHero.location.y);
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(-20);
    location.add(nudge);
    velocity = new PVector(myHero.direction.x, myHero.direction.y);
    velocity.setMag(12);
    velocity.add(myHero.velocity);
  }

  void show() {
    fill(chocolate);
    circle(location.x, location.y, size);
  }

  void act() {
    location.add(velocity);
    if (location.x < width*0.9 || location.x > width*0.1 || location.y < height*0.9 || location.y > height*0.1) {
      hp = 0;
    }
  }
}
