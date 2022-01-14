class grid {
  float x, y, size;
  float d;

  grid (float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
  }

  void show () {
   image(brick, x, y, size, size);
  }
}
