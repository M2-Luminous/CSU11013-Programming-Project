// Shane coded the graph class

class Graph {
  int x = 60;
  int y;
  int j;
  int k;
  int divider;
  int currentNumber;
  PFont font = loadFont("LucidaBright-10.vlw");
  Bars[] bars;
  Lines[] lines;

//This creates ten individual bars to display on the graph
  void createBars(int[] cases, String[] states, int divider) {
    this.divider = divider;
    bars = new Bars[10];
    j = 54;
    for (int i = 0; i < 10; i++) {
      int height = (int) cases[j]/divider;
      bars[i] = new Bars(x, height, states[j], cases[j], divider);
      j--;
      x = x + 100;
    }
  }
  
  //draws the bars on the graph
 void draw() {
    if (bars != null) {
      for (int i = 0; i < bars.length; i++) {
        bars[i].draw();
      }
    }
    line(50, 500, 1000, 500);
    line(50, 500, 50, 0);
    fill(0);
  }
}
  
