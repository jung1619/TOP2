package global.sesoc.TOPproject.VO;

public class Schedule {

	private String id;
	private int p_num;
	private String startdate;
	private String enddate;
	private String content;
	private String color;
	private String deldate;
	private int schedule_num;	//시퀀스
	
	public Schedule(){}

	public Schedule(String id, int p_num, String startdate, String enddate, String content, String color,
			String deldate, int schedule_num) {
		super();
		this.id = id;
		this.p_num = p_num;
		this.startdate = startdate;
		this.enddate = enddate;
		this.content = content;
		this.color = color;
		this.deldate = deldate;
		this.schedule_num = schedule_num;
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

	public int getSchedule_num() {
		return schedule_num;
	}

	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}

	@Override
	public String toString() {
		return "Schedule [id=" + id + ", p_num=" + p_num + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", content=" + content + ", color=" + color + ", deldate=" + deldate + ", schedule_num="
				+ schedule_num + "]";
	}
	
	
	
}