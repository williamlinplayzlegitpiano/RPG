class Button {

  int x, y;
  float w, h, wexpanded, hexpanded, woriginal, horiginal;
  boolean clicked;
  color c, border;
  String text;
  int textsize;

  Button(String t, int _x, int _y, int _w, int _h, color clr, color bord, int ts) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    c = clr;
    border = bord;
    clicked = false;
    wexpanded = 1.2 * _w;
    hexpanded = 1.2 * _h;
    woriginal = _w;
    horiginal = _h;
    textsize = ts;
  }  

  void show() {
    //rectangle
    rectMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      w = wexpanded;
      h = hexpanded;
    } else {
      w = woriginal;
      h = horiginal;
    }
    fill(c);
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    //text label
    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    } else {
    }
    textSize(textsize);
    fill(border);
    text(text, x, y);

    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked  = true;
    } else {
      clicked = false;
    }
  }
}
