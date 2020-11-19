package org.xsr.entity;

/**
 * @Author 谢胜荣
 * @Date 2020/11/10 21:11
 * @Version 1.0
 */
public class SonComment {
    private Long commentID;   //评论id，数据库自增
    private Integer articleType;       //所属类型
    private Long fatherID;  //被回复的评论id
    private Long articleID;   //所属文章/博客id
    private Long authorID;   //评论者ID
    private String  author;  //评论者姓名
    private String avatar;
    private String commentText;
    private String releaseDate;
    private Integer state;  //发布状态，默认正常

    public SonComment() {
    }

    public SonComment(Integer articleType, Long fatherID, Long articleID, Long authorID, String author, String avatar, String commentText) {
        this.articleType = articleType;
        this.fatherID = fatherID;
        this.articleID = articleID;
        this.authorID = authorID;
        this.author = author;
        this.avatar = avatar;
        this.commentText = commentText;
    }

    @Override
    public String toString() {
        return "SonComment{" +
                "commentID=" + commentID +
                ", type=" + articleType +
                ", fatherID=" + fatherID +
                ", articleID=" + articleID +
                ", authorID=" + authorID +
                ", author='" + author + '\'' +
                ", avatar='" + avatar + '\'' +
                ", commentText='" + commentText + '\'' +
                ", releaseDate='" + releaseDate + '\'' +
                ", state=" + state +
                '}';
    }

    public Long getCommentID() {
        return commentID;
    }

    public void setCommentID(Long commentID) {
        this.commentID = commentID;
    }

    public Integer getArticleType() {
        return articleType;
    }

    public void setArticleType(Integer articleType) {
        this.articleType = articleType;
    }

    public Long getFatherID() {
        return fatherID;
    }

    public void setFatherID(Long fatherID) {
        this.fatherID = fatherID;
    }

    public Long getArticleID() {
        return articleID;
    }

    public void setArticleID(Long articleID) {
        this.articleID = articleID;
    }

    public Long getAuthorID() {
        return authorID;
    }

    public void setAuthorID(Long authorID) {
        this.authorID = authorID;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
