package global.sesoc.TOPproject.VO;

public class CompleteRateObj {

	private String p_name;
	private int rate;
	
	public CompleteRateObj(String p_name, int rate) {
		this.p_name = p_name;
		this.rate = rate;
	}
	public String getP_name() { return p_name; }
	public void setP_name(String p_name) { this.p_name = p_name; }
	public int getRate() { return rate; }
	public void setRate(int rate) { this.rate = rate; }
	
}
