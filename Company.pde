


class Company {
  String sector;
  String name;
  float percent;
  float points;
  float individualObama;
  float individualRep;
  float pacObama;
  float pacRep;

  int sectorSize;
  int x;
  int y = int(height/2);
  PVector pos = new PVector(x, y);
  PVector targetPos = new PVector();

  float recHeight = 0;
  float targetRecHeight;
  float recAlpha = 0;
  float targetRecAlpha;

  float r = 0;
  float b = 0;


  boolean hideArrow = true;
  boolean highlight = false;
  boolean isInside = false;
  boolean hidden = false;
  boolean showInfo = false;


  void render() {
    if (!hideArrow) {
      pushMatrix();
      {

        translate(pos.x, height/2);
        noStroke();
        //colorMode(HSB, 360, 100,100);
        r = map(individualRep, 0, 624049, 0, 255);
        b = map(individualObama, 0, 217541, 0, 255);
        //float h = (r + b)/2;
        if ( r == 0 && b == 0) {
          fill(216, 226, 232, recAlpha);
          rect(0, 0, 10, recHeight);
        } 
        else {
          fill(255*r/(r+b), 0, 255*b/(b+r)*1.1, recAlpha);
          rect(0, 0, 10, recHeight);

        }

        //colorMode(RGB, 255);
        pushMatrix(); 
        {
          rotate(-PI/2);
          fill(0, recAlpha);
          textSize(12);
          //float textPos = (percent < 0) ? 10: recHeight + 10;
          if (recHeight > 0) text(name + " " + nf(percent, 0, 2), -textWidth(name + " " + nf(percent, 0, 2)) - recHeight - 10, +10);
          if (recHeight <= 0) text(name + " " + nf(percent, 0, 2), -textWidth(name + " " + nf(percent, 0, 2)) - 10, +10);
          //text(name, recHeight+30, -textWidth(name)/2);
        }
        popMatrix();
        if (mouseX > pos.x-6 && mouseX < pos.x+6) {
          if (mouseY > recHeight + 10 + height/2 && mouseY < recHeight+ height/2 + textWidth(name + " " + nf(percent, 0, 2)) + 10) {
            textSize(18);
            text("Company name: " + name, -pos.x + width/2 - 200, -200 - 18);
            text("Individual Contributions to Obama: " + individualObama, -pos.x + width/2 - 200, -200);
            //text("PAC Contributions to Obama: " + pacObama, - textWidth(name)/2, recHeight + 40 + 18*2);
            text("Individual Contributions to the Republican Party: " + individualRep, -pos.x + width/2 - 200, -200 + 18);
            //text("PAC Contributions to the Republican Party: " + pacRep, - textWidth(name)/2, recHeight + 40 + 18*4);
          }
        }
      }
      popMatrix();
    }
  }



  void update() {
    recHeight = lerp(recHeight, targetRecHeight, .1);
    recAlpha = lerp(recAlpha, targetRecAlpha, .1);
  }


  void fromCSV(String[] input) {
    sector = input[0];
    name = input[1];
    percent = float(input[4]);
    //points = float(input[3]);
    individualObama = float(input[2]);
    individualRep = float(input[3]);
    //pacObama = float(input[6]);
    //pacRep = float(input[7]);
  }
}

