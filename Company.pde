


class Company {
  String sector;
  String name;
  float percent;
  float points;
  float individualObama;
  float individualRep;
  float pacObama;
  float pacRep;
  RShape arrow;
  int x, y;
  PVector pos = new PVector(x, y);
  PVector targetPos = new PVector();
  
  boolean highlight = false;
  boolean isInside = false;
  boolean hidden = false;
  boolean showInfo = false;
  
  
  void render() {
    
    
  }
  
  
  
  void update() {
    
    
    
  }
  
  
  
  void fromCSV(String[] input) {
    sector = input[0];
    name = input[1];
    percent = float(input[2]);
    points = float(input[3]);
    individualObama = float(input[4]);
    individualRep = float(input[5]);
    pacObama = float(input[6]);
    pacRep = float(input[7]);
  
  }
  
  
  
  
}
