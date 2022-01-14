void keyPressed () {

  if (key == 'w' || key == 'W')  w = true;
  if (key == 'a' || key == 'A')  a = true;
  if (key == 's' || key == 'S')  s = true;
  if (key == 'd' || key == 'D')  d = true;
  if (key == ' ') space = true;
  if (key == '1') one = true;
  if (key == '2') two = true;
  if (key == '3') three = true;
  if (key == '4') four = true;
}

void keyReleased () {
  if (key == 'w' || key == 'W') w = false;
  if (key == 'a' || key == 'A') a = false;
  if (key == 's' || key == 'S') s = false;
  if (key == 'd' || key == 'D') d = false;
  if (key == ' ') space = false;
  if (key == '1') one = false;
  if (key == '2') two = false;
  if (key == '3') three = false;
  if (key == '4') four = false;
}
