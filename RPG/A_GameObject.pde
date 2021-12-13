class GameObject {

  PVector location;
  PVector velocity;
  int hp, hpMax;
  int roomX, roomY;
  int size;
  float speed;
  int xp;

  GameObject() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp = 1;
    hpMax = 100;
  }

  void show() {
  }

  void act() {
    location.add(velocity);
    if (location.y < height*0.1) location.y = height*0.1;
    if (location.y > height*0.9) location.y = height*0.9;
    if (location.x < width*0.1) location.x = width*0.1;
    if (location.x > width*0.9) location.x = width*0.9;
  }

  boolean inRoomWith(GameObject myObj) {
    return (roomX == myObj.roomX && roomY == myObj.roomY);
  }

  boolean isCollidingWith(GameObject myObj) {
    float d = dist(myObj.location.x, myObj.location.y, location.x, location.y);
    return (inRoomWith(myObj) && d < size/2 +myObj.size/2 && hp > 0);
  }
}
