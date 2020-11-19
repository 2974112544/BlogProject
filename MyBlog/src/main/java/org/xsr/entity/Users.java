package org.xsr.entity;

/**
 * @Author 谢胜荣
 * @Date 2020/10/21 15:47
 * @Version 1.0
 */
public class Users {
    private Long userID;
    private String userName;
    private String userPassword;
    private String sex;
    private Integer age;
    private String address;
    private String avatar;
    private String phone;
    private String email;
    private Integer commentIf;
    private Integer topicIf;
    private Integer userLevel;
    private Integer admin;
    private Integer blogNum;

    public Users() {
    }

    public Users(Long userID, String userName, String userPassword, String sex, Integer age, String address, String avatar, String phone, String email, Integer commentIf, Integer topicIf, Integer userLevel, Integer admin) {
        this.userID = userID;
        this.userName = userName;
        this.userPassword = userPassword;
        this.sex = sex;
        this.age = age;
        this.address = address;
        this.avatar = avatar;
        this.phone = phone;
        this.email = email;
        this.commentIf = commentIf;
        this.topicIf = topicIf;
        this.userLevel = userLevel;
        this.admin = admin;
    }

    public Integer getCommentIf() {
        return commentIf;
    }

    public void setCommentIf(Integer commentIf) {
        this.commentIf = commentIf;
    }

    public Integer getBlogNum() {
        return blogNum;
    }

    public void setBlogNum(Integer blogNum) {
        this.blogNum = blogNum;
    }

    public Long getUserID() {
        return userID;
    }

    public void setUserID(Long userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getcommentIf() {
        return commentIf;
    }

    public void setcommentIf(Integer commentIf) {
        this.commentIf = commentIf;
    }

    public Integer getTopicIf() {
        return topicIf;
    }

    public void setTopicIf(Integer topicIf) {
        this.topicIf = topicIf;
    }

    public Integer getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(Integer userLevel) {
        this.userLevel = userLevel;
    }

    public Integer getAdmin() {
        return admin;
    }

    public void setAdmin(Integer admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        return "Users{" +
                "userID=" + userID +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", address='" + address + '\'' +
                ", avatar='" + avatar + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", commentIf=" + commentIf +
                ", topicIf=" + topicIf +
                ", userLevel=" + userLevel +
                ", admin=" + admin +
                ", blogNum=" + blogNum +
                '}';
    }
}
