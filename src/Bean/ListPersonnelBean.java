package Bean;

public class ListPersonnelBean {

String fname;
	String lname ;
	
	int Id_Personnel ;
int  Id_Company;
String  NameCompany ;

String IdNTT;

String Username;

public String getUsername() {
	return Username;
}
public void setUsername(String username) {
	Username = username;
}
public String getIdNTT() {
	return IdNTT;
}
public void setIdNTT(String idNTT) {
	IdNTT = idNTT;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public int getId_Personnel() {
	return Id_Personnel;
}
public void setId_Personnel(int id_Personnel) {
	Id_Personnel = id_Personnel;
}
public int getId_Company() {
	return Id_Company;
}
public void setId_Company(int id_Company) {
	Id_Company = id_Company;
}
public String getNameCompany() {
	return NameCompany;
}
public void setNameCompany(String nameCompany) {
	NameCompany = nameCompany;
}
}
