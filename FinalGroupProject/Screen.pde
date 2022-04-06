// Shane and Kajus worked in pairs switching the coding every 30minutes

class Screen {
  // creating variables
  int x, y, width, height, event;
  ArrayList widgetList;
  String label;
  color screenColor, widgetColor, labelColor;

  // constructor
  Screen (color screenColor) {
    this.screenColor = screenColor;
    widgetList = new ArrayList();
  }
  
  // draws the screen and its buttons
  void draw() {
    background(screenColor);
    tint(255);
    noStroke();
    fill(#333333);
    rect(0, 0, 1200, 50) ;
    stroke(#333333);
    fill(255);
    image(image1, 1000, 13);
    for (int i = 0; i < widgetList.size(); i++) {
      Widget theWidget = (Widget) widgetList.get(i);
      theWidget.draw();
    }
  }

  // returns which buttons has been pressed
  int getEvent(int mX, int mY) {
    for (int i = 0; i < widgetList.size(); i++) {
      Widget theWidget = (Widget) widgetList.get(i);
      if (mX>theWidget.x && mX < theWidget.x + theWidget.width 
        && mY > theWidget.y && mY < theWidget.y+theWidget.height) {
        return theWidget.event;
      }
    }
    return EVENT_NULL;
  }
  
  // returns which button has been pressed with parameters
  int getEvent(int mX, int mY, Widget theWidget) {
    if (mX>theWidget.x && mX < theWidget.x + theWidget.width 
      && mY > theWidget.y && mY < theWidget.y+theWidget.height)
      return theWidget.event;

    return EVENT_NULL;
  }

  // adds buttons to the array
  void addWidget(Widget aWidget) {
    widgetList.add(aWidget);
  }
}
