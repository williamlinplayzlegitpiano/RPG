void game() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawDarkness();
  drawMiniMap();
}

void drawRoom() {
  background(strawberry);

  stroke(vanilla);
  strokeWeight(4);
  line(0, 0, width, height);
  line(0, height, width, 0);

  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  noStroke();
  fill(black);
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  rectMode(CENTER);
  stroke(white);
  fill(cake);
  rect(width/2, height/2, width*0.8, height*0.8);
}

void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    obj.show();
    obj.act();

    if (obj.hp <= 0) {
      myObjects.remove(i);
      i--;
    }
  }
}

void drawLightLayer() {
}

void drawMiniMap() {
  float size = 10;
  int x = 0, y = 0;
  while (y < map.height) {
    color c = map.get(x,y);
    fill(c,150);
    square(x*10+80, y*10+80, size);
    x += 1;
    if (x >= map.width) {
      x = 0;
      y += 1;  
    }
  }
  
  fill(0,0,255);
  square(myHero.roomX*10+80, myHero.roomY*10+80, size);
}

void drawDarkness() {
  for (int i = 0; i < darkness.size(); i++) {
    DarknessCell Cell = darkness.get(i);
    Cell.show();
  }
}
