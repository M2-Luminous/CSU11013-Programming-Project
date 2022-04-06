// Shane and Kajus coded the Widget class ~ 30min each

class Widget {
  int x, y, width, height, r;
  String label; 
  int event, strokeColor;
  color widgetColor, labelColor;
  PFont widgetFont;
  PImage widgetImage;
  
  Widget() {
  }
  
  // widget constructor
  Widget(int x, int y, int width, int height, int radius,String label, 
    color widgetColor, PFont widgetFont, int event) {
    this.x=x; 
    this.y=y; 
    this.width=width; 
    this.height=height;
    this.r = radius;
    this.label=label; 
    this.event=event;
    this.widgetColor=widgetColor; 
    this.widgetFont=widgetFont;
    labelColor=color(255);
  }
  
  // draws the widget
  void draw() {
    fill(widgetColor);
    rect(x, y, width, height, r);
    fill(labelColor);
    textFont(widgetFont);
    textAlign(CENTER);
    text(label, x+(width/2), y+height-14);
  }
  
}
