package kr.co.acomp.hello.dao.vo;

public class user {
		
	
	private String name;
	private String department;
	private String id;
	private String pw;
	private String email;
	private String contactNo;
	private int loginFlag;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String geteMail() {
		return email;
	}
	public void seteMail(String eMail) {
		this.email = eMail;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public int getLoginFlag() {
		return loginFlag;
	}
	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}
	@Override
	public String toString() {
		return "user [name=" + name + ", department=" + department + ", id=" + id + ", pw=" + pw + ", email=" + email
				+ ", contactNo=" + contactNo + ", loginFlag=" + loginFlag + "]";
	}
	
}
