//Minjuan Luo coded this part to get figure from Data class and put those data into pie chart
class Result {

  private int startDay = 1, startMonth = 1, endDay = 28, endMonth = 6;//set the start day, end day, start month and end month
  private String state = "";//a variable that included all the states name  



  void setState(String state) {
    this.state = state;
  }//setter

  int[] getResults(ArrayList<Data> sourceData) {//a getter that can get figure from Data class and create the object as source data

    int[] resultList = new int[sourceData.size()];//set an arraylist that the size is equal to the states number in Data class
    int count=1;
    for (int i=0; i<sourceData.size(); i++) {
      int month = sourceData.get(i).month;//get month from Data class
      int day = sourceData.get(i).day;//get day from Data class
      if (day >= startDay && month == startMonth || day <= endDay && month == endMonth) {//start day, end day detection
        if (state.equals("")) {//state detection
          resultList[count]= i;//object points to the correct data
          count++;
        }
      }
    }
    resultList[0] = count;//assign the value
    return resultList;//return the value to pie chart
  }
}
