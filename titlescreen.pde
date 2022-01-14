void titlescreen() {

  introGIF.show();
  //TITLE TEXT
  textAlign(CENTER, CENTER);
  fill(sprinkle);
  textFont(Candy1);
  textSize(80);
  text("Dungeon Crawl", 400, 155);

  startButton.show();

  if (startButton.clicked) {
    mode = presetting;
  }
}
