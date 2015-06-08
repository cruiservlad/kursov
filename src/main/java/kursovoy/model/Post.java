package kursovoy.model;

public class Post {
	private String tNew;
	private String header;
	private String text;
	private int idx;
	private String Name;
	private String SurName;
	private String userId;
	
	
	public Post() {
	}
	
	public Post(String tNew, String header, String textPost, String user, int id) {
		this.tNew = tNew;
		this.header = header;
		this.text = textPost;
		this.userId = user;
		this.idx = id;
	}
	public Post(int idx) {
		this.idx = idx;
	}
	
	public void setName(String name) {
		this.Name = name;
	}
	public String getName() {
		return Name;
	}
	
	public void setSurName(String surname) {
		this.SurName = surname;
	}
	public String getSurName() {
		return SurName;
	}
	
	public void setUserId(String user) {
		this.userId = user;
	}
	public String getUserId() {
		return userId;
	}
	
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String Text) {
		this.text = Text;
	}
	
	public String getTNew() {
		return tNew;
	}
	public void setTNew(String Text) {
		this.tNew = Text;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int id) {
		this.idx = id;
	}

}
