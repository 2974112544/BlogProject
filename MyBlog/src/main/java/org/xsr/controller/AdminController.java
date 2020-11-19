package org.xsr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xsr.entity.Blog;
import org.xsr.entity.Users;
import org.xsr.service.AdminArticleService;
import org.xsr.service.AdminService;
import org.xsr.service.AdminTopicService;

import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/28 16:23
 * @Version 1.0
 */
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;


    //用户操作
    @RequestMapping(value = "/admin/addAdmin",method = RequestMethod.POST)
    public void addAdmin(Users user){
        user.setAdmin(1);  //设置为管理
        boolean b = adminService.addAdmin(user);

    }
    /*public boolean deleteUser(Long userID); //删除一个用户
    public boolean makeUserCommentIf(Integer id,Integer unsealTime); //设置用户评论权限
    public boolean makeUserToAdmin(Integer phone,Integer id);   //将某个用户设置成管理员
    public boolean makeAdminToUser(Integer phone,Integer id);  //取消某个管理为用户
    public boolean updateUserLevel(Integer userId,Integer level); //人为更新用户等级



    //评论操作
    public void deleteBlogComment();  //删除博客中评论
    public void deleteTopicComment(); //删除话题中评论*/
    //审核博客
    @RequestMapping("/admin/dealSubmitBlog")
    public String adminDealSubmitBlog(Integer pageNum, Model model){
        if(pageNum == null){
            pageNum = 1;
        }
        List<Blog> allSubmitBlog = adminService.getAllSubmitBlog(pageNum);
        model.addAttribute("allSubmitBlog",allSubmitBlog);
        System.out.println(allSubmitBlog);
        return "admin/dealBlog";
    }
}
