package global.sesoc.TOPproject.VO;
 
public class Project {

	private int p_num;
	private String p_m_id;
	private String p_name;
	private String p_memberlist;
	private String p_indate;
	private String p_deldate;
	private String p_startdate;
	private String p_enddate;
	private String p_pdate;
	public Project(int p_num, String p_m_id, String p_name, String p_memberlist, String p_indate, String p_deldate,
			String p_startdate, String p_enddate, String p_pdate) {
		super();
		this.p_num = p_num;
		this.p_m_id = p_m_id;
		this.p_name = p_name;
		this.p_memberlist = p_memberlist;
		this.p_indate = p_indate;
		this.p_deldate = p_deldate;
		this.p_startdate = p_startdate;
		this.p_enddate = p_enddate;
		this.p_pdate = p_pdate;
	}
	public Project() {
		super();
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_memberlist() {
		return p_memberlist;
	}
	public void setP_memberlist(String p_memberlist) {
		this.p_memberlist = p_memberlist;
	}
	public String getP_indate() {
		return p_indate;
	}
	public void setP_indate(String p_indate) {
		this.p_indate = p_indate;
	}
	public String getP_deldate() {
		return p_deldate;
	}
	public void setP_deldate(String p_deldate) {
		this.p_deldate = p_deldate;
	}
	public String getP_startdate() {
		return p_startdate;
	}
	public void setP_startdate(String p_startdate) {
		this.p_startdate = p_startdate;
	}
	public String getP_enddate() {
		return p_enddate;
	}
	public void setP_enddate(String p_enddate) {
		this.p_enddate = p_enddate;
	}
	public String getP_pdate() {
		return p_pdate;
	}
	public void setP_pdate(String p_pdate) {
		this.p_pdate = p_pdate;
	}
	@Override
	public String toString() {
		return "Project [p_num=" + p_num + ", p_m_id=" + p_m_id + ", p_name=" + p_name + ", p_memberlist="
				+ p_memberlist + ", p_indate=" + p_indate + ", p_deldate=" + p_deldate + ", p_startdate=" + p_startdate
				+ ", p_enddate=" + p_enddate + ", p_pdate=" + p_pdate + "]";
	}
	
	
	
	}
