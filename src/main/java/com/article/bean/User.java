package com.article.bean;

public class User {
    private Integer userId;

    private Integer userRole;

    private String userName;

    private String userPassword;

    private String userAvatar;

    private String userLocation;

    private String userBio;

    private Integer userValue;

    public User(Integer userId, Integer userRole, String userName, String userPassword, String userAvatar, String userLocation, String userBio, Integer userValue) {
        this.userId = userId;
        this.userRole = userRole;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userAvatar = userAvatar;
        this.userLocation = userLocation;
        this.userBio = userBio;
        this.userValue = userValue;
    }

    public User() {
        super();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserRole() {
        return userRole;
    }

    public void setUserRole(Integer userRole) {
        this.userRole = userRole;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar == null ? null : userAvatar.trim();
    }

    public String getUserLocation() {
        return userLocation;
    }

    public void setUserLocation(String userLocation) {
        this.userLocation = userLocation == null ? null : userLocation.trim();
    }

    public String getUserBio() {
        return userBio;
    }

    public void setUserBio(String userBio) {
        this.userBio = userBio == null ? null : userBio.trim();
    }

    public Integer getUserValue() {
        return userValue;
    }

    public void setUserValue(Integer userValue) {
        this.userValue = userValue;
    }
}