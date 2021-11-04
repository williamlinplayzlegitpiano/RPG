class Weapons {

  //PVector location;
  //PVector direction;
  //PVector velocity;
  
  int shotTimer;
  int threshold;
  int bulletspeed;

  Weapons() {
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity = new PVector(myHero.velocity.x, myHero.velocity.y);
    direction = new PVector(mouseX, mouseY);
    shotTimer = 0;
    threshold = 30;
    bulletspeed = 5;  
  }
  
  Weapons(int thr, int bs) {
   shotTimer = 0;
   threshold = thr;
   bulletspeed = bs;
  }

  void update() {
   shotTimer++; 
  }

  void shoot() {
   if (shotTimer >= threshold) {
    PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
    aimVector.setMag(bulletspeed);
    myObjects.add(new Bullet(aimVector, strawberry, 10));
    shotTimer = 0;
   }
  }

  void show() {
  }

  void act() {
  //  location.add(velocity);
  //  if (myHero.location.y < height*0.1) location.y = height*0.1;
  //  if (myHero.location.y > height*0.9) location.y = height*0.9;
  //  if (myHero.location.x < width*0.1) location.x = width*0.1;
  //  if (myHero.location.x > width*0.9) location.x = width*0.9;
  //}
}
