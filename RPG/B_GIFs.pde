class AnimatedGIF {
  PImage[] pics;
  int numFrames;
  int currentFrame;
  float x, y, w, h;

  AnimatedGIF( int nf, String pre, String post) {                    
    x = width/2;
    y = height/2;
    w = width;
    h = height;
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i<nf) {
      pics[i] = loadImage(pre +i+ post);
      i++;
    }
    currentFrame = 0;
  }

  AnimatedGIF( int nf, String pre, String post, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i<nf) {
      pics[i] = loadImage(pre +i+ post);
      i++;
    }
    currentFrame = 0;
  }




  void show() {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], width*0.1, height*0.9, w/10, h/10);
    currentFrame++;
  }
}
