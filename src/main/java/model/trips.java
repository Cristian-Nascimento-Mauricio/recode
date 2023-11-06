package model;

public class trips {

	private String from;
	private String to;
	private float price;
	
	
	
	public trips(String from, String to, float price) {
		this.from = from;
		this.to = to;
		this.price = price;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	
	
}
