import java.io.FileNotFoundException;
int count = 0;
int stateSizeMax = 211914;
int imageRatio = 300, xPos, yPos, currentCases, theAngle, divider, theDailyCases;
boolean wasClicked = false;
int totalHighestCase, totalAreaCases;
BufferedReader bufferedReader, bufferedReaderDaily;
String dataLine, dataLineDaily, query, result = "", userInput = "", screenOutput = "", areaInput, 
  stateInput, dateInputS, dateInputE, areaOutput, currentState, 
  theLabel = "This is the Top Ten Largest Case Amounts in the States of America over ", theLabelDaily = "This is the Top Ten Largest Average Daily Cases over The Course of ";
int customMonth;
double doubleCustomMonth;
Boolean isStateInList = false, isState = false, isArea = false, isDateS = false, isDateE = false;
ArrayList<Map> myMap;
ArrayList<Data> dataList = new ArrayList<Data>();
ArrayList<Data> dataListDaily = new ArrayList<Data>();
ArrayList <String> stateList = new ArrayList<String>();
ArrayList<Data> Datas = new ArrayList<Data>();
ArrayList<PImage> images;
String[] stateOrder3, stateOrder6, stateOrder12, stateOrderCustom;
String[] stateDaily3, stateDaily6, stateDaily12, stateDailyCustom, stateDailyRecent;
color[] colorList;
color currentColour;
int[] casesOrder3, casesOrder6, casesOrder12, casesOrderCustom, angles = new int[2];
int[] casesDaily3, casesDaily6, casesDaily12, casesDailyCustom, casesDailyRecent;
int screenNumber, cases, height, Max, Day, Month, Year, textWidgetNo = 0, lastAngle, allCases = 0;
PFont niceFont, stdFont, NewFont, newFont, myFont;
Graph graph1, graph2, graph3, graph4, graph5, graph6, graph7;
Functions myFunction;
Screen screen1, screen2, screen3, screen4, screen5, screen6;
Widget barChartButton, lineChartButton, homeButton, widget4, total3MonthsButton, 
  total6MonthsButton, total12MonthsButton, searchButton, widget9, line12MonthsButton, 
  line6MonthsButton, line3MonthsButton, USMapButton, widget14, pieChartButton, widget16, 
  daily3MonthsButton, daily6MonthsButton, daily12MonthsButton;
TextWidget focus, monthTextButton, stateTextButton, areaTextButton, startDateTextButton, endDateTextButton;
Lines line1;
Lines line2;
Lines line3;

Pie_Chart pie1;
PImage iAl, iTx, iCa, iMo, iNm, iAr, iNv, iCo, iWy, iOr, 
  iDo, iUt, iKa, iMn, iNe, iSd, iNd, iMi, iOk, iWa, iGe, 
  iMc, iIw, iIl, iWs, iFl, iAk, iAb, iNc, iNy, iMs, iPs, 
  iLs, iTn, iOh, iKe, iVg, iIn, iMa, iSc, iWv, iMy, iVe, 
  iNh, iMt, iNj, iHa, iCt, iDw, iRi;
PImage image1, image2, image3, image4, image5;

void setup() {
  // initializing variables
  query = "";
  background(255);
  size(1200, 900);
  niceFont = loadFont("CalifornianFB-Reg-16.vlw");
  stdFont = loadFont("CalifornianFB-Reg-16.vlw");
  NewFont = loadFont("Gadugi-Bold-16.vlw");
  newFont = loadFont("Gadugi-Bold-75.vlw");
  myFont = loadFont("Gadugi-Bold-34.vlw");
  image1 = loadImage("search.png");
  image1.resize(25, 25);
  image2 = loadImage("Covid-19.png");
  image2.resize(240, 80);
  image3 = loadImage("covid.png");
  image3.resize(500, 500);
  image4 = loadImage("cases.png");
  image4.resize(350, 220);
  image5 = loadImage("USA.png");
  image5.resize(0, 450);
  textFont(stdFont);
  textFont(NewFont);

  images = new ArrayList<PImage>();
  myMap = new ArrayList<Map>();

  loadStates();
  sizeImages();
  addStates(myMap);


  colorList = new color[55];

  addColors(colorList);

  stateOrder3 = new String[55];
  stateOrder6 = new String[55];
  stateOrder12 = new String[55];
  stateOrderCustom = new String[55];

  casesOrder3 = new int[55];
  casesOrder6 = new int[55];
  casesOrder12 = new int[55];
  casesOrderCustom = new int[55];

  stateDaily3 = new String[55];
  stateDaily6 = new String[55];
  stateDaily12 = new String[55];
  stateDailyCustom = new String[55];
  stateDailyRecent = new String[55];

  casesDaily3 = new int[55];
  casesDaily6 = new int[55];
  casesDaily12 = new int[55];
  casesDailyCustom = new int[55];
  casesDailyRecent = new int[55];

  graph1 = new Graph();
  graph2 = new Graph();
  graph3 = new Graph();
  graph5 = new Graph();
  graph6 = new Graph();
  graph7 = new Graph();

  line1 = new Lines(1);
  line2 = new Lines(2);
  line3 = new Lines(3);


  pie1 = new Pie_Chart();

  myFunction = new Functions();

  screen1 = new Screen(color (255));
  screen2 = new Screen(color (173, 216, 250));
  screen3 = new Screen(color (173, 216, 250));
  screen4 = new Screen(color (173, 216, 250));
  screen5 = new Screen(color (173, 216, 250));
  screen6 = new Screen(color  (173, 216, 250));


  // creating buttons for screens
  barChartButton = new Widget(256, 5, 120, 40, 10, 
    "BarChart", color(#333333), 
    NewFont, EVENT_BUTTON1);
  lineChartButton = new Widget(444, 5, 120, 40, 10, 
    "LineChart", color(#333333), 
    NewFont, EVENT_BUTTON2);
  homeButton = new Widget(115, 5, 60, 40, 10, 
    "Home", color(#333333), 
    NewFont, EVENT_BUTTON3); 
  total3MonthsButton = new Widget(50, 750, 120, 40, 10, 
    "3 months", color(#666666), 
    NewFont, EVENT_BUTTON5);  
  total6MonthsButton = new Widget(50, 800, 120, 40, 10, 
    "6 months", color(#666666), 
    NewFont, EVENT_BUTTON6);   
  total12MonthsButton = new Widget(50, 850, 120, 40, 10, 
    "12 months", color(#666666), 
    NewFont, EVENT_BUTTON7); 
  daily3MonthsButton = new Widget(750, 750, 120, 40, 10, 
    "3monthsDaily", color(#666666), 
    NewFont, EVENT_BUTTON_DAILY_3);  //new Widgets for daily cases
  daily6MonthsButton = new Widget(750, 800, 120, 40, 10, 
    "6monthsDaily", color(#666666), 
    NewFont, EVENT_BUTTON_DAILY_6);   
  daily12MonthsButton = new Widget(750, 850, 120, 40, 10, 
    "12monthsDaily", color(#666666), 
    NewFont, EVENT_BUTTON_DAILY_12);
  searchButton = new Widget(1025, 5, 60, 40, 10, 
    "Search", color(#333333), 
    NewFont, EVENT_BUTTON8);
  line12MonthsButton = new Widget(50, 850, 120, 40, 10, 
    "12 months", color(#666666), 
    NewFont, EVENT_BUTTON10);
  line6MonthsButton = new Widget(50, 800, 120, 40, 10, 
    "6 months", color(#666666), 
    NewFont, EVENT_BUTTON11);
  line3MonthsButton = new Widget(50, 750, 120, 40, 10, 
    "3 months", color(#666666), 
    NewFont, EVENT_BUTTON12);
  USMapButton = new Widget(820, 5, 120, 40, 10, 
    "USAmap", color(#333333), 
    NewFont, EVENT_BUTTON13);
  pieChartButton = new Widget(632, 5, 120, 40, 10, 
    "PieChart", color(#333333), 
    NewFont, EVENT_BUTTON15); 

  monthTextButton = new TextWidget(200, 850, 120, 40, 10, 
    "Month", color(255), 
    NewFont, EVENT_TEXTBUTTON1, 2);
  stateTextButton = new TextWidget(50, 550, 120, 40, 10, 
    "State", color(255), 
    NewFont, EVENT_TEXTBUTTON2, 15);
  areaTextButton = new TextWidget(50, 650, 120, 40, 10, 
    "Area", color(255), 
    NewFont, EVENT_TEXTBUTTON3, 15);
  startDateTextButton = new TextWidget(50, 750, 150, 40, 10, 
    "StartDate", color(255), 
    NewFont, EVENT_TEXTBUTTON4, 10); 
  endDateTextButton = new TextWidget(225, 750, 150, 40, 10, 
    "EndDate", color(255), 
    NewFont, EVENT_TEXTBUTTON5, 10); 

  screen1.addWidget(barChartButton);   
  screen2.addWidget(barChartButton);  
  screen3.addWidget(barChartButton);
  screen4.addWidget(barChartButton);
  screen5.addWidget(barChartButton);
  screen6.addWidget(barChartButton);
  screen1.addWidget(lineChartButton);
  screen2.addWidget(lineChartButton);
  screen3.addWidget(lineChartButton);
  screen4.addWidget(lineChartButton);
  screen5.addWidget(lineChartButton);
  screen6.addWidget(lineChartButton);
  screen1.addWidget(searchButton);
  screen2.addWidget(searchButton);
  screen2.addWidget(searchButton);
  screen3.addWidget(searchButton);
  screen4.addWidget(searchButton);
  screen5.addWidget(searchButton);
  screen6.addWidget(searchButton);
  screen1.addWidget(USMapButton);
  screen2.addWidget(USMapButton);
  screen3.addWidget(USMapButton);
  screen4.addWidget(USMapButton);
  screen5.addWidget(USMapButton);
  screen6.addWidget(USMapButton);
  screen2.addWidget(total3MonthsButton);
  screen2.addWidget(total6MonthsButton);
  screen2.addWidget(total12MonthsButton);
  screen2.addWidget(daily3MonthsButton);
  screen2.addWidget(daily6MonthsButton);
  screen2.addWidget(daily12MonthsButton);
  screen2.addWidget(monthTextButton);
  screen3.addWidget(homeButton);
  screen1.addWidget(homeButton);
  screen2.addWidget(homeButton);
  screen4.addWidget(homeButton);
  screen5.addWidget(homeButton);
  screen6.addWidget(homeButton);
  screen4.addWidget(stateTextButton);
  screen4.addWidget(areaTextButton);
  screen4.addWidget(startDateTextButton);
  screen4.addWidget(endDateTextButton);
  screen3.addWidget(line12MonthsButton);
  screen3.addWidget(line6MonthsButton);
  screen3.addWidget(line3MonthsButton);
  screen1.addWidget(pieChartButton);
  screen2.addWidget(pieChartButton);
  screen3.addWidget(pieChartButton);
  screen4.addWidget(pieChartButton);
  screen5.addWidget(pieChartButton);
  screen6.addWidget(pieChartButton);


  screenNumber = 1;
  readData();
  hardCodedArrays();
  line1.setAxis();
  line2.setAxis();
  line3.setAxis();


  graph1.createBars(casesOrder3, stateOrder3, 10000);

  graph2.createBars(casesOrder6, stateOrder6, 10000);

  graph3.createBars(casesOrder12, stateOrder12, 10000);

  graph5.createBars(casesDaily3, stateDaily3, 500);

  graph6.createBars(casesDaily6, stateDaily6, 500);

  graph7.createBars(casesDaily12, stateDaily12, 500);
}

void draw() {
  // Draws the current screen
  switch(screenNumber) {
  case 1:
    screen1.draw();
    // draw the screen homepage
    tint(255);
    noStroke();
    fill(#666666);
    rect(0, 50, 1200, 30);
    stroke(#333333);
    fill(255);
    textFont(NewFont);
    text("From The New York Times · Last updated: 1 day ago", 600, 70);
    fill(#666666);
    text("U.S. Coronavirus (COVID-19) Epidemic statistics data", 560, 300);
    fill(255);
    image(image2, 0, 80);
    fill(0);
    image(image3, 350, 350);
    image(image4, 820, 120);
    textFont(newFont);
    text("Coronavirus Disease", 400, 220);
    textFont(myFont);
    fill(#cccccc);
    text("United States", 650, 270);
    break;
  case 2: 
    screen2.draw();
    textSize(12);
    textFont(myFont);
    fill(0);
    text("Total Cases", 115, 725);
    text("Daily Cases", 815, 725);
    break;
  case 3:
    screen3.draw();
    break;
  case 4:
    screen4.draw();
    image(image5, 400, 450);
    break;
  case 5:
    screen5.draw();
    break;
  case 6:
    screen6.draw();
    pie1.getData(dataList);
    pie1.draw(500);
    break;
  default:
    screen1.draw();
  }

  // Draws the query
  switch(query) {
    //Queries for the bar charts, total highest case is used to vary the y axis values for 
    //different desired months and periods
  case "3months":
    graph1.draw();
    totalHighestCase = casesOrder3[54];
    text(theLabel+ "3 Months", 500, 600);
    break;
  case "6months":
    graph2.draw();
    totalHighestCase = casesOrder6[54];
    text(theLabel+ "6 Months", 500, 600);
    break;
  case "12months":
    graph3.draw();
    totalHighestCase = casesOrder12[54];
    text(theLabel+ "12 Months", 500, 600);
    break;
  case "custom":
    graph4.draw();
    totalHighestCase = casesOrderCustom[54];
    text(theLabel+ customMonth+" Months", 500, 600);
    break;
    //here bar charts are switched to the daily bar charts
  case "3monthsDaily":
    graph5.draw();
    totalHighestCase = casesDaily3[54];
    text(theLabelDaily+ "3 Months", 500, 600);
    break;
  case "6monthsDaily":
    graph6.draw();
    totalHighestCase = casesDaily6[54];
    text(theLabelDaily+ "6 Months", 500, 600);
    break;
  case "12monthsDaily":
    graph7.draw();
    totalHighestCase = casesDaily12[54];
    text(theLabelDaily+ "12 Months", 500, 600);
    break;
    //end of Shane's bar chart construction
  case "state":
    fill(0);
    textFont(myFont);
    textSize(16);
    fill(255);
    rect(380, 270, 450, 80, 10);
    fill(0);
    text(screenOutput, 600, 300);
    break;
  case "line1":
    line1.draw();
    break;
  case "line2":
    line2.draw();
    break;
  case "line3":
    line3.draw();
    break;
  case "map":
    for (Map state : myMap) {
      state.draw();
      line(0, 650, 200, 650);
      line(200, 650, 300, 750);
      line(300, 750, 300, 900);
      line(380, 900, 380, 800);
      line(380, 800, 530, 800);
      line(530, 800, 530, 900);
      if (wasClicked)//boolean allows text box and pie chart to be drawn once a state is 
        //clicked on the map, coded by Shane
      {
        pieChartMap(theAngle);
        fill(0);
        text("Proportion of Cases for " + currentState + " against all Cases in One Year", 830, 860);
        if (xPos > 900) { //make sure the entire text box is displayed
          xPos = xPos - 250;
          yPos = yPos - 30;
        }
        if (yPos > 875)//make sure the entire text box is displayed
        {
          yPos = yPos - 75;
          xPos = xPos - 100;
        }
        fill(255);
        rect(xPos + 20, yPos - 35, 260, 70, 10);
        fill(255, 0, 0);
        text("State: " + currentState + "\nTotal Cases: " + currentCases + 
          "\n Most Recent Case Amount: " + theDailyCases, xPos + 150, yPos - 15);
      }
    }
    break;
  }
}

// loads relevant values from the dataset into arrayLists coded by Kajus
public void hardCodedArrays() {
  myFunction.topCasesPerState(dataList, stateList, stateOrder3, stateOrder6, 
    stateOrder12, stateOrderCustom, casesOrder3, casesOrder6, casesOrder12, casesOrderCustom, false, 0);
  for (int i = 0; i < casesOrder12.length; i++)
  {
    allCases = allCases + casesOrder12[i];
  }
  myFunction.dailyPerState(dataListDaily, stateList, stateDaily3, stateDaily6, 
    stateDaily12, stateDailyCustom, stateDailyRecent, casesDaily3, casesDaily6, 
    casesDaily12, casesDailyCustom, casesDailyRecent, false, 0);
}

// reads in the files and sorts them into arrayLists 
// coded by Kajus
public void readData() {
  try {
    // Creating a bufferedReader to read in data
    bufferedReader = createReader("cases-1M.txt");
    bufferedReaderDaily = createReader("daily-1M.txt");
    boolean endOfFile = false;

    while (!endOfFile)
    {
      // Reads the next line in the data set
      dataLine = bufferedReader.readLine();
      dataLineDaily = bufferedReaderDaily.readLine();
      // Checks to see if the end of the data set is reached
      if (dataLine != null)
      {
        // Splitting the data line into an array
        String[] dataArray = dataLine.split(",");

        // Sorting the array of strings into variables
        String date = dataArray[DATE_INDEX];
        int day = parseInt(dataLine.substring(0, 2));
        int month = parseInt(dataLine.substring(3, 5));
        int year = parseInt(dataLine.substring(6, 10));
        String area = dataArray[AREA_INDEX];
        String state = dataArray[STATE_INDEX];
        String country = dataArray[COUNTRY_INDEX];
        int geoid = parseInt(dataArray[GEOID_INDEX]);
        int cases = parseInt(dataArray[CASES_INDEX]);

        // Creating an object of type data with the previous variables
        Data data = new Data(date, area, state, country, 
          geoid, cases, day, month, year);
        // Adding the object to the arrayList of objects
        dataList.add(data);

        // creates an array with all 50 states
        if (stateList.size() != 0 ) {
          for (String st : stateList) {
            if (st.equals(state)) {
              isStateInList = true;
            }
          }
          if (isStateInList == false)
            stateList.add(state);
          else
            isStateInList = false;
        } else
          if (!state.equals("county/state")) 
            stateList.add(state);
      }
      // adding in a new data set of daily cases
      if ( dataLineDaily != null) {
        String[] dataArrayDaily = dataLineDaily.split(",");

        String date = dataArrayDaily[DATE_INDEX];
        int day = parseInt(dataLineDaily.substring(0, 2));
        int month = parseInt(dataLineDaily.substring(3, 5));
        int year = parseInt(dataLineDaily.substring(6, 10));
        String area = dataArrayDaily[AREA_INDEX];
        String state = dataArrayDaily[STATE_INDEX];
        String country = dataArrayDaily[COUNTRY_INDEX];
        int geoid = parseInt(dataArrayDaily[GEOID_INDEX]);
        int cases = parseInt(dataArrayDaily[CASES_INDEX]);

        Data dailyData = new Data(date, area, state, country, 
          geoid, cases, day, month, year);
        dataListDaily.add(dailyData);
      } 
      if (dataLine == null && dataLineDaily == null) {
        endOfFile = true;
      }
    }
    bufferedReader.close();
    bufferedReaderDaily.close();
  }
  catch (FileNotFoundException e)
  {
    e.printStackTrace();
  }
  catch (IOException e)
  {
    e.printStackTrace();
  }
}



void  mousePressed() {
  int event = EVENT_NULL;
  // Checks which screen is currently displayed
  // from that it checks which widget is being pressed
  if (screenNumber == 1) {
    event = screen1.getEvent(mouseX, mouseY);
  } else if (screenNumber == 2) {
    for (int i = 0; i < screen2.widgetList.size(); i++) {
      Widget theWidget = (Widget)screen2.widgetList.get(i);
      event = screen2.getEvent(mouseX, mouseY, theWidget);
      if (event == EVENT_BUTTON_DAILY_3 || event == EVENT_BUTTON_DAILY_6 ||event == EVENT_BUTTON_DAILY_12)
      {
        divider = 100;
      } else 
      {
        divider = 10000;
      }
      switch (event) {
      case EVENT_BUTTON2:
        screenNumber = 3;
        query = "";
        focus = null;
        return;
      case EVENT_BUTTON4:
        screenNumber = 1;
        query = "";
        focus=null;
        return;
      case EVENT_BUTTON3:
        screenNumber = 1;
        focus=null;
        query = "";
        break;
      case EVENT_BUTTON8:
        screenNumber = 4;
        query = "";
        focus=null;
        return;
      case EVENT_BUTTON13:
        screenNumber = 5;
        query = "map";
        focus=null;
        return;
      case EVENT_BUTTON15:
        screenNumber = 6;
        query = "";
        focus=null;
        return;
      case EVENT_BUTTON5:
        query = "3months";
        focus=null;
        return;  
      case EVENT_BUTTON6:  
        query = "6months";
        focus=null;
        return;
      case EVENT_BUTTON7:
        query = "12months";
        focus=null;
        return;
      case EVENT_BUTTON_DAILY_3:
        query = "3monthsDaily";
        focus=null;
        return;
      case EVENT_BUTTON_DAILY_6:
        query = "6monthsDaily";
        focus=null;
        return;
      case EVENT_BUTTON_DAILY_12:
        query = "12monthsDaily";
        focus=null;
        return;
      case EVENT_TEXTBUTTON1:
        focus=(TextWidget)theWidget;
        return;
      default:
        focus=null;
      }
    }
  } else if (screenNumber == 3) {
    event = screen3.getEvent(mouseX, mouseY);
  } else if (screenNumber == 4) {
    for (int i = 0; i < screen4.widgetList.size(); i++) {
      Widget theWidget = (Widget)screen4.widgetList.get(i);
      event = screen4.getEvent(mouseX, mouseY, theWidget);
      switch (event) {
      case EVENT_BUTTON1:
        screenNumber = 2;
        query = "";
        focus=null; 
      case EVENT_BUTTON2:
        screenNumber = 3;
        query = "";
        focus=null;
        return;
      case EVENT_BUTTON3:
        screenNumber = 1;
        focus=null;
        query = "";
        break;
      case EVENT_BUTTON13:
        screenNumber = 5;
        query = "map";
        focus=null;
        return;
      case EVENT_BUTTON15:
        screenNumber = 6;
        query = "";
        focus=null;
        return;
      case EVENT_BUTTON9:
        screenNumber = 1;
        query = "";
        focus=null;
        return;
      case EVENT_TEXTBUTTON2:
        focus=(TextWidget)theWidget;
        return;
      case EVENT_TEXTBUTTON3:
        focus=(TextWidget)theWidget;
        return;
      case EVENT_TEXTBUTTON4:
        focus=(TextWidget)theWidget;
        return;
      case EVENT_TEXTBUTTON5:
        focus=(TextWidget)theWidget;
        return;
      default:
        focus=null;
      }
    }
  } else if (screenNumber == 5) {
    //Here is where you get the information from clicking on a state on the map
    //Coded by Shane
    event = screen5.getEvent(mouseX, mouseY);
    if (event == 0) {
      color c = get(mouseX, mouseY);
      for (int i = 0; i < stateList.size(); i++) {
        if (colorList[i] == c) {
          xPos = mouseX;
          yPos = mouseY;// where the text box goes
          currentState = stateList.get(i);
          for (int j = 0; j < 55; j++) {
            String stateFromList = stateOrder12[j];
            if (currentState.contains(stateFromList)) {
              currentCases = casesOrder12[j];
              break;
            } //getting the cases for each individual state
          }
          for (int j = 0; j < 55; j++) {
            String stateInLoop = stateDailyRecent[j];
            if (currentState.contains(stateInLoop)) {
              theDailyCases = casesDailyRecent[j];
              break;
            } //getting the cases for each individual state
          }
          theAngle = (int)(((360)*(currentCases))/allCases);//calculating angle for pie chart
          wasClicked = true; //boolean to detect if state was clicked
        } else if (c == color (173, 216, 250)) //checking if mouse presses the background to remove text box
        {
          wasClicked = false;
        }
      }
    }
  } else if (screenNumber == 6) {
    event = screen6.getEvent(mouseX, mouseY);
  }
  switch (event) {
  case EVENT_BUTTON1:
    screenNumber = 2;
    focus=null;
    query = "";
    break;
  case EVENT_BUTTON2:
    screenNumber = 3;
    query = "";
    focus=null;
    break;
  case EVENT_BUTTON3:
    screenNumber = 1;
    focus=null;
    query = "";
    break;
  case EVENT_BUTTON8:
    screenNumber = 4;
    focus = null;
    query = "";
    break;
  case EVENT_BUTTON10:
    focus = null;
    query = "line1";
    break;
  case EVENT_BUTTON11:
    focus = null;
    query = "line2";
    break;
  case EVENT_BUTTON12:
    focus = null;
    query = "line3";
    break;
  case EVENT_BUTTON13:
    screenNumber = 5;
    focus = null;
    query = "map";
    break;
  case EVENT_BUTTON14:
    screenNumber = 1;
    focus = null;
    query = "";
    break;
  case EVENT_BUTTON15:
    screenNumber = 6;
    focus = null;
    query = "";
    break;
  case EVENT_BUTTON16:
    screenNumber = 1;
    focus = null;
    query = "";
    break;
  default:
    focus=null;
  }
}

void keyPressed() {
  if (focus != null) {
    if (key == ENTER) {
      userInput = focus.append(key);
      // checks which textbox is currently being used
      if (focus == monthTextButton) {
        isState = false;
        isArea = false;
        isDateS = false;
        isDateE = false;
        doubleCustomMonth = myFunction.stringToInt(userInput);
        customMonth = (int)doubleCustomMonth;
        if (customMonth != -1) {
          if (customMonth <= 2)
          {
            divider = 2000;
          }
          if (customMonth >= 3)
          {
            divider = 10000;
          }
          query = "custom";
          // fills the array with the relevant data
          myFunction.topCasesPerState(dataList, stateList, stateOrder3, stateOrder6, 
            stateOrder12, stateOrderCustom, casesOrder3, casesOrder6, casesOrder12, 
            casesOrderCustom, true, customMonth);
          graph4 = new Graph();
          graph4.createBars(casesOrderCustom, stateOrderCustom, divider);
        }
      } else if (focus == stateTextButton) {
        // Capitalizes the first letter of the state 
        userInput = userInput.substring(0, 1).toUpperCase() + userInput.substring(1);
        char[] charArr = userInput.toCharArray();
        for (int i = 0; i < userInput.length(); i++) {
          if (charArr[i] == ' ') {
            charArr[i + 1] = Character.toUpperCase(charArr[i+1]);
          }
        }
        stateInput = String.valueOf(charArr);
        // checks to see if the state is valid
        for (int i = 0; i < 55; i++) {
          String stateFromList = stateOrder12[i];
          if (stateInput.contains(stateFromList)) {
            isState = true;
            break;
          } else {
            isState = false;
          }
        }
      } else if (focus == areaTextButton) {
        // capitalizes the first letter of the area
        userInput = userInput.substring(0, 1).toUpperCase() + userInput.substring(1);
        char[] charArr = userInput.toCharArray();
        for (int i = 0; i < userInput.length(); i++) {
          if (charArr[i] == ' ') {
            charArr[i + 1] = Character.toUpperCase(charArr[i+1]);
          }
        }
        areaInput = String.valueOf(charArr);
        // checks if the area is valid
        for (Data data : dataList)
        {
          if (areaInput.contains(data.getArea())) 
          {
            isArea = true;
            break;
          } else {
            isArea = false;
          }
        }
        // retrieves the date that the user has set
      } else if (focus == startDateTextButton) {
        dateInputS = userInput;
        isDateS = true;
      } else if (focus == endDateTextButton) {
        dateInputE = userInput;
        isDateE = true;
      }
      // if the user has entered something in every necessary text box
      if (isState && isDateS && isDateE) {
        // retrieves the data
        int cases = myFunction.dateRangeTotalCases(dataList, stateInput, areaInput, 
          dateInputS, dateInputE, isArea);
        if (cases >= 0) {
          // creating the output string
          screenOutput = "The Total cases for " + stateInput + ((isArea) ? " " + areaInput : "" ) +
            " between the dates " + dateInputS + "-" + dateInputE + " is " + cases;
        }
        query = "state";
      }
    } else
      focus.append(key);
  }
}

//Shane Coded a seperate smaller method to make a pie chart for the map that doesnt relate 
//to the larger pie chart
void pieChartMap(int angle) {
  stroke(0);
  fill(29, 67, 165);//colour for proportion of state
  circle(725, 750, 150);
  angles[0] = angle;
  angles[1] = 360 - angle;
  lastAngle = 0;
  currentColour = color(43, 200, 255);
  stroke(0);
  fill(currentColour); //colour for total proportion against
  arc(725, 750, 150, 150, 0, 0+radians(angles[0]));
  stroke(0);
  fill(currentColour);
  arc(725, 750, 150, 150, 0, radians(angles[1]));
}
