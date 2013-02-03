import java.util.Collections;
import geomerative.*;
ArrayList<Company> companyList = new ArrayList();
ArrayList<CompanyBin> binList = new ArrayList();
HashMap<String, CompanyBin> binHash = new HashMap();


int interval = 0;
String loadSector;


void setup () {
  size(1200, 800);
  smooth(4);
  loadCompanies();
  getSectorSizes();
  Collections.sort(binList);
  Collections.reverse(binList);
  
}

void draw() {
  background(255);
  loadBackground();
  for (Company c:companyList) {
    c.update();
    c.render();
    //println(c.name);
  }
}


void loadCompanies() {
  String[] rows = loadStrings("companyData.csv");
  for (int i = 1; i < 11; i++) {
    Company c = new Company();
    c.fromCSV(rows[i].split(","));
    companyList.add(c);
    RG.init(this);
    RG.setPolygonizer(RG.ADAPTATIVE);
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
      println(c.sectorSize);
    }
  }
}


void loadBackground() {
  stroke(0);
  fill(0);
  rect(0, height/2-5, width, 10);
}


void keyPressed() {
  if (key == 'q') {
    loadSector = "Technology";
    loadSector();
  }
}


void loadSector() {
  int i = 1;
  for (Company c:companyList) {
    if(loadSector.equals(c.sector)) {
      c.hideArrow = false;
      float interval = width/(c.sectorSize + 1);
      c.pos.x = int(interval*i);
      println(c.sectorSize);
      c.targetScaling = 50; 
      i++;
    } else { }
  }
}

