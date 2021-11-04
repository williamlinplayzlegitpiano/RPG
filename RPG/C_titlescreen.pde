void titlescreen() {
  background(0);
  //TITLE TEXT
  textAlign(CENTER, CENTER);
  fill(sprinkle);
  textFont(Candy1);
  textSize(100);
  text("Candy Thief", 400, 155);

  //START BUTTON
  rectMode(CENTER);
  strokeWeight(2);
  stroke(sprinkle);
  fill(sprinkle,200);
  int x, y, w, h;
  x = 400;
  y = 340;
  if (mouseX > 300 && mouseX < 500 && mouseY > 290 && mouseY < 390) {
    w = 220;
    h = 110;
  } else {
    w = 200;
    h = 100;
  }
  rect(x, y, w, h);

  //START BUTTON TEXT
  fill(sprinkle,230);
  textFont(Candy1);
  if (mouseX > 300 && mouseX < 500 && mouseY > 290 && mouseY < 390) {
    textSize(65);
  } else {
    textSize(60);
  }
  text("Play", 400, 315);
  
  introGIF.show();
  
  //startButton.show();

  //if (startButton.clicked) {
  //  presetting();
  //}
}



void titlescreenClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 290 && mouseY < 390) {
    mode = presetting;
  }
}
