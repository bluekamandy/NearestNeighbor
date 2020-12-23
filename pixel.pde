class Pixel {

  int x;
  int y;
  int size = 10;
  int index;
  color c;

  Pixel(int _x, int _y, int _index) {
    x = _x;
    y = _y;
    index = _index;
    c = color((colorCenter + int(random(60))%360), random(70), random(30, 100));
  }

  void display() {
    stroke(c);
    point(x, y);
    fill(360, 0, 100);
    if (centerOn) {
      ellipse(x, y, 5, 5);
    }
  }

  void randomize() {
    x = int(random(width));
    y = int(random(height));
    c = color((colorCenter + int(random(60))%360), random(70), random(30, 100));
  }
}
