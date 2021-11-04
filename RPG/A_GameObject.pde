class GameObject {

  PVector location;
  PVector velocity;
  int hp;

  GameObject() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    hp = 1;
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
}
  
