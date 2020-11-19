package org.xsr.entity;

import java.awt.image.LookupOp;

/**
 * @Author 谢胜荣
 * @Date 2020/10/23 11:09
 * @Version 1.0
 */
public class CommunityComment {

    private Long commentID;
    private Long topicID;
    private Long authorID;
    private String author;
    private String avatar;
    private String releaseDate;
    private String commentText;
    private Integer state;

    public CommunityComment() {
    }

    public CommunityComment(Long commentID, Long topicID, Long authorID, String author, String avatar, String releaseDate, String commentText) {
        this.commentID = commentID;
        this.topicID = topicID;
        this.authorID = authorID;
        this.author = author;
        this.avatar = avatar;
        this.releaseDate = releaseDate;
        this.commentText = commentText;
    }

    public CommunityComment(Long commentID, Long topicID, Long authorID, String author, String avatar, String releaseDate, String commentText, Integer state) {
        this.commentID = commentID;
        this.topicID = topicID;
        this.authorID = authorID;
        this.author = author;
        this.avatar = avatar;
        this.releaseDate = releaseDate;
        this.commentText = commentText;
        this.state = state;
    }

    public Long getCommentId() {
        return commentID;
    }

    public void setCommentId(Long commentId) {
        this.commentID = commentId;
    }

    public Long getTopicId() {
        return topicID;
    }

    public void setTopicId(Long topicId) {
        this.topicID = topicId;
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

    public Long getCommentID() {
        return commentID;
    }

    public void setCommentID(Long commentID) {
        this.commentID = commentID;
    }

    public Long getTopicID() {
        return topicID;
    }

    public void setTopicID(Long topicID) {
        this.topicID = topicID;
    }

    public Long getAuthorID() {
        return authorID;
    }

    public void setAuthorID(Long authorID) {
        this.authorID = authorID;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "CommunityComment{" +
                "commentID=" + commentID +
                ", topicID=" + topicID +
                ", authorID=" + authorID +
                ", author='" + author + '\'' +
                ", avatar='" + avatar + '\'' +
                ", releaseDate='" + releaseDate + '\'' +
                ", commentText='" + commentText + '\'' +
                ", state=" + state +
                '}';
    }
}

