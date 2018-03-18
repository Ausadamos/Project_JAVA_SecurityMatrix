package Bean;



public class UserLogBean {

	
	String Username;
	String Password;
	int Status;
	int IdProfile;
	int Id_Company;
	String fname;
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



	String lname;
	public int getId_Company() {
		return Id_Company;
	}



	public void setId_Company(int id_Company) {
		Id_Company = id_Company;
	}



	public int getIdProfile() {
		return IdProfile;
	}



	public void setIdProfile(int idProfile) {
		IdProfile = idProfile;
	}



	public String getUsername() {
		return Username;
	}



	public void setUsername(String username) {
		Username = username;
	}



	public String getPassword() {
		return Password;
	}



	public void setPassword(String password) {
		Password = password;
	}



	public int getStatus() {
		return Status;
	}



	public void setStatus(int status) {
		Status = status;
	}



	public boolean isValid() {
		return Valid;
	}



	public void setValid(boolean valid) {
		Valid = valid;
	}



	boolean Valid;
	
	
	
	
	
	
	
	
	
	
}
