package global.sesoc.TOPproject.VO;
 
public class Project {

	private int p_num;
	private String p_m_id;
	private String name;
	private String memberlist;
	private String indate;
	private String deldate;
	private String startdate;
	private String enddate;
	private String p_pdate;
	private int completerate;
	
	
	public Project() {}
	public Project(int p_num, String p_m_id, String name, String memberlist, String indate, String deldate,
			String startdate, String enddate, String p_pdate, int completerate) {
		super();
		this.p_num = p_num;
		this.p_m_id = p_m_id;
		this.name = name;
		this.memberlist = memberlist;
		this.indate = indate;
		this.deldate = deldate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.p_pdate = p_pdate;
		this.completerate = completerate;
	}
	

	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_m_id() {
		return p_m_id;
	}
	public void setP_m_id(String p_m_id) {
		this.p_m_id = p_m_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemberlist() {
		return memberlist;
	}
	public void setMemberlist(String memberlist) {
		this.memberlist = memberlist;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getDeldate() {
		return deldate;
	}
	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getPdate() {
		return p_pdate;
	}
	public void setPdate(String p_pdate) {
		this.p_pdate = p_pdate;
	}
	public int getCompleterate() {
		return completerate;
	}
	public void setCompleterate(int completerate) {
		this.completerate = completerate;
	}
	
	@Override
	public String toString() {
		return "Project [p_num=" + p_num + ", p_m_id=" + p_m_id + ", name=" + name + ", memberlist=" + memberlist
				+ ", indate=" + indate + ", deldate=" + deldate + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", p_pdate=" + p_pdate + ", completerate=" + completerate + "]";
	}

	
	
}
