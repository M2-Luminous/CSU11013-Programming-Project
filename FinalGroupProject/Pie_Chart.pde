//Minjuan Luo coded this part to generate a pie chart which shows the proportion of different states in the USA during the coronavirus disease
class Pie_Chart {
  PFont lable = loadFont("ArialRoundedMTBold-8.vlw");
  float[] data;
  int sum = 0;
  Result results = new Result();//create an object
  ArrayList<String> states = new ArrayList<String>();//a new string arraylist

  Pie_Chart() {//default constructor
  }

  void draw(float diameter) {
    float Angle = 0;
    int j = 20;
    int k = 20;
    int l = 20;
    for (int i = 0; i < data.length; i++) {
      fill(j, k, l);
      j+=3;
      k+=6;
      l+=9;//generate different type of color for different states in the pie chart
      float percent = round(map(data[i], 0, 360, 0, 100)*100);
      percent /= 100;//get the percentage in order to show the data in texts
      arc(1200/2 + 150, 900/2, diameter, diameter, Angle, Angle+radians(data[i]));//generate 51 arc in order to mix them into a round shape(the form of the pie chart)
      fill(0);
      textFont(lable);
      text(states.get(i) + " " + percent + " %", 100, 70+15*i); 
      Angle += radians(data[i]);
    }
  }

  void getData(ArrayList<Data> sourceData) {//a getData constructor that is created in the Result class
    sum = 0;
    states.clear();

    int[] list = results.getResults(sourceData);
    int listLength = list[0];
    for (int i=1; i<listLength; i++) {
      list[i-1] = list[i];
    }
    listLength--;//get 51 states data one after another

    String[] stateList = new String[sourceData.size()];

    for (int i=0; i<sourceData.size(); i++)
      stateList[i] = sourceData.get(i).getState();//access states from Data class
    states.add(stateList[list[0]]);//add all the states string into the arraylist
    for (int i=1; i<listLength; i++) {
      int tmp = 0;
      for (int j=0; j<states.size(); j++) {
        if (states.get(j).equals(stateList[list[i]])) tmp++;//error detection(duplicate check)
      }
      if (tmp == 0) states.add(stateList[list[i]]);//add all the states string into the arraylist
    }

    data = new float[states.size()];     
    for (int i=0; i<data.length; i++)
      data[i]=0;//generate a data arraylist

    for (int i=0; i<states.size(); i++) {
      for (int j=0; j<listLength; j++) {
        if (states.get(i).equals(stateList[list[j]])) {
          data[i] += sourceData.get(list[j]).getCases();//get data from Data class
          sum += sourceData.get(list[j]).getCases();//get the total cases
        }
      }
    }
    for (int i=0; i<data.length; i++) {
      data[i] = map(data[i], 0, sum, 0, 360);//similar calculation
    }
  }
}
