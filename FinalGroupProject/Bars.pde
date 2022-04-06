// Shane coded the Bars class

class Bars {
  String state;
  int x, height, difference;
  int y = 500;
  int cases;
  int divider;
  int width = 50;
  PFont font = loadFont("Beirut-12.vlw");
  PFont numFont = loadFont("DiwanKufi-13.vlw");

//constructs the bars to be made drawn from the graphs class
  Bars(int newX, int newHeight, String newState, int newCases, int divider) {
    x = newX;
    height = newHeight;
    state = newState;
    cases = newCases;
    this.divider = divider;
  }

//draws the desired bars
  void draw() {
    fill(44, 156, 145);
    rect(x, y, width, -height); 
    difference = y-height;
    textFont(font);
    fill(0);
    text(state, x+25, y+40);
    fill(0);
    text(cases, x+25, difference);//displays the umber of cases over each bar
    double temp = 500;
    for (double i = 0.0; i < 1.1; i = i + 0.1){
      temp = 500 - ((totalHighestCase*i)/divider);
      line((float)50, (float)temp, (float)55, (float)temp);
      textFont(numFont);
      text((int)(totalHighestCase*i), 25, (int)temp); //this for loop changes the values 
      //on the y axis depending on the desired period of time
    }
}
}
