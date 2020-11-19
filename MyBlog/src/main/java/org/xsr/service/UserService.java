package org.xsr.service;

import org.springframework.stereotype.Service;
import org.xsr.entity.Blog;
import org.xsr.entity.BlogComment;
import org.xsr.entity.SonComment;
import org.xsr.entity.Users;

import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/12 19:37
 * @Version 1.0
 */

/**
 * 这个service 是用于普通用户操作自己功能
 */
public interface UserService {

    //用户操作
    Users login(String username,String password);  //用户登录
    boolean register(Users user);   //用户注册
    boolean updateMess(Users user);  //用户更新个人信息
    boolean registerCheck(String phone); //查看注册手机号是否重复

    //评论操作
    String createComment(Object object);   //发布评论
    boolean deleteComment(Long commentID,Integer type);  //删除自己发表的评论
    List<BlogComment> getCommentsToMe(Long userID,Integer pageNum);//获取所有自己文章的评论

    //公共操作
    boolean reportComment(Long commentID,int type,int state);  //举报评论
    boolean reportBlog(Object object);  //举报博客
    boolean reportTopic(Object object);  //举报话题

    //搜索
    List<Blog> searchBlogs(String keywords,Integer pageNum);

    List<BlogComment> getMyComments(Long userID, Integer pageNum);
}
