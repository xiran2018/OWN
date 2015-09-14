package ru.own.www.logic;


import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport {
    String userName;
    String password;

    public String execute()
    {
		System.out.print(getUserName());
		if (isInvalid(getUserName()))
		    return INPUT;
		if (isInvalid(getPassword()))
		    return INPUT;
	
		return SUCCESS;
    }
    

    private boolean isInvalid(String value) {
	return (value == null || value.length() == 0);
    }


    public String getUserName() {
        return userName;
    }


    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }

    

}