// MINJUAN and ZHONGYUAN worked together on the Lines class.
class Lines {
  int max_hight;
  ArrayList<Integer>x_axis;
  ArrayList<Integer>y_axis;
  ArrayList<String> lables;
  ArrayList<Integer> cases;
  int ID = 0;
    //Lines constructor
  Lines(int ID) {
    max_hight = 400;
    x_axis = new ArrayList<Integer>();
    y_axis = new ArrayList<Integer>();
    cases = new ArrayList<Integer>();
    lables = new ArrayList<String>();
    this.ID = ID;
  }
  void setAxis() {
    int startDay = 1;
    int endDay = 0;
    int total = 0;
    // three different type of line chart
if(ID == 1){
    for (int i = 15; i <= 1000; i+=15) {
      x_axis.add(i);
    }
}
if(ID == 2){
    for (int i = 15; i <= 1000; i+=35) {
      x_axis.add(i);
    }
}
if(ID == 3){
    for (int i = 15; i <= 1000; i+=70) {
      x_axis.add(i);
    }    
}    
//Distinguish the number of days in the month
    for (int month = 1; month <=12; month++) {
      startDay = 1;
      if (month == 4 || month == 6 || month == 9 || month == 11) {
        endDay = 30;
      }
      else if (month == 2) {
        endDay = 29;
      }
      else
      {
        endDay = 31;
      }
      // get the cases number and add them in total
      for (int day = startDay; day <= endDay; day++) {
        total = 0;
        for (Data dt : dataList) {
          if (dt.getMonth()==month && dt.getDay()==day) {
            total += dt.getCases();
          }
        }
        count++;
        cases.add(total);
        y_axis.add((total)/20000);        
        lables.add("1");
        lables.add("2");
        lables.add("3");
        lables.add("4");
        lables.add("5");
        lables.add("6");
        lables.add("7");
        lables.add("8");
        lables.add("9");
        lables.add("10");
        lables.add("11");
        lables.add("12");
      }
    }
  }

  void draw() {
    PFont xlable = loadFont("Arial-BoldItalicMT-16.vlw");
    PFont ylable = loadFont("Dialog.plain-16.vlw");
    textFont(xlable);
    fill(0);
    textSize(25);
    text("cases", 70, 70);
    text("months", 1000, 600);
if(ID == 1){
    text("The cases growth of 12 months in America", 600, 800);
}
if(ID == 2){
    text("The cases growth of 6 months in America", 600, 800);
}
if(ID == 3){
    text("The cases growth of 3 months in America", 600, 800);
}
// Draw the axis
if(ID == 1){    
    for (int i = 0; i<=7; i++) {
      line(105, 530-70*i, 110, 530-70*i);
    }    
    for (int i = 0; i<=7; i++) {
      textFont(ylable);
      line(175+65*i, 600, 175+65*i, 595);
      text(""+450000*i, 30, 600-i*70+10);
    }
    line(175+65*8, 600, 175+65*8, 595);
    line(175+65*9, 600, 175+65*9, 595);
    line(175+65*10, 600, 175+65*10, 595);
    line(175+65*11, 600, 175+65*11, 595);
}

if(ID == 2){    
    for (int i = 0; i<=4; i++) {
      line(105, 530-70*i, 110, 530-70*i);
    }    
    for (int i = 0; i<=5; i++) {
      textFont(ylable);
      line(175+145*i, 600, 175+145*i, 595);
      text(""+500000*i, 30, 600-i*70+10);
    }
}

if(ID == 3){    
    for (int i = 0; i<3; i++) {
      line(105, 530-70*i, 110, 530-70*i);
    }    
    for (int i = 0; i<=3; i++) {
      textFont(ylable);
      line(170+300*(i-1), 600, 170+300*(i-1), 595);
      text(""+400000*i, 30, 600-i*70+10);
    }
}
// lable the axis
if(ID == 1){
    for (int i = 0; i <12; i++) {     
        text(lables.get(i), x_axis.get(i)*17/4+112, 630);
    }
}
if(ID == 2){
    for (int i = 0; i <6; i++) {     
        text(lables.get(i), x_axis.get(i)*16.5/4+112, 630);
    }
}
if(ID == 3){
    for (int i = 0; i <3; i++) {     
        text(lables.get(i), x_axis.get(i)*17/4+110, 630);
    }
}
    line(105, 600, 105, 30);
    line(105, 600, 900, 600);
    // draw the line in the line chart
if(ID == 1){    
    for (int i = 0; i < 48; i++) {
      line(155 + x_axis.get(i), 1500-y_axis.get(i), 155 + x_axis.get(i+1), 1500-y_axis.get(i+1));
    }
    for (int i = 0; i < 49; i++) {
      circle(155 + x_axis.get(i), 1500-y_axis.get(i), 5);
    }
}
if(ID == 2){
    for (int i = 0; i < 21; i++) {
      line(155 + x_axis.get(i), 1500-y_axis.get(i), 155 + x_axis.get(i+1), 1500-y_axis.get(i+1));
    }
    for (int i = 0; i < 22; i++) {
      circle(155 + x_axis.get(i), 1500-y_axis.get(i), 5);
    }
}
if(ID == 3){
    for (int i = 0; i < 9; i++) {
      line(155 + x_axis.get(i), 1500-y_axis.get(i), 155 + x_axis.get(i+1), 1500-y_axis.get(i+1));
    }
    for (int i = 0; i < 10; i++) {
      circle(155 + x_axis.get(i), 1500-y_axis.get(i), 5);
    }
}
  }
}
