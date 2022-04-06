//Kajus coded this class in order to put images on the screen
class Map {
  color stateColor;
  int x, y;
  PImage appearance;
  // constructor for the map
  Map(int x, int y, PImage appearance, color stateColor){
    this.x=x;
    this.y=y;
    this.appearance=appearance;
    this.stateColor=stateColor;
  }
  
  // draws the state
  void draw(){
   tint(stateColor);
   image (appearance, x, y); 
  }
}
