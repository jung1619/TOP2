package global.sesoc.TOPproject.VO;

public class Context {
	
	private int p_num;
	private String title;
	private String context;
	private String writer;
	
	public Context(){}
	public Context(int p_num, String title, String context, String writer) {
		this.p_num = p_num;
		this.title = title;
		this.context = context;
		this.writer = writer;
	}
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	@Override
	public String toString() {
		return "Context [p_num=" + p_num + ", title=" + title + ", writer=" + writer + ", context=" + context + "]";
	}
	
}
