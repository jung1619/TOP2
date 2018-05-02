package global.sesoc.TOPproject.VO;

public class Chat {
	private int p_num;
	private String chat_log;
	public Chat(int p_num, String chat_log) {
		super();
		this.p_num = p_num;
		this.chat_log = chat_log;
	}
	public Chat() {
		super();
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getChat_log() {
		return chat_log;
	}
	public void setChat_log(String chat_log) {
		this.chat_log = chat_log;
	}
	@Override
	public String toString() {
		return "Chat [p_num=" + p_num + ", chat_log=" + chat_log + "]";
	}
	
	

}
