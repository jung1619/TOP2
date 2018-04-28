package global.sesoc.TOPproject.VO;

public class Message {
		
	
	private String id;
	private String nickName;
	private String message;
	public Message(String id, String nickName, String message) {
		super();
		this.id = id;
		this.nickName = nickName;
		this.message = message;
	}
	public Message() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", nickName=" + nickName + ", message=" + message + "]";
	}
	
	
	
	
}
