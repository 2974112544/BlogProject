package org.xsr.entity;

/**
 * @Author 谢胜荣
 * @Date 2020/10/23 10:28
 * @Version 1.0
 */
public class BlogComment {

    private Long commentID;
    private Long blogID;
    private Long authorID;   //评论者ID
    private String  author;  //评论者姓名
    private String avatar;
    private String commentText;
    private String releaseDate;
    private Integer state;

    public BlogComment() {
    }

    public BlogComment(Long commentID, Long blogID, Long authorID, String author, String avatar, String releaseDate, String commentText) {
        this.commentID = commentID;
        this.blogID = blogID;
        this.authorID = authorID;
        this.author = author;
        this.avatar = avatar;
        this.releaseDate = releaseDate;
        this.commentText = commentText;
    }

    public BlogComment(Long commentID, Long blogID, Long authorID, String author, String avatar, String releaseDate, String commentText, Integer state) {
        this.commentID = commentID;
        this.blogID = blogID;
        this.authorID = authorID;
        this.author = author;
        this.avatar = avatar;
        this.releaseDate = releaseDate;
        this.commentText = commentText;
        this.state = state;
    }

    public Long getCommentID() {
        return commentID;
    }

    public void setCommentID(Long commentID) {
        this.commentID = commentID;
    }

    public Long getAuthorId() {
        return authorID;
    }

    public void setAuthorId(Long authorId) {
        this.authorID = authorId;
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

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Long getBlogID() {
        return blogID;
    }

    public void setBlogID(Long blogID) {
        this.blogID = blogID;
    }

    public Long getAuthorID() {
        return authorID;
    }

    public void setAuthorID(Long authorID) {
        this.authorID = authorID;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "BlogComment{" +
                "commentID=" + commentID +
                ", blogID=" + blogID +
                ", authorID=" + authorID +
                ", author='" + author + '\'' +
                ", avatar='" + avatar + '\'' +
                ", releaseDate='" + releaseDate + '\'' +
                ", commentText='" + commentText + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}

