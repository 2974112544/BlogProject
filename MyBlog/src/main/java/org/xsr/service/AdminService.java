package org.xsr.service;

import org.springframework.stereotype.Service;
import org.xsr.entity.Blog;
import org.xsr.entity.Users;

import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/21 16:30
 * @Version 1.0
 *
 * 这个service 是用于管理员对博客和用户以及话题社区进行操作
 *
 */

public interface AdminService {



    //用户操作
     public boolean addAdmin(Users user); //新增一个管理
     /*public boolean deleteUser(Long userID); //删除一个用户
     public boolean updateUser(Users user); //修改用户信息
     public boolean makeUserCommentIf(Integer id,Integer unsealTime); //设置用户评论权限
     public boolean makeUserToAdmin(Integer phone,Integer id);   //将某个用户设置成管理员
     public boolean makeAdminToUser(Integer phone,Integer id);  //取消某个管理为用户
     public boolean updateUserLevel(Integer userId,Integer level); //人为更新用户等级*/



    /*//评论操作
     public void deleteBlogComment();  //删除博客中评论
     public void deleteTopicComment(); //删除话题中评论*/

    List<Blog> getAllSubmitBlog(Integer pageNum);   //获取所有待审核博客
    List<Blog> getAllReportBlog(Integer pageNum);   //获取所有被举报博客
}
