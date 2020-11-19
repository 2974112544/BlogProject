package org.xsr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xsr.entity.Blog;
import org.xsr.entity.BlogComment;
import org.xsr.entity.CommunityComment;
import org.xsr.entity.SonComment;
import org.xsr.service.UserArticleService;
import org.xsr.service.UserService;
import org.xsr.service.UserTopicService;

/**
 * @Author 谢胜荣
 * @Date 2020/11/11 22:02
 * @Version 1.0
 */

/*
* 这个controller用于处理所有的评论操作
* */
@Controller
public class CommentController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserArticleService userArticleService;

    @Autowired
    private UserTopicService userTopicService;

    //Blog评论操作
    @RequestMapping(value = "/user/createBlogComment",method = RequestMethod.POST)
    @ResponseBody
    public String createBlogComment(BlogComment blogComment) {   //发布评论
        String comment = userService.createComment(blogComment);
        if(comment!=null){
            return comment;
        }
        return "fail";
    }
    //子评论
    @RequestMapping(value = "/user/createBlogCommentSon",method = RequestMethod.POST)
    @ResponseBody
    public String createBlogCommentSon(SonComment sonComment) {   //回复评论
        String  comment = userService.createComment(sonComment);
        if(comment!=null){
            return comment;
        }
        return "fail";
    }
    //Topic评论操作
    @RequestMapping(value = "/user/createTopicComment",method = RequestMethod.POST)
    public String createTopicComment(CommunityComment communityComment) {   //发布评论
        System.out.println(communityComment);
        String  comment = userService.createComment(communityComment);
        if(comment!=null){
            return "";
        }
        return null;
    }

}
