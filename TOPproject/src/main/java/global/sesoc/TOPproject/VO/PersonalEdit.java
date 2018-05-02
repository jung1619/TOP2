package global.sesoc.TOPproject.VO;

public class PersonalEdit {

	
	private int c_num;
	private String title;
	private String id;
	private String context;
	private String indate;
	public PersonalEdit(int c_num, String title, String id, String context, String indate) {
		super();
		this.c_num = c_num;
		this.title = title;
		this.id = id;
		this.context = context;
		this.indate = indate;
	}
	public PersonalEdit() {
		super();
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "PersonalEdit [c_num=" + c_num + ", title=" + title + ", id=" + id + ", context=" + context + ", indate="
				+ indate + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
