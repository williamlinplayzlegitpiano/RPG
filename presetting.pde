void presetting() {

  introtimer++;
  if (introtimer >= 0 && introtimer <= 600) {
    background(black);
    textFont(Candy2);
    textAlign(CENTER);
    stroke(white);
    textSize(50);
    text("Weapon Introduction:", 400, 70);
    strokeWeight(4);
    stroke(40, 40, 40);
    rectMode(CENTER);
    rect(180, 150, 50, 50);
    image(stunspell, 185, 155, 60, 60);
    textSize(30);
    text("DMG: 50 x DmgMult", 400, 135);
    text("Fire Rate: Medium", 400, 155);
    text("Best Against: Nothing", 400, 175);
    rect(180, 230, 50, 50);
    image(bombspell, 185, 235, 60, 60);
    text("DMG: 1 -50 depending on range x DmgMult", 400, 215);
    text("Fire Rate: Fairly Slow", 400, 235);
    text("Best Against: Drones and Followers", 400, 255);
    rect(180, 310, 50, 50);
    image(waterspell, 185, 315, 60, 60);
    text("DMG: 20 x DmgMult", 400, 295);
    text("Fire Rate: Super Fast", 400, 315);
    text("Best Against: Archers", 400, 335);
    rect(180, 390, 50, 50);
    image(killspell, 185, 395, 60, 60);
    text("DMG: InstaKill, half health against boss", 400, 375);
    text("Fire Rate: 10s reload", 400, 395);
    text("Best Against: Boss", 400, 415);
    text("DmgMult: Dmg Buff that can exponentially increase weapon power", 400, 500);
  } else {
  }
  if (introtimer > 600 && introtimer <= 780) {
    background(black);
    textFont(Candy2);
    textAlign(CENTER);
    stroke(white);
    textSize(50);
    text("Item Introduction:", 400, 70);
    strokeWeight(4);
    stroke(40, 40, 40);
    rectMode(CENTER);
    rect(180, 150, 50, 50);
    image(heal, 180, 150, 20, 20);
    textSize(30);
    text("Heal +10", 400, 155);
    rect(180, 230, 50, 50);
    image(dmg, 180, 230, 20, 20);
    text("Damage Mult +1", 400, 235);
    rect(180, 310, 50, 50);
    image(run, 180, 310, 20, 20);
    text("Speed + 0.3", 400, 315);
    rect(180, 390, 50, 50);
    image(magic, 180, 390, 20, 20);
    text("New Spell Unlocked", 400, 395);
  } else {
  }
  if (introtimer > 780 && introtimer <= 1200) {
    background(black);
    textFont(Candy2);
    textAlign(CENTER);
    stroke(white);
    textSize(50);
    text("Enemy Introduction:", 400, 70);
    strokeWeight(4);
    stroke(40, 40, 40);
    rectMode(CENTER);
    rect(180, 150, 50, 50);
    mushroomIdle.show(180, 140, 60, 60);
    textSize(30);
    text("Follower", 400, 155);
    rect(180, 230, 50, 50);
    rangerIdle.show(180, 220, 60, 60);
    text("Ranger", 400, 235);
    rect(180, 310, 50, 50);
    golemIdle.show(180, 300, 60, 60);
    text("Spawner", 400, 315);
    textSize(50);
    text("Controls", 400, 450);
    textSize(30);
    text("WASD for Movement, SPACE to Shoot, Mouse to Aim", 400, 500);
    text("Number Keys for Switching Weapons", 400, 550);
  } else {
  }
  if (introtimer > 1200) {
    mode = game;
  }
}
