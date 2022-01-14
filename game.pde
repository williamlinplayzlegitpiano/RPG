void game() {
  drawRoom();
  drawGameObjects();
  drawDarkness();
  drawMiniMap();
  drawHeroDeath();
  drawCrosshair();
  drawinvbox();
  drawPauseButton();
  drawTurretHeroLink();
  drawShieldHeroLink();
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
  if (northRoom != #000000) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #000000) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #000000) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #000000) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  for (int i = 0; i < myTiles.size(); i++) {
    grid tCell = myTiles.get(i);
    tCell.show();
  }
}

void drawGameObjects() {
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show();
      obj.act();
      if (obj.hp <= 0) {
        if (obj instanceof Boss) {
          win = true;
        }
        myObjects.remove(i);
        i--;
      }  
    } else if (obj.roomX != myHero.roomX || obj.roomY != myHero.roomY) {
      if (obj instanceof Bullet || obj instanceof EnemyBullets) {
        myObjects.remove(i);
        i--;
      }
    }
  }
  if (win == true) {
    portalGIF.show();
    if (endgametimer >= 180) {
      mode = gameover;
    } else {
      endgametimer++;
      println(endgametimer);
    }
  }
}


void drawMiniMap() {

  rectMode(CENTER);
  float size = 10;
  int x = 0, y = 0;
  while (y < map.height) {
    color c = map.get(x, y);
    int transparency;
    if (space) {
      transparency = 0;
    } else {
      transparency = 150;
    }
    fill(c, transparency);
    square(x*10+80, y*10+80, size);
    x += 1;
    if (x >= map.width) {
      x = 0;
      y += 1;
    }
  }
  int stransparency;
  if (space) {
    stransparency = 0;
  } else {
    stransparency = 150;
  }
  fill(0, 0, 255, stransparency);
  square(myHero.roomX*10+80, myHero.roomY*10+80, size);
}

void drawDarkness() {
  for (int i = 0; i < darkness.size(); i++) {
    DarknessCell Cell = darkness.get(i);
    Cell.show();
  }
}

void drawHeroDeath() {
  if (myHero.hp <= 0) {
    mode = gameover;
  }
}

void drawCrosshair() {
  noCursor();
  ellipseMode(CENTER);
  stroke(255, 0, 0, 100);
  strokeWeight(3);
  noFill();
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(mouseX, mouseY, 20, 20);
  line(mouseX-15, mouseY, mouseX+15, mouseY);
  line(mouseX, mouseY-15, mouseX, mouseY+15);
}

void drawinvbox() {
  fill(95, 90, 90);
  strokeWeight(4);
  stroke(40, 40, 40);
  rectMode(CORNERS);
  rect(width, height, width*0.7, height*0.9);
  rectMode(CENTER);
  if (gun == 1) {
    fill(70, 89, 255);
  } else {
    fill(103, 255, 93);
  }
  rect(590, 570, 50, 50);
  image(stunspell, 595, 575, 60, 60);
  if (spellOne == true && gun == 2) {
    fill(70, 89, 255);
  } else if (spellOne == true) {
    fill(103, 255, 93);
  } else {
    fill(red);
  }
  rect(650, 570, 50, 50);
  image(bombspell, 655, 575, 60, 60);
  if (spellTwo == true && gun == 3) {
    fill(70, 89, 255);
  } else if (spellTwo == true) {
    fill(103, 255, 93);
  } else {
    fill(red);
  }
  rect(710, 570, 50, 50);
  image(waterspell, 715, 575, 60, 60);
  if (spellThree == true && gun == 4) {
    fill(70, 89, 255);
  } else if (spellThree == true) {
    fill(103, 255, 93);
  } else {
    fill(red);
  }
  rect(770, 570, 50, 50);
  image(killspell, 775, 575, 60, 60);
}

void drawPauseButton() {
  pauseButton.show();
  if (pauseButton.clicked) mode = pause;
}

void drawTurretHeroLink() {
  myTurret.roomX = myHero.roomX;
  myTurret.roomY = myHero.roomY;
}

void drawShieldHeroLink() {
  myShieldOne.roomX = myHero.roomX;
  myShieldOne.roomY = myHero.roomY;
  myShieldTwo.roomX = myHero.roomX;
  myShieldTwo.roomY = myHero.roomY;
  myShieldThree.roomX = myHero.roomX;
  myShieldThree.roomY = myHero.roomY;
  myShieldFour.roomX = myHero.roomX;
  myShieldFour.roomY = myHero.roomY;
}
