// Kajus coded this class that allows us to get specific parts of the data
class Data {
  // creating variables
  private String date;
  private String area;
  private String state;
  private String country;
  private int geoid;
  private int cases;
  private int day;
  private int month;
  private int year;

  public Data() {
  }
  // constructor
  public Data(String new_date, String new_area, 
    String new_state, String new_country, 
    int new_geoid, int new_cases, int new_day, 
    int new_month, int new_year) {
    date = new_date;
    area = new_area;
    state = new_state;
    country = new_country;
    geoid = new_geoid;
    cases = new_cases;
    day = new_day;
    month = new_month;
    year = new_year;
  }

  public String getDate() {
    return date;
  }

  public String getArea() {
    return area;
  }

  public String getState() {
    return state;
  }

  public String getCountry() {
    return country;
  }

  public int getGeoid() {
    return geoid;
  }

  public int getCases() {
    return cases;
  }

  public int getDay() {
    return day;
  }

  public int getMonth() {
    return month;
  }

  public int getYear() {
    return year;
  }

  @Override
    public String toString() {
    return "date: " + date + ", area: " + area + 
      ", state: " + state + ", geoid: " + geoid + 
      ", cases: " + cases + ", country: " + country + "\n\n";
  }
}
