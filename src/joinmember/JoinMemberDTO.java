package joinmember;

public class JoinMemberDTO {
	private String name; 
	private String id;
	private String pass1;
	private String pass2;
	private String email;
	private String tel;
	private String job;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass1() {
		return pass1;
	}
	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}
	public String getPass2() {
		return pass2;
	}
	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "JoinMemberDTO [name=" + name + ", id=" + id + ", pass1=" + pass1 + ", pass2=" + pass2 + ", email="
				+ email + ", tel=" + tel + ", job=" + job + "]";
	}
	public JoinMemberDTO() {
		
	}
	public JoinMemberDTO(String name, String id, String pass1, String pass2, String email, String tel, String job) {
		super();
		this.name = name;
		this.id = id;
		this.pass1 = pass1;
		this.pass2 = pass2;
		this.email = email;
		this.tel = tel;
		this.job = job;
	}
	
	
	
}
