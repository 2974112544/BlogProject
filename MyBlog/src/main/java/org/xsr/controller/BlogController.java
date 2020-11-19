package org.xsr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.xsr.entity.*;
import org.xsr.service.UserArticleService;
import org.xsr.service.UserService;
import org.xsr.service.UserTopicService;

import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/11/11 21:32
 * @Version 1.0
 */

/*
* 这个用来控制所有的文章操作
* */

@SessionAttributes({"articles","countBlogNums","hotArticle"})
@Controller
public class BlogController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserArticleService userArticleService;

    @Autowired
    private UserTopicService userTopicService;


    /*首页页面加载*/
    @RequestMapping(value = {"/index", "/"})
    public String getAllMess(Integer pageNum, Model model){  //首页加载获取推荐博客文章
        if(pageNum == null){
            pageNum = 1;
        }
        int countBlogNums = userArticleService.countBlogNums();  //获取博客总数
        List<Blog> allArticle = userArticleService.getAllArticle(pageNum); //一次获取pageNum*5条数据
        int allPages = userArticleService.countBlogNums()/5+1;  //总页数
        List<Blog> hotArticle = userArticleService.getHotArticle();
        int[] nums = {allPages,pageNum};
        model.addAttribute("articles",allArticle);
        model.addAttribute("nums",nums);
        model.addAttribute("countBlogNums",countBlogNums);
        model.addAttribute("hotArticle",hotArticle);
        return "/home/index";
    }

    /*查看详细文章*/
    @RequestMapping(value = "/user/readBlog",method = RequestMethod.GET)
    public String userReadBlog(Long blogID,Model model){

        Blog oneArticle = userArticleService.getOneArticle(blogID);
        List<BlogComment> oneArticleComments = userArticleService.getOneArticleComments(blogID);  //该文章一级评论
        List<SonComment> oneArticleSonComments = userArticleService.getOneArticleSonComments(blogID);  //二级评论
        model.addAttribute("oneArticle",oneArticle);
        model.addAttribute("firstComments",oneArticleComments);
        model.addAttribute("secondComments",oneArticleSonComments);

        return "/home/article";
    }

    /*发表博客*/
    @RequestMapping(value = "/user/createBlog" , method=RequestMethod.POST)
    @ResponseBody
    public String userCreateBlog(Blog blog){
        int i = userArticleService.userAddArticle(blog);
        if(i>0){
            return "success";
        }
        return "fail";
    }
    /*修改博客*/
    @RequestMapping(value = "/user/updateBlog" , method=RequestMethod.POST)
    @ResponseBody
    public String userupdateBlog(Blog blog){
        System.out.println(blog);
        boolean b = userArticleService.userUpdateArticle(blog);
        if(b){
            return "success";
        }
        return "fail";
    }


//
//    /*开启话题*/
//    @RequestMapping(value = "/user/createTopic" , method=RequestMethod.POST)
//    @ResponseBody
//    public String userCreateTopic(String blogText){
//        System.out.println(blogText);
//        return blogText;
//    }

    //公共操作
    @RequestMapping(value = "/user/reportBlogComment" ,method=RequestMethod.POST)
    @ResponseBody
    public String reportBlogComment(@RequestParam("commentID") Long commentID, @RequestParam("type") int type, @RequestParam("state") int state){//举报博客评论

        //应该改变评论状态，提交于管理员审核]
        boolean b = userService.reportComment(commentID,type,state);
        if(b){
            return "success";
        }
        return "fail";
    }
    @RequestMapping(value = "/user/reportTopicComment",method = RequestMethod.POST)
    public String reportTopicComment(@RequestParam("commentID") Long commentID,@RequestParam("blogID") Long blogID,@RequestParam("type") int type)        {//举报话题评论
        System.out.println();
        //应该改变评论状态，提交于管理员审核
        return "show";
    }
    @RequestMapping("/user/reportArticle")
    public String reportArticle(Blog blog){ //举报博客
        System.out.println(blog);
        //改变博客标识码，用于管理员复审
        userService.reportBlog(blog);
        return "";
    }
    public String reportTopic(Object object) { //举报话题
        System.out.println(object);
        //同理，改变话题的状态码
        userService.reportTopic(object);
        return "";
    }



}