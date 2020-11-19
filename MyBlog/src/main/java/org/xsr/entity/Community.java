package org.xsr.entity;

/**
 * @Author 谢胜荣
 * @Date 2020/10/23 14:48
 * @Version 1.0
 */
public class Community {

    private Long communityID;
    private Long authorID;
    private String author;
    private String avatar;
    private String releaseDate;
    private String articleTitle;
    private String articleText;
    private String label;
    private Integer commentNum;
    private Integer vies;
    private Long degree;
    private Integer ifComment;
    private Integer state;

    public Community() {
    }

    public Community(Long communityID, Long authorID, String author, String avatar, String releaseDate, String articleTitle, String articleText, String label) {
        this.communityID = communityID;
        this.authorID = authorID;
        this.author = author;
        this.avatar = avatar;
        this.releaseDate = releaseDate;
        this.articleTitle = articleTitle;
        this.articleText = articleText;
        this.label = label;
    }

    @Override
    public String toString() {
        return "Community{" +
                "communityID=" + communityID +
                ", authorID=" + authorID +
                ", author='" + author + '\'' +
                ", avatar='" + avatar + '\'' +
                ", releaseDate='" + releaseDate + '\'' +
                ", articleTitle='" + articleTitle + '\'' +
                ", articleText='" + articleText + '\'' +
                ", label='" + label + '\'' +
                ", commentNum=" + commentNum +
                ", vies=" + vies +
                ", degree=" + degree +
                ", ifComment=" + ifComment +
                ", state=" + state +
                '}';
    }

    public Integer getIfComment() {
        return ifComment;
    }

    public void setIfComment(Integer ifComment) {
        this.ifComment = ifComment;
    }

    public Long getCommunityID() {
        return communityID;
    }

    public void setCommunityID(Long communityID) {
        this.communityID = communityID;
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

    public Integer getVies() {
        return vies;
    }

    public void setVies(Integer vies) {
        this.vies = vies;
    }

    public Long getDegree() {
        return degree;
    }

    public void setDegree(Long degree) {
        this.degree = degree;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
