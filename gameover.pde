void gameover() {
  if (win == true) {
    poggers.show();
  } else {
    rick.show();
  }
  textSize(50);
  text("GAMEOVER", 400, 155);
  againButton.show();

  if (againButton.clicked) {
    mode = titlescreen;
    gun = 1;
    globaltimer = 0;
    dmgmult = 1;
    spellOne = spellTwo = spellThree = false;
    win = false;
    endgametimer = 0;
    laserbeam = false;
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
    mode = 1;
  }
}
