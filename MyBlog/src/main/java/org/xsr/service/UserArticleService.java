package org.xsr.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.xsr.entity.Blog;
import org.xsr.entity.BlogComment;
import org.xsr.entity.SonComment;

import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/21 21:10
 * @Version 1.0
 */

/**
 * 这个service用于用户操作博客模块
 */
public interface UserArticleService {


    // 博客操作
    List<Blog> userGetAllSelfArticle(Long authorID,Integer pageNum);   //用户登录成功后，自动获取个人所有博客信息

    int userAddArticle(Blog blog); //用户发布博客 提交审核
    boolean userDeleteArticle(Long blogID); //用户删除自己一个博客
    boolean userDeleteArticleAll(Long authorID); //用户删除自己所有博客
    boolean userUpdateArticle(Blog blog); //用户修改某个博客

    boolean makeArticleCommentIf(Integer state); //设置博客是否可以评论
    int updateLevel(@Param("blogNum") Integer blogNum,@Param("authorID") Long authorID); //更新用户等级(发布博客自动加经验升级)

    Blog getOneArticle(Long blogID); //用户查看一个博客信息
    List<BlogComment> getOneArticleComments(Long blogID); //获取当前博客评论
    List<SonComment> getOneArticleSonComments(Long blogID); //获取当前博客的所有二级评论
    int updateViews(Long blogID);
    List<Blog> getAllArticle(Integer pageNum);  //用户查看所有推荐博客，暂定5条一页
    int countBlogNums();    //获取当前所有文章信息
    List<Blog> getHotArticle();  //获取热评
}
