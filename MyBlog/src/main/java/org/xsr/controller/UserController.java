package org.xsr.controller;

import com.alibaba.druid.support.json.JSONUtils;
import org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.xsr.entity.*;
import org.xsr.service.UserArticleService;
import org.xsr.service.UserService;
import org.xsr.service.UserTopicService;
import org.xsr.util.MyDate;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Author 谢胜荣
 * @Date 2020/10/22 20:29
 * @Version 1.0
 */

/**
 * 这个controller用于处理用户操作
 */
@SessionAttributes({"user","oneArticle"})
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserArticleService userArticleService;

    @Autowired
    private UserTopicService userTopicService;

    /*用户搜索*/
    @RequestMapping(value = "/user/search",method = RequestMethod.POST,produces = {"text/html;charset=utf-8"})
    public String search(@RequestParam("keywords") String keywords,Integer pageNum,Model model){
        if(pageNum==null){
            pageNum = 1;
        }
        List<Blog> blogs = userService.searchBlogs(keywords,pageNum);
        model.addAttribute("searchBlogs",blogs);
        return "home/search";
    }

    /*用户选择修改一篇博客*/
    @RequestMapping(value = "/user/toUpdateBlog",method = RequestMethod.GET)
    public String userReadBlog(Long blogID,Model model){

        Blog oneArticle = userArticleService.getOneArticle(blogID);
        model.addAttribute("oneArticle",oneArticle);

        return "user/changeBlog";
    }
    /*修改回显*/
    @RequestMapping(value = "/user/getText",method = RequestMethod.POST,produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String getText(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Blog  oneArticle = (Blog)request.getSession().getAttribute("oneArticle");
        return oneArticle.getArticleText();
    }
    /*用户查看自己的评论*/
    @RequestMapping("/user/myComments")
    public String getComments(Long userID,Integer pageNum,Model model){
        if (pageNum == null){
            pageNum = 1;
        }
        List<BlogComment> myComments = userService.getMyComments(userID, pageNum);
        model.addAttribute("mycomments",myComments);
        model.addAttribute("pageNum",pageNum);
        return "user/myComments";
    }

    /*用户前往回复评论*/
    @RequestMapping("/user/toReplyComment")
    public String userToReplyComment(String comment,String commentID,String articleID,Model model){
        model.addAttribute("fatherComment",comment);
        model.addAttribute("fatherCommentID",commentID);
        model.addAttribute("articleID",articleID);
        return "user/replyComment";
    }
    /*用户前往删除评论*/
    @RequestMapping(value = "/user/deleteComment" ,method = RequestMethod.POST,produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String userDeleteComment(Long commentID,Integer type,Model model){
        boolean b = userService.deleteComment(commentID,type);
        if(b){
            return "success";
        }
        return "fail";
    }
    /*用户查看与我有关的评论*/
    @RequestMapping("/user/commentToMe")
    public String getCommentToMe(Long userID, Integer pageNum, Model model){
        if(pageNum == null){
            pageNum = 1;
        }
        List<BlogComment> commentsToMe = userService.getCommentsToMe(userID, pageNum);
        model.addAttribute("commentsToMe",commentsToMe);
        model.addAttribute("commentPageNum",pageNum);
        return "/user/commentToMe";
    }
    /*用户前往个人信息首页页面*/
    @RequestMapping("/user/toUserSelf")
    public String toUserSelf(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        if(request.getSession().getAttribute("user")==null){
            return "/user/login";
        }else{
            return "user/userself";
        }
    }
    /*用户前往发布一篇博客*/
    @RequestMapping(value = "/user/writeBlog",method = RequestMethod.GET)
    public String userWriteBlog(){
        return "user/writeBlog";
    }
    /*用户获取自己所有发布的博客*/
    @RequestMapping(value = "/user/getAllMyBlog",method = RequestMethod.GET)
    public String UserAllArticle(Integer pageNum,@RequestParam("userID") Long userID,Model model){
        if(pageNum == null){
            pageNum = 1;
        }
        List<Blog> myBlogs = userArticleService.userGetAllSelfArticle(userID,pageNum);
        model.addAttribute("myBlogs",myBlogs);
        model.addAttribute("pageNum",pageNum);
        return "user/myArticle";
    }
    /*用户退出登录*/
    @RequestMapping("/user/signOut")
    public String UserSignOut(SessionStatus status){

        status.setComplete();
        return "redirect:/";
    }
    /*更新个人信息*/
    @RequestMapping("/user/updateMess")
    @ResponseBody
    public String updateMessage(Users user,Model model){
        boolean flag = userService.updateMess(user);
        if(flag){
            model.addAttribute("user",user);
            return "success";
        }
        return "fail";
    }
    /*用户登录*/
    @RequestMapping(value = "/user/login",method = RequestMethod.POST)
    @ResponseBody
    public String login (@RequestParam("userName") String userName, @RequestParam("userPassword") String userPassword,Model model){
        Users user = userService.login(userName,userPassword);
        if (user.getUserID()!=0){
            //return "user/index";
            model.addAttribute("user",user);
            return  "success";
        }
        return "fail";
    }
    /*点击前往登录*/
    @RequestMapping(value = "user/toLogin",method = RequestMethod.GET)
    public String toLogin(){
        return "user/login";
    }

    /* 注册*/
    @RequestMapping(value = "/user/register",method = RequestMethod.POST)
    @ResponseBody
    public String register(Users user){
        boolean register = userService.register(user);
        if(register){
            System.out.println("注册成功,返回登录");
            return "success";
        }
        return "fail";
    }
    /*注册验证,注册时查看是否号码重复*/
    @RequestMapping(value = "user/registerCheck",method = RequestMethod.POST)
    @ResponseBody
    public String registerCheck(@RequestParam("phone") String phone){
        boolean flag = userService.registerCheck(phone);
        if(flag){
            return "success";
        }
        return "fail";
    }
    /*前往注册*/
    @RequestMapping("/user/toRegister")
    public String toRegister(){
        return "user/register";
    }

    /*上传头像*/
    @ResponseBody
    @RequestMapping("/user/UploadImg")
    public Map upload(@RequestParam(value = "file",required = false) MultipartFile file,@RequestParam("userID") String userID,
                      @RequestParam("phone") String phone, HttpServletRequest request){

        String prefix="";
        String dateStr="";
        //保存上传
        OutputStream out = null;
        InputStream fileInput=null;
        try{
            if(file!=null){
                String originalName = file.getOriginalFilename();
                prefix=originalName.substring(originalName.lastIndexOf(".")+1);  //类型
                String picName = userID+phone+"." + prefix;  //  图片名（id+phone，两个拼接，保证一个用户一张图片）
                String filepath = "D:\\ideaWorkSpace\\MyBlog\\src\\main\\webapp\\resource\\static\\avatar" +"\\"+picName;

                File files=new File(filepath);
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
                Map<String,Object> map2=new HashMap<>();
                Map<String,Object> map=new HashMap<>();
                map.put("code",0);
                map.put("msg","");
                map.put("data",map2);
                map2.put("src",request.getContextPath()+"/resource/static/avatar/"+ picName);
                return map;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(out!=null){
                    out.close();
                }
                if(fileInput!=null){
                    fileInput.close();
                }
            } catch (IOException e) {
            }
        }
        Map<String,Object> map=new HashMap<>();
        map.put("code",1);
        map.put("msg","");
        return map;

    }
}
