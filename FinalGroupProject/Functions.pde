// Kajus coded the functions class

class Functions {

  // Will return the states and the amount of cases each state has within the given time period
  // The arrays are sorted from high to low
  public void topCasesPerState(ArrayList<Data> dataList, 
    ArrayList<String> stateList, String[] stateOrder3, 
    String[] stateOrder6, String[] stateOrder12, 
    String[] stateOrderX, int[] casesOrder3, 
    int[] casesOrder6, int[] casesOrder12, int[] casesOrderX, 
    boolean custom, int userMonths) {
    String startDate = "15/03/2021";
    // Creating the start and end dates
    int endYearX = 2021;
    int endMonthX = 0;
    int endMonth3 = 12;
    int endMonth6 = 9;
    int endMonth12 = 3;
    int endDay = 15;
    int endYear = 2020;
    int  i = 0;
    if (custom) {
      if (userMonths >= 3) {
        endYearX = 2020;  
        endMonthX = 12 - (userMonths - 3);
      } else {
        endMonthX = 3 - userMonths;
      }
    }
    // Adds up all the cases for each state 
    for (String state : stateList) {
      int startCases = 0;
      int endCases3 = 0;
      int endCases6 = 0;
      int endCases12 = 0;
      int endCasesX = 0;
      int totalCases = 0;
      for (Data data : dataList) {
        // Compares the state day/month/year with different parameters
        // to get the required cases

        // gets the total cases for the beginning date
        if (state.equals(data.getState()) && startDate.equals(data.getDate())) {
          startCases += data.getCases();
        }
        if (!custom) {
          // hardcoded values

          // gets the total cases for 3 months
          if (state.equals(data.getState()) && endDay == data.getDay() 
            && endMonth3 == data.getMonth() && endYear == data.getYear()) {
            endCases3 += data.getCases();
          }
          // gets the total cases for 6 months
          if (state.equals(data.getState()) && endDay == data.getDay()
            && endMonth6 == data.getMonth() && endYear == data.getYear()) {
            endCases6 += data.getCases();
          }
          // gets the total cases for 12 months
          if (state.equals(data.getState()) && endDay == data.getDay()
            && endMonth12 == data.getMonth() && endYear == data.getYear()) {
            endCases12 += data.getCases();
          }
        } else {
          // gets the total cases for custom months
          if (state.equals(data.getState()) && endDay == data.getDay() 
            && endMonthX == data.getMonth() && endYearX == data.getYear()) {
            endCasesX += data.getCases();
          }
        }
      }
      if (!custom) {
        // calculates the total cases -> total cases = start cases - end cases
        totalCases = startCases - endCases3;
        casesOrder3[i] = totalCases;
        stateOrder3[i] = state;
        totalCases = startCases - endCases6;
        casesOrder6[i] = totalCases;
        stateOrder6[i] = state;
        totalCases = startCases - endCases12;
        casesOrder12[i] = totalCases;
        stateOrder12[i] = state;
      } else {
        totalCases = startCases - endCasesX;
        casesOrderX[i] = totalCases;
        stateOrderX[i] = state;
      }
      i++;
    } 
    if (!custom) {
      // Sorts both arrays from low to high (cases)
      sortWithStates(casesOrder3, stateOrder3);
      sortWithStates(casesOrder6, stateOrder6);
      sortWithStates(casesOrder12, stateOrder12);
    } else {
      sortWithStates(casesOrderX, stateOrderX);
    }
  }

  // Will return the states and the highest daily cases for each of them
  // within a time period. Both arrays are sorted from low to high.

  public void dailyPerState(ArrayList<Data> dataListDaily, 
    ArrayList<String> stateList, String[] stateDaily3, 
    String[] stateDaily6, String[] stateDaily12, 
    String[] stateDailyX, String[] stateDailyRecent, int[] casesDaily3, 
    int[] casesDaily6, int[] casesDaily12, int[] casesDailyX, 
    int[] casesDailyRecent, boolean custom, int userMonths) {
    // Creating the start and end dates
    String startDate = "15/03/2021";
    int endYearX = 2021;
    int endMonthX = 0;
    int endMonth3 = 12;
    int endMonth6 = 9;
    int endMonth12 = 3;
    int  i = 0;
    if (custom) {
      if (userMonths >= 3) {
        endYearX = 2020;  
        endMonthX = 12 - (userMonths - 3);
      } else {
        endMonthX = 3 - userMonths;
      }
    }
    // Going through each state and getting their daily cases
    for (String state : stateList) {
      int total3 = 0;
      int total6 = 0;
      int total12 = 0;
      int totalDaily = 0;
      int totalX = 0;
      int topCase3 = 0;
      int topCase6 = 0;
      int topCase12 = 0;
      int topCaseDaily = 0;
      int topCaseX = 0;
      int day3 = -1; // previous day
      int day6 = -1; // previous day
      int day12 = -1; // previous day
      int dayX = -1; // previous day
      // Going through the data and comparing them with many statements
      for (Data data : dataListDaily) {
        // current day
        int day = data.getDay();
        // Only called once from setup (not custom)
        if (!custom) {
          // gets the top daily cases for 3 months
          if (state.equals(data.getState()) && ((2021 == data.getYear()) || 
            (2020 == data.getYear() && (data.getMonth() >= endMonth3)))) {
            if (day3 != day) {
              day3 = day;
              if (topCase3 > total3) {
                total3 = topCase3;
              }
              topCase3 = 0;
            }
            int cases = data.getCases();
            topCase3 += cases;
          }
          // gets the top daily cases for 6 months
          if (state.equals(data.getState()) && ((2021 == data.getYear()) || 
            (2020 == data.getYear() && (data.getMonth() >= endMonth6)))) {
            if (day6 != day) {
              day6 = day;
              if (topCase6 > total6) {
                total6 = topCase6;
              }
              topCase6 = 0;
            }
            int cases = data.getCases();
            topCase6 += cases;
          }
          // gets the top daily cases for 12 months
          if (state.equals(data.getState()) && ((2021 == data.getYear()) || 
            (2020 == data.getYear() && (data.getMonth() >= endMonth12)))) {
            if (day12 != day) {
              day12 = day;
              if (topCase12 > total12) {
                total12 = topCase12;
              }
              topCase12 = 0;
            }
            int cases = data.getCases();
            topCase12 += cases;
          }
          // gets the top daily cases for the most recent day
          if (state.equals(data.getState()) && startDate.equals(data.getDate())) {
            if (topCaseDaily > totalDaily) {
              totalDaily = topCaseDaily;
            }
            int cases = data.getCases();
            topCaseDaily += cases;
          }
          // Custom arrays that are called multiple times
          // gets the top daily cases for a custom amount of months
        } else if (endYearX == 2021) {
          if (state.equals(data.getState()) && (data.getYear() == endYearX) && (data.getMonth() >= endMonthX)) {
            if (dayX != day) {
              dayX = day;
              if (topCaseX > totalX) {
                totalX = topCaseX;
              }
              topCaseX = 0;
            }
            int cases = data.getCases();
            topCaseX += cases;
          }
        } else if (endYearX == 2020) {
          if (state.equals(data.getState()) && ((2021 == data.getYear()) || 
            (2020 == data.getYear() && (data.getMonth() >= endMonthX)))) {
            if (dayX != day) {
              dayX = day;
              if (topCaseX > totalX) {
                totalX = topCaseX;
              }
              topCaseX = 0;
            }
            int cases = data.getCases();
            topCaseX += cases;
          }
        }
      }
      // adding the cases to the arrays 
      if (!custom) {
        casesDaily3[i] = total3;
        stateDaily3[i] = state;
        casesDaily6[i] = total6;
        stateDaily6[i] = state;
        casesDaily12[i] = total12;
        stateDaily12[i] = state;
        casesDailyRecent[i] = totalDaily;
        stateDailyRecent[i] = state;
      } else {
        casesDailyX[i] = totalX;
        stateDailyX[i] = state;
      }
      i++;
    } 
    if (!custom) {
      // Sorts both arrays from low to high (cases)
      sortWithStates(casesDaily3, stateDaily3);
      sortWithStates(casesDaily6, stateDaily6);
      sortWithStates(casesDaily12, stateDaily12);
      sortWithStates(casesDailyRecent, stateDailyRecent);
    } else {
      sortWithStates(casesDailyX, stateDailyX);
    }
  }

  // calculates the total cases for a certain date range (user input)
  public int dateRangeTotalCases(ArrayList<Data> dataList, 
    String state, String area, 
    String startDate, String endDate, boolean isArea) {
    int totalCasesStart = 0;
    int totalCasesEnd = 0;
    for (Data data : dataList) {
      // if area is being used (not compulsary)
      if (!isArea) {
        // gets the total cases on the first day
        if (state.contains(data.getState()) && startDate.contains(data.getDate())) {
          totalCasesStart += data.getCases();
        }
        // gets the total cases on the last day
        if (state.contains(data.getState()) && endDate.contains(data.getDate())) {
          totalCasesEnd += data.getCases();
        }
      } else if (isArea) {
        // gets the total cases on the first day
        if (state.contains(data.getState()) && area.contains(data.getArea()) && startDate.contains(data.getDate())) {
          totalCasesStart += data.getCases();
        }
        // gets the total cases on the last day        
        if (state.contains(data.getState()) && area.contains(data.getArea()) && endDate.contains(data.getDate())) {
          totalCasesEnd += data.getCases();
        }
      }
    }
    // returns the total cases
    return totalCasesEnd - totalCasesStart;
  }


  // sorts the states and their cases in order from low to high
  public void sortWithStates(int[] cases, String[] states) {
    for (int i = 0; i < cases.length; i++) {
      for (int j = i + 1; j < cases.length; j++) {
        int tmp = 0;
        String temp = "";
        if (cases[i] > cases[j]) {
          tmp = cases[i];
          cases[i] = cases[j];
          cases[j] = tmp;

          temp = states[i];
          states[i] = states[j];
          states[j] = temp;
        }
      }
    }
  }

  // checks to see if the user entered a valid month 
  public boolean isValid(String input) {
    double number;
    if (input.length() > 2)
      return false;
    try {
      number = Double.parseDouble(input);
    }  
    catch (NumberFormatException e) {
      return false;
    }
    if (number < 1 || number > 14)
      return false;
    return true;
  }

  // takes in a string (user entered)
  // returns whether or not the user entered month is valid as a double
  public double stringToInt(String input) {
    if (isValid(input))
      return Double.parseDouble(input);
    return -1;
  }

  public String toStringScreen(String[] stateOrder12, int[] casesOrder12, int index) {
    return "The total cases for " + stateOrder12[index] + " is: " + casesOrder12[index];
  }
}

// adds the color of every state into an array
public void addColors(color[] colorList) {
  colorList[0] = color(254, 181, 192); // Wash
  colorList[1] = color(254, 181, 194); // Illin
  colorList[2] = color(254, 191, 76); // Cali
  colorList[3] = color(191, 147, 70); // Ari
  colorList[4] = color(254, 254, 130); // Massa
  colorList[5] = color(152, 203, 152); // Wisc
  colorList[6] = color(254, 191, 80); // Texas
  colorList[7] = color(254, 191, 78); // Nebr
  colorList[8] = color(215, 177, 215); //Utah
  colorList[9] = color(81, 154, 81); // Oregon
  colorList[10] = color(81, 154, 89); // Flor
  colorList[11] = color(254, 212, 197); // NY
  colorList[12] = color(254, 102, 110); // Rhode Is
  colorList[13] = color(254, 181, 189); // New Hamp 
  colorList[14] = color(254, 181, 195); // Georgia
  colorList[15] = color(254, 212, 199); // North Car
  colorList[16] = color(254, 102, 108); // New Jersey
  colorList[17] = color(198, 153, 78); // MaryLand
  colorList[18] = color(254, 102, 102); // Nevada
  colorList[19] = color(215, 177, 221); // Tenness
  colorList[20] = color(254, 212, 193); // Colorado
  colorList[21] = color(254, 102, 100); // Hawaii
  colorList[22] = color(254, 191, 82); // Indiana
  colorList[23] = color(152, 203, 156); // Kentucky
  colorList[24] = color(254, 212, 191); // Minnes
  colorList[25] = color(81, 154, 91); // Pennsy
  colorList[26] = color(198, 153, 74); // Okla
  colorList[27] = color(254, 254, 128); // South Carol
  colorList[28] = color(17, 17, 17); // District Of Columbia 
  colorList[29] = color(254, 254, 129); // Missouri
  colorList[30] = color(254, 191, 84); // Virginia
  colorList[31] = color(81, 154, 93); // Vermont
  colorList[32] = color(254, 102, 104); // Kansas
  colorList[33] = color(215, 177, 223); // Connect
  colorList[34] = color(215, 177, 217); // Iowa
  colorList[35] = color(215, 177, 219); // Loiuis
  colorList[36] = color(254, 102, 106); // Ohio
  colorList[37] = color(198, 153, 76); // Michigan
  colorList[38] = color(81, 154, 83); // South Dak
  colorList[39] = color(254, 212, 195); // Mississ
  colorList[40] = color(254, 181, 193); // North Dak
  colorList[41] = color(152, 203, 154); // Wyoming
  colorList[42] = color(81, 154, 87); // Arkinsas
  colorList[43] = color(81, 154, 85); // New Mex
  colorList[44] = color(18, 18, 18); // Delaware
  colorList[45] = color(254, 191, 88); // Maine
  colorList[46] = color(254, 254, 125); // Alaska
  colorList[47] = color(254, 254, 127); // Idaho
  colorList[48] = color(198, 153, 70); // Montana
  colorList[49] = color(253, 190, 86); // Alabama
  colorList[50] = color(19, 19, 19); // Peurto Rico
  colorList[51] = color(20, 20, 20); // Virgin Is
  colorList[52] = color(21, 21, 21); // Guam
  colorList[53] = color(254, 181, 186); // West Virg
  colorList[54] = color(22, 22, 22); // North Marian Is
}

// adds every state into an array 
public void addStates(ArrayList<Map> myMap) {
  int constantX = 35;
  int constantY = 50;
  myMap.add(new Map(constantX, constantY, iWa, color(255, 182, 193)));
  myMap.add(new Map(194-constantX, 491-constantY, iAr, color(199, 154, 72)));
  myMap.add(new Map(161-constantX, 143-constantY, iDo, color(255, 255, 127)));
  myMap.add(new Map(192-constantX, 55-constantY, iMo, color(199, 154, 70)));
  myMap.add(new Map(400-constantX, 103-constantY, iNd, color(255, 182, 194))); 
  myMap.add(new Map(533-constantX, 140-constantY, iMn, color(255, 213, 192)));
  myMap.add(new Map(614-constantX, 200-constantY, iWs, color(153, 204, 153)));
  myMap.add(new Map(671-constantX, 199-constantY, iMc, color(199, 154, 76)));
  myMap.add(new Map(48-constantX, 216-constantY, iOr, color(81, 155, 81)));
  myMap.add(new Map(545-constantX, 263-constantY, iIw, color(216, 178, 218)));
  myMap.add(new Map(630-constantX, 320-constantY, iIl, color(255, 182, 195)));
  myMap.add(new Map(706-constantX, 336-constantY, iIn, color(255, 192, 82)));
  myMap.add(new Map(785-constantX, 305-constantY, iOh, color(255, 102, 106)));
  myMap.add(new Map(885-constantX, 240-constantY, iPs, color(81, 155, 91)));
  myMap.add(new Map(845-constantX, 320-constantY, iWv, color(255, 182, 187)));
  myMap.add(new Map(924-constantX, 318-constantY, iMy, color(199, 154, 78)));
  myMap.add(new Map(988-constantX, 305-constantY, iNj, color(255, 102, 108)));
  myMap.add(new Map(893-constantX, 141-constantY, iNy, color(255, 213, 198)));
  myMap.add(new Map(1040-constantX, 273-constantY, iCt, color(216, 178, 224)));
  myMap.add(new Map(1080-constantX, 283-constantY, iRi, color(255, 102, 110)));
  myMap.add(new Map(1038-constantX, 215-constantY, iMt, color(255, 255, 131)));
  myMap.add(new Map(1022-constantX, 190-constantY, iVe, color(81, 155, 93)));
  myMap.add(new Map(1034-constantX, 168-constantY, iNh, color(255, 182, 190)));
  myMap.add(new Map(1063-constantX, 80-constantY, iMa, color(255, 192, 88)));
  myMap.add(new Map(273-constantX, 221-constantY, iWy, color(153, 204, 155)));
  myMap.add(new Map(400-constantX, 184-constantY, iSd, color(81, 155, 83)));
  myMap.add(new Map(396-constantX, 227-constantY, iNe, color(255, 192, 78)));
  myMap.add(new Map(301-constantX, 311-constantY, iCo, color(255, 213, 194)));
  myMap.add(new Map(440-constantX, 325-constantY, iKa, color(255, 102, 104)));
  myMap.add(new Map(322-constantX, 380-constantY, iTx, color(255, 192, 80))); 
  myMap.add(new Map(290-constantX, 445-constantY, iNm, color(81, 155, 85)));
  myMap.add(new Map(214-constantX, 336-constantY, iUt, color(216, 178, 216)));
  myMap.add(new Map(655-constantX, 340-constantY, iTn, color(216, 178, 222)));
  myMap.add(new Map(828-constantX, 285-constantY, iVg, color(255, 192, 84)));
  myMap.add(new Map(708-constantX, 307-constantY, iKe, color(153, 204, 157)));
  myMap.add(new Map(565-constantX, 340-constantY, iMi, color(255, 255, 130)));//
  myMap.add(new Map(410-constantX, 372-constantY, iOk, color(199, 154, 74)));
  myMap.add(new Map(817-constantX, 362-constantY, iNc, color(255, 213, 200)));
  myMap.add(new Map(832-constantX, 470-constantY, iSc, color(255, 255, 129)));//
  myMap.add(new Map(792-constantX, 512-constantY, iGe, color(255, 182, 196)));
  myMap.add(new Map(599-constantX, 465-constantY, iAk, color(81, 155, 87)));
  myMap.add(new Map(638-constantX, 520-constantY, iMs, color(255, 213, 196)));
  myMap.add(new Map(696-constantX, 551-constantY, iAb, color(255, 192, 86)));
  myMap.add(new Map(748-constantX, 575-constantY, iFl, color(81, 155, 89)));
  myMap.add(new Map(614-constantX, 546-constantY, iLs, color(216, 178, 220)));
  myMap.add(new Map(90-constantX, 322-constantY, iNv, color(255, 102, 102)));
  myMap.add(new Map(14-constantX, 295-constantY, iCa, color(255, 192, 76)));
  myMap.add(new Map(50-constantX, 600-constantY, iAl, color(255, 255, 125)));
  myMap.add(new Map(420-constantX, 800-constantY, iHa, color(255, 102, 100)));
}
// resizes every image (state)
public void sizeImages() {
  for (int i = 0; i < images.size(); i++) {
    float floatSize = (float)((float)stateSizes[i] / stateSizeMax) * (imageRatio);
    int newSize = (int)(floatSize);
    images.get(i).resize(0, newSize);
  }
}
// loading in each state
public void loadStates() {
  images.add(iAl=loadImage("alaska.png"));
  images.add(iTx=loadImage("texas.png"));
  images.add(iCa=loadImage("california.png"));
  images.add(iMo=loadImage("montanaR.png"));
  images.add(iNm=loadImage("new_mexico.png"));
  images.add(iAr=loadImage("arizona.png"));
  images.add(iNv=loadImage("nevada.png"));
  images.add(iCo=loadImage("colorado.png"));
  images.add(iWy=loadImage("wyoming.png"));
  images.add(iOr=loadImage("oregonR.png"));
  images.add(iDo=loadImage("idahoR.png"));
  images.add(iUt=loadImage("utah.png"));
  images.add(iKa=loadImage("kansas.png"));
  images.add(iMn=loadImage("minnesotaR.png"));
  images.add(iNe=loadImage("nebraska.png"));
  images.add(iSd=loadImage("south_dakota.png"));
  images.add(iNd=loadImage("north_dakota.png"));
  images.add(iMi=loadImage("missouri.png"));
  images.add(iOk=loadImage("oklahoma.png"));
  images.add(iWa=loadImage("washingtonR.png"));
  images.add(iGe=loadImage("georgiaR.png"));
  images.add(iMc=loadImage("michiganR.png"));
  images.add(iIw=loadImage("iowaR.png"));
  images.add(iIl=loadImage("illinoisR.png"));
  images.add(iWs=loadImage("wisconsinR.png"));
  images.add(iFl=loadImage("florida.png"));
  images.add(iAk=loadImage("arkansas.png"));
  images.add(iAb=loadImage("alabamaR.png"));
  images.add(iNc=loadImage("north_carolina.png"));
  images.add(iNy=loadImage("new_yorkR.png"));
  images.add(iMs=loadImage("mississippiR.png"));
  images.add(iPs=loadImage("pennsylvaniaR.png"));
  images.add(iLs=loadImage("louisiana.png"));
  images.add(iTn=loadImage("tennesseeR.png"));
  images.add(iOh=loadImage("ohioR.png"));
  images.add(iKe=loadImage("kentuckyR.png"));
  images.add(iVg=loadImage("virginiaR.png"));
  images.add(iIn=loadImage("indianaR.png"));
  images.add(iMa=loadImage("maineR.png"));
  images.add(iSc=loadImage("south_carolinaR.png"));
  images.add(iWv=loadImage("west_virginiaR.png"));
  images.add(iMy=loadImage("marylandR.png"));
  images.add(iVe=loadImage("vermontR.png"));
  images.add(iNh=loadImage("new_hampshireR.png"));
  images.add(iMt=loadImage("massachusettsR.png"));
  images.add(iNj=loadImage("new_jerseyR.png"));
  images.add(iHa=loadImage("hawaii.png"));
  images.add(iCt=loadImage("connecticutR.png"));
  images.add(iDw=loadImage("delaware.png"));
  images.add(iRi=loadImage("rhode_islandR.png"));
}
