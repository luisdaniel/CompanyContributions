

class CompanyBin implements Comparable {
  
  String sector;
  ArrayList<Company> companyList = new ArrayList();
  
  
  int compareTo(Object o) {
    int r = companyList.size() - ((CompanyBin) o).companyList.size();
    return(r);
  }
}
