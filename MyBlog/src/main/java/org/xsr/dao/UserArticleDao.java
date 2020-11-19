package org.xsr.dao;

import org.apache.ibatis.annotations.Param;
import org.xsr.entity.Blog;
import org.xsr.entity.BlogComment;
import org.xsr.entity.SonComment;

import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/27 16:20
 * @Version 1.0
 */
public interface UserArticleDao {

    // 博客操作
    List<Blog> userGetAllSelfArticle(@Param("authorID") Long authorID,@Param("beginNum") Integer beginNum,@Param("endNum") Integer endNum); //用户登录成功后，自动获取个人所有博客信息

    int userAddArticle(Blog blog); //用户发布博客 提交审核
    boolean userDeleteArticle(Long blogID); //用户删除自己一个博客
    boolean userDeleteArticleAll(Long authorID); //用户删除自己所有博客
    boolean userUpdateArticle(Blog blog); //用户修改某个博客

    boolean makeArticleCommentIf(Integer state); //设置博客是否可以评论
    int updateLevel(@Param("blogNum") Integer blogNum,@Param("authorID") Long authorID); //更新用户等级(发布博客自动加经验升级)
    int selectBlogNum(Long authorID);

    Blog getOneArticle(Long blogID); //用户查看一个博客信息
    List<BlogComment> getOneArticleComments(Long BlogID); //获取当前博客评论
    List<SonComment> getOneArticleSonComments(Long blogID); //获取当前博客的所有二级评论
    int updateViews(Long blogId);
    List<Blog> getAllArticle(@Param("beginNum") Integer beginNum,@Param("endNum") Integer endNum);  //用户查看所有推荐博客，暂定5条一页
    Integer countBlogNums();   //首页获取所有文章数量
    List<Blog> getHotArticle();  //热门文章
}
