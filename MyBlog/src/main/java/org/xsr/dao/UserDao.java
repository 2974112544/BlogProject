package org.xsr.dao;

import org.apache.ibatis.annotations.Param;
import org.xsr.entity.Blog;
import org.xsr.entity.BlogComment;
import org.xsr.entity.Users;

import java.util.List;
import java.util.Map;

/**
 * @Author 谢胜荣
 * @Date 2020/10/23 17:21
 * @Version 1.0
 */
public interface UserDao {

    Users login(@Param("username") String username,@Param("password") String password);
    int register( Users user);
    int updateMess(Users user);
    int updateLoginDate(@Param("date") String date,@Param("userID") String userID);
    String registerCheck(String phone);

    //评论操作
    int createBlogComment(Object object);   //发布博客评论
    int createTopicComment(Object object);   //发布话题评论
    int deleteBlogComment(Object object);  //删除自己发表的评论
    int deleteTopicComment(Object object);
    int createBlogSonComment(Object object); //回复博客评论

    //获取所有自己文章的评论
    List<BlogComment>  getCommentsToMe(@Param("userID") Long userID,@Param("beginNum") Integer beginNum,@Param("endNum") Integer endNum);
    //公共操作
    int reportBlogComment(@Param("commentID") Long commentID,@Param("state") int state);  //举报博客评论
    int reportBlogSonComment(@Param("commentID") Long commentID,@Param("state") int state);  //举报博客二级评论
    int reportTopicComment(Object object);  //举报评论
    int reportBlog(Object object);  //举报博客
    int reportTopic(Object object);  //举报话题
    int updateComments(Long blogID);

    List<Blog> searchBlogs(@Param("keywords") String keywords,@Param("beginNum") Integer beginNum,@Param("endNum") Integer endNum);

    List<BlogComment> getMyCommets(@Param("userID") Long userID,@Param("beginNum") Integer beginNum,@Param("endNum") Integer endNum);
}
