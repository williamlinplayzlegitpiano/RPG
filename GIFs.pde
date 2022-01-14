class AnimatedGIF {
  PImage[] pics;
  int numFrames;
  int currentFrame;
  float x, y, w, h;
  int rate;

  AnimatedGIF(int nf, int r, String pre, String post) {
    numFrames = nf;
    pics = new PImage[nf];
    int i = 0;
    while (i<nf) {
      pics[i] = loadImage(pre +i+ post);
      i++;
    }
    currentFrame = 0;
    rate = r;
  }

  AnimatedGIF( int nf, int r, String pre, String post, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    numFrames = nf;
    pics = new PImage[nf];
    int i = 0;
    while (i<nf) {
      if (i < 10) {
        pics[i] = loadImage(pre +0+i+ post);
        i++;
      } else if (i < 100) {
        pics[i] = loadImage(pre +i+ post);
        i++;
      } else {
        pics[i] = loadImage(pre +i+ post);
        i++;
      }
    }
    currentFrame = 0;
    rate  = r;
  }

  void show() {
    imageMode(CENTER);
    if (currentFrame >= pics.length) currentFrame = 0;
    image(pics[currentFrame], width/2, height/2, width, height);
    if (frameCount % rate == 0) currentFrame++;
  }

  void show(float x, float y, float w, float h) {
    imageMode(CENTER);
    if (currentFrame >= pics.length) currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    if (frameCount % rate == 0) currentFrame++;
  }
}
