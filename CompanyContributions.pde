import java.util.Collections;
ArrayList<Company> companyList = new ArrayList();
ArrayList<CompanyBin> binList = new ArrayList();
HashMap<String, CompanyBin> binHash = new HashMap();


int interval = 0;
String loadSector = "";
String[] sectors = {"Consumer D", "Consumer S", "Energy", "Financial", "Health", "Materials", "Other", "Producer", "Technology", "Utilities"};
int sectorIndex = 1;



void setup () {
  size(1400, 800);
  smooth(4);
  loadCompanies();
  getSectorSizes();
  Collections.sort(binList);
  Collections.reverse(binList);
}

void draw() {
  background(255);

  for (Company c:companyList) {
    c.update();
    c.render();
    //println(c.name);
  }
  loadBackground();
  saveFrame();
}


void loadCompanies() {
  String[] rows = loadStrings("companyFinal.csv");
  for (int i = 1; i < 494; i++) {
    Company c = new Company();
    c.fromCSV(rows[i].split(","));
    companyList.add(c);
    String sector = c.sector;
    if ( binHash.containsKey(sector)) {
      CompanyBin bin = binHash.get(sector);
      bin.companyList.add(c);
    } 
    else {
      CompanyBin bin = new CompanyBin();
      bin.sector = sector;
      binHash.put(sector, bin);
      bin.companyList.add(c);
      binList.add(bin);
    }
  }
}


void sortBySector() {
  ///size
  for (int i = 0; i < binList.size(); i++) {
    CompanyBin bin = binList.get(i);
    println("in here tsfojn");
    println(bin.companyList.size());
    for (int j = 0 ; j < bin.companyList.size(); j++) {
      Company c = bin.companyList.get(j);
      interval = width/(bin.companyList.size()+1);
      println("I'm in here!");
      c.x = interval*(j+1);
      println(c.x);
      //set x and y according to interval
    }
  }
}


void getSectorSizes() {
  for (int i = 0; i < binList.size(); i++) {
    CompanyBin bin = binList.get(i);
    for (int j = 0 ; j < bin.companyList.size(); j++) {
      Company c = bin.companyList.get(j);
      c.sectorSize = bin.companyList.size();
    }
  }
}


void loadBackground() {
  colorMode(RGB);
  stroke(0);
  fill(0);
  rect(0, height/2-5, width, 10);
  textSize(32);
  text("Corporation Contributions to Obama vs. Republican Presidental Candidates in 2012", 20, 40);
  text("Sector: " + loadSector, 20, 74);
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      sectorIndex ++;
    }
    if (keyCode == LEFT) {
      sectorIndex --;
    }
  }
  if (sectorIndex >= sectors.length) {
    sectorIndex = 1;
  }
  if (sectorIndex < 1) {
    sectorIndex = 9;
  }
  loadSector = sectors[sectorIndex];
  loadSector();
}


void loadSector() {
  int i = 1;
  for (Company c:companyList) {
    if (loadSector.equals(c.sector)) {
      c.hideArrow = false;
      float interval = width/(c.sectorSize + 1);
      c.pos.x = int(interval*i);
      c.targetRecHeight = map(c.percent, -100 , 100, 300, -300); 
      c.targetRecAlpha = 255;
      i++;
    } 
    else { 
      c.targetRecHeight = 0;
      c.targetRecAlpha = 0;
      c.hideArrow = true;
    }
  }
}

