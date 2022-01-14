class DarknessCell {
  float opacity;
  float x, y, size;
  float d;

  DarknessCell (float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    opacity = 0;
  }

  void show () {
    rectMode(CORNER);
    d = dist(myHero.location.x, myHero.location.y, x, y);
    opacity = map(d, 0, 300, 0, 255);
    noStroke();
    fill(0, opacity);
    square(x, y, size);
  }
  
}
