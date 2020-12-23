/* //<>//

 Nearest Neighbor Exploration
 by MASOOD
 
 Initiated 12/22/2020
 Last modified 12/23/2020
 
 Notes:
 Spacebar to randomize
 C to turn on centers
 
 */

int count = 100;
Pixel[] pxs;

boolean centerOn = false;

int colorCenter;

void setup() {
  size(500, 500, P2D);
  colorMode(HSB, 360, 100, 100);

  colorCenter = int(random(360));

  pxs = new Pixel[count];

  for (int i = 0; i < count; i++) {
    pxs[i] = new Pixel(int(random(width)), int(random(height)), i);
  }
}

void draw() {
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float[] deltaArray = {};
      for (Pixel px : pxs) {
        float delta = dist(px.x, px.y, x, y);
        deltaArray = append(deltaArray, delta);
      }

      float lowest = dist(0, 0, width, height);
      int lowestIndex = 0;
      for (int i = 0; i < deltaArray.length; i++) {
        if (deltaArray[i] < lowest) {
          lowest = deltaArray[i];
          lowestIndex = i;
        }
      }

      stroke(pxs[lowestIndex].c);
      point(x, y);
    }
  }

  for (Pixel px : pxs) {
    px.display();
  }
}

void keyPressed() {
  if (key == ' ') {
    colorCenter = int(random(360));
    for (Pixel px : pxs) {
      px.randomize();
    }
  }
  if (key == 'c') {
    centerOn = !centerOn;
  }
}
