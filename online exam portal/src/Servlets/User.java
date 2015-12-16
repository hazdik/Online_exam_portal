package Servlets;

public abstract class User {
	protected String Username;
	protected String Fname;
	protected String Lname;
	protected String Mail;
	protected String Gender;
	protected String Dob;
	
	public String getUsername(){
		return Username;
	}
	
	public String getfname() {
		return Fname;
	}

	public String getlname() {
		return Lname;
	}

	public String getMail() {
		return Mail;
	}

	public String getGender() {
		return Gender;
	}

	public String getdob() {
		return Dob;
	}
	
	public void setUsername( String sU){
		this.Username= sU;
	}
	
	public void setFName(String sFN) {
		this.Fname = sFN;
	}
	
	public void setLName(String sLN) {
		this.Lname = sLN;
	}
	
	public void setMail(String sM ){
		this.Mail = sM;
	}
	
	public void setGender(String sG) {
		this.Gender = sG;
	}
	
	public void setdob(String sD){
		this.Dob = sD;
	}
	
	public void edit_detail(){
		
	}

}
