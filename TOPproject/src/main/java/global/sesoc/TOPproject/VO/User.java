package global.sesoc.TOPproject.VO;
 
public class User {
	
	private String id;
	private String pw;
	private String email;
	private String name;
	private String nickname;
	private String company;
	private String leavedate;
	private String p_num_list;
	
	public User(){}

	public User(String id, String pw, String email, String name, String nickname, String company, String leavedate,
			String p_num_list) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.company = company;
		this.leavedate = leavedate;
		this.p_num_list = p_num_list;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getLeavedate() {
		return leavedate;
	}

	public void setLeavedate(String leavedate) {
		this.leavedate = leavedate;
	}

	public String getP_num_list() {
		return p_num_list;
	}

	public void setP_num_list(String p_num_list) {
		this.p_num_list = p_num_list;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + ", nickname=" + nickname
				+ ", company=" + company + ", leavedate=" + leavedate + ", p_num_list=" + p_num_list + "]";
	}
	
	
	
	
}
