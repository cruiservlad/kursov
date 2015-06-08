package kursovoy.model;


public class User {
    private int userId;
    private String firstName;
    private String lastName;
    private int age;
    private boolean admin;
    private String Login;
    private String future;
    private int yesFollower;
    //private String email;

    public User() {
    }

    public String getFirstName() {
        return firstName;
    }

    public User(int userId, String firstName, String lastName, int age, boolean userAdmin, String Login) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.admin = userAdmin;
        this.Login = Login;
    }
    
    public User(String firstName, String lastName, int age, String Login, String future) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.Login = Login;
        this.future = future;
    }
    
    public User(int follower) {
    	this.yesFollower = follower;
    }
    
    public int getFollower() {
    	return yesFollower;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }
    
    public String getLogin() {
    	return Login;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getAge() {
        return age;
    }
    
    public boolean getAdmin() {
        return admin;
    }

    public void setAge(int age) {
        this.age = age;
    }

}
