package com.test.domain;

public class Users {
    private Integer userId;
    private String userName;
    private String Password;
    private String sex;
    private String email;
    private String identity;

    public Users() {
    }

    public Users(Integer userId, String userName, String password, String sex, String email, String identity) {
        this.userId = userId;
        this.userName = userName;
        Password = password;
        this.sex = sex;
        this.email = email;
        this.identity = identity;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }
}
