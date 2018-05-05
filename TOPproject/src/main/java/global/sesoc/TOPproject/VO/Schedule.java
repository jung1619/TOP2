package global.sesoc.TOPproject.VO;

public class Schedule {

	private int s_num;	//시퀀스
	private String id;
	private int p_num;
	private String startdate;
	private String enddate;
	private String content;
	private String color;
	private String deldate;
	private int complete;
	
	public Schedule(){}
	public Schedule(String id, int s_num, String startdate, String enddate, String content, String color,
			String deldate, int complete) {
		super();
		this.id = id;
		this.s_num = s_num;
		this.startdate = startdate;
		this.enddate = enddate;
		this.content = content;
		this.color = color;
		this.deldate = deldate;
		this.complete = complete;
	}
	public Schedule(String id, int p_num, int s_num, String startdate, String enddate, String content, String color,
			String deldate, int complete) {
		super();
		this.id = id;
		this.p_num = p_num;
		this.s_num = s_num;
		this.startdate = startdate;
		this.enddate = enddate;
		this.content = content;
		this.color = color;
		this.deldate = deldate;
		this.complete = complete;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getDeldate() {
		return deldate;
	}

	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	
	public int getComplete() {
		return complete;
	}

	public void setComplete(int complete) {
		this.complete = complete;
	}

	@Override
	public String toString() {
		return "Schedule [id=" + id + ", p_num=" + p_num + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", content=" + content + ", color=" + color + ", deldate=" + deldate + ", s_num="
				+ s_num + ", complete=" + complete + "]";
	}
	
	
	
}