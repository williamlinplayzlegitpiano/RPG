void pause() {
  cursor(HAND);
  background(black);

  //Exp text
  textAlign (CENTER);
  fill(sprinkle);
  text("XP: "+myHero.xp+"xp", 400, 75);

  textAlign (CENTER);
  fill(sprinkle);
  text("HP costs 2 xp, Speed costs 10xp, Dmg costs 20 xp", 400, 550);


  //pwrup btns
  pauseButtonHealth.show();

  if (pauseButtonHealth.clicked && myHero.xp >=2) {
    myHero.hpMax = myHero.hpMax + 10;
    myHero.hp = myHero.hp + 10;
    myHero.xp = myHero.xp - 2;
  } else {
  }

  pauseButtonSpeed.show();

  if (pauseButtonSpeed.clicked && myHero.xp >=10) {
    myHero.speed = myHero.speed + 0.2;
    myHero.xp = myHero.xp - 10;
  } else {
  }

  pauseButtonDmg.show();

  if (pauseButtonDmg.clicked && myHero.xp >=20) {
    dmgmult = dmgmult + 1;
    myHero.xp = myHero.xp - 20;
  } else {
  }

  //pwrup text
  fill(sprinkle);
  textSize(50);
  textAlign(CENTER);
  text("HEALTH: " + myHero.hpMax, 350, 190);  
  text("SPEED: " + myHero.speed, 350, 337);
  text("DAMAGE: x  " + dmgmult, 350, 487);

  //Close Btn
  pauseButtonClose.show();
  if (pauseButtonClose.clicked) mode = game;
}
 
