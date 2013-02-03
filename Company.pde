


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
  int x;
  int y = int(height/2);
  PVector pos = new PVector(x, y);
  PVector targetPos = new PVector();
  
  float scaling = 0;
  float targetScaling;
  
  boolean highlight = false;
  boolean isInside = false;
  boolean hidden = false;
  boolean showInfo = false;
  
  
  void render() {
    arrow = RG.loadShape("upArrow.svg");
    arrow.setFill(true);
    pushMatrix();
    {
      scale(scaling);
      translate(pos.x, pos.y);
      arrow.children[0].draw();
    }
    popMatrix();
  }
  
  
  
  void update() {
    scaling = lerp(scaling, targetScaling, .1);
  }
  
  
  
  void fromCSV(String[] input) {
    sector = input[0];
    name = input[1];
    percent = float(input[2]);
    targetScaling = percent;
    points = float(input[3]);
    individualObama = float(input[4]);
    individualRep = float(input[5]);
    pacObama = float(input[6]);
    pacRep = float(input[7]);
  
  }
  
  
  
  
}
