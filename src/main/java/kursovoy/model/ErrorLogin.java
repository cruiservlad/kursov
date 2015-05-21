package kursovoy.model;

public class ErrorLogin {
	private int yesLogin;
	
	public int YesLogin() {
    	return yesLogin;
    }
    public ErrorLogin() {
    }
    
    public ErrorLogin(int idlogin) {
    	this.yesLogin = idlogin;
    }
}
