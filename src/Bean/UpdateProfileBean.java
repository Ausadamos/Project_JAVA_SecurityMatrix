package Bean;

public class UpdateProfileBean {

	//---------------Table center
	int ID_Users_TranID;
	int Id_User;
	int Id_TranID;
	
	//---------------User
	String name;
	
	//---------------TranID
	String Code;
	String Detail;
	
	
	boolean valid;
	
	
	
	
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public int getID_Users_TranID() {
		return ID_Users_TranID;
	}
	public void setID_Users_TranID(int iD_Users_TranID) {
		ID_Users_TranID = iD_Users_TranID;
	}
	public int getId_User() {
		return Id_User;
	}
	public void setId_User(int id_User) {
		Id_User = id_User;
	}
	public int getId_TranID() {
		return Id_TranID;
	}
	public void setId_TranID(int id_TranID) {
		Id_TranID = id_TranID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		Code = code;
	}
	public String getDetail() {
		return Detail;
	}
	public void setDetail(String detail) {
		Detail = detail;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
