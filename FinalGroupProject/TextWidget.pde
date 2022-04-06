// coded by Kajus

class TextWidget extends Widget {
  int maxlen;
  
  // constructor for the text widget
  TextWidget(int x, int y, int width, int height, int radius, String label, 
    color widgetColor, PFont font, int event, int maxlen) {
      super(x, y, width, height, radius, label,widgetColor, font, event);
      stroke(0);
      labelColor=color(0); this.maxlen=maxlen;
  }
  
  // gets the key entered and adds it to the string
  String append(char s){
    if (s==CODED){
      return label;
    }
    // if backspace then removes the last letter
    if(s==BACKSPACE){
      if(!label.equals(""))
        label=label.substring(0,label.length()-1);
    }
    // makes sure that the string hasn't surpassed the max length
    else if (label.length() < maxlen)
      label=label+str(s);
    return label;  
  }
  
}
