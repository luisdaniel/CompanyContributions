import java.util.Collections;
import geomerative.*;
ArrayList<Company> companyList = new ArrayList();
ArrayList<CompanyBin> binList = new ArrayList();
HashMap<String, CompanyBin> binHash = new HashMap();


int interval = 0;



void setup () {
  size(1200, 800);
  smooth(4);
  loadCompanies();
  Collections.sort(binList);
  Collections.reverse(binList);
  sortBySector();
}

void draw() {
  background(255);
  loadBackground();
  for (Company c:companyList) {
    c.update();
    c.render();
  }
}


void loadCompanies() {
  String[] rows = loadStrings("companyData.csv");
  for (int i = 1; i < 5; i++) {
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


//void sortByCompany() {
//  for (int i = 0; i < binList.size(); i++) {
//    PanelBin bin = binList.get(i);
//    for (int j = 0 ; j < bin.companyList.size(); j++) {
//      Company p = bin.companyList.get(j);
//      p.numStops = bin.panelList.size();
//      p.stopNum = j;
//      p.suspectNum = i;
//    }
//  }
//}


void loadBackground() {
  stroke(0);
  fill(0);
  rect(0, height/2-5, width, 10);
}

