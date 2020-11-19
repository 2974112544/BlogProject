package org.xsr.entity;

/**
 * @authorID 谢胜荣
 * @Date 2020/10/22 10:46
 * @Version 1.0
 */
public class Blog {

    private Long articleID;
    private Long authorID;
    private String author;
    private String avatar;
    private String releaseDate;
    private String articleTitle;
    private String articleView;
    private String articleText;
    private String beLong;
    private String label;
    private Integer commentNum;
    private Integer views;
    private Long degree;
    private Integer ifComment;
    private Integer status;

    public Blog() {
    }

    public Blog(Long articleID, Long authorID, String author, String avatar, String releaseDate, String articleTitle, String articleView, String articleText, String beLong, String label) {
        this.articleID = articleID;
        this.authorID = authorID;
        this.author = author;
        this.avatar = avatar;
        this.releaseDate = releaseDate;
        this.articleTitle = articleTitle;
        this.articleView = articleView;
        this.articleText = articleText;
        this.beLong = beLong;
        this.label = label;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "articleID=" + articleID +
                ", authorID=" + authorID +
                ", author='" + author + '\'' +
                ", avatar='" + avatar + '\'' +
                ", releaseDate='" + releaseDate + '\'' +
                ", articleTitle='" + articleTitle + '\'' +
                ", articleView='" + articleView + '\'' +
                ", articleText='" + articleText + '\'' +
                ", beLong='" + beLong + '\'' +
                ", label='" + label + '\'' +
                ", commentNum=" + commentNum +
                ", views=" + views +
                ", degree=" + degree +
                ", ifComment=" + ifComment +
                ", status=" + status +
                '}';
    }

    public String getArticleView() {
        return articleView;
    }

    public void setArticleView(String articleView) {
        this.articleView = articleView;
    }

    public String getBeLong() {
        return beLong;
    }

    public void setBeLong(String beLong) {
        this.beLong = beLong;
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

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleText() {
        return articleText;
    }

    public void setArticleText(String articleText) {
        this.articleText = articleText;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Long getDegree() {
        return degree;
    }

    public void setDegree(Long degree) {
        this.degree = degree;
    }

    public Integer getIfComment() {
        return ifComment;
    }

    public void setIfComment(Integer ifComment) {
        this.ifComment = ifComment;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
