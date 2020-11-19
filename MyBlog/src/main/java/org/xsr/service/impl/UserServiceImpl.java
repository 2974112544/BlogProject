package org.xsr.service.impl;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.xsr.dao.UserDao;
import org.xsr.entity.*;
import org.xsr.service.UserService;
import org.xsr.util.MyDate;
import org.xsr.util.MySessionFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/23 16:56
 * @Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    private UserDao userDaoMapper;

    private UserDao getUserDaoMapper(){
        InputStream inputStream = null;
        try {
            inputStream =Resources.getResourceAsStream("mybatisConfig.xml");
            SqlSession sqlSession = MySessionFactory.getInstance(inputStream).openSession(true);
            UserDao mapper = sqlSession.getMapper(UserDao.class);
            return mapper;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        finally {
            if(inputStream!=null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public Users login(String username, String password) {
        if(userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        Users user = userDaoMapper.login(username,password);
        if(user.getUserID()!=0){
            //修改登录时间
            int i = userDaoMapper.updateLoginDate(MyDate.getDateEndDay(),user.getUserID().toString());
            return user;
        }
        return user;
    }

    @Override
    public boolean register(Users user) {

        if(userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        int register = userDaoMapper.register(user);
        if(register>0){
            System.out.println("注册成功");
            return true;
        }
        return false;
    }

    @Override
    public boolean registerCheck(String phone) {
        if (userDaoMapper == null) {
            userDaoMapper = getUserDaoMapper();
        }
        String userID = userDaoMapper.registerCheck(phone);
        if(userID!=null){  //手机号重复
            return false;
        }
        return true;
    }

    @Override
    public boolean updateMess(Users user) {
        if(userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        int updateMess = userDaoMapper.updateMess(user);
        if(updateMess>0){
            return true;
        }
        return false;
    }

    @Override
    public String createComment(Object object) {  //发表评论
        if(userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        int count = 0;
        if(object.getClass().equals(BlogComment.class)){ //是博客
            BlogComment blog = (BlogComment) object;
            blog.setReleaseDate(MyDate.getDateEndMinutes());
            count = userDaoMapper.createBlogComment(blog);
            if(count>0){
                userDaoMapper.updateComments(blog.getBlogID());
                return blog.getReleaseDate();
            }
        }else if(object.getClass().equals(CommunityComment.class)){ //是话题
            CommunityComment communityComment = (CommunityComment)object;
            count = userDaoMapper.createTopicComment(communityComment);
            if(count>0){
                return communityComment.getReleaseDate();
            }
        }else if(object.getClass().equals(SonComment.class)){
            SonComment sonComment = (SonComment)object;
            sonComment.setReleaseDate(MyDate.getDateEndMinutes());
            count = userDaoMapper.createBlogSonComment(sonComment);
            if(count>0){
                userDaoMapper.updateComments(sonComment.getArticleID());
                return sonComment.getReleaseDate();
            }
        }
        return null;
    }

    @Override
    public boolean deleteComment(Long commentID,Integer type) {
        if(userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        int count = 0;
        if(type==0){
           count = userDaoMapper.deleteBlogComment(commentID);
        }else if (type==1){
            count = userDaoMapper.deleteTopicComment(commentID);
        }
        if(count>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean reportComment(Long commentID,int type,int state) {
        System.out.println(commentID+" "+type+" "+state);
        if (userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        int count = 0;
        if (type==0){  //博客评论
            count = userDaoMapper.reportBlogComment(commentID,state);
        }else if (type == 1){  //博客二级评论
            count = userDaoMapper.reportBlogSonComment(commentID,state);
        }
        if (count>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean reportBlog(Object object) {
        if (userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        int i = userDaoMapper.reportBlog(object);
        if(i>0){
            //修改成功
            return true;
        }
        return false;
    }

    @Override
    public boolean reportTopic(Object object) {
        if (userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        int i = userDaoMapper.reportTopic(object);
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public List<BlogComment> getCommentsToMe(Long userID, Integer pageNum) {
        if(userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        List<BlogComment> commentsToMe = userDaoMapper.getCommentsToMe(userID, (pageNum - 1) * 15, pageNum * 15);

        return commentsToMe;
    }

    @Override
    public List<Blog> searchBlogs(String keywords,Integer pageNum) {
        if(userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        List<Blog> blogs = userDaoMapper.searchBlogs(keywords,(pageNum-1)*7,pageNum*7);
        return blogs;
    }

    @Override
    public List<BlogComment> getMyComments(Long userID, Integer pageNum) {
        if(userDaoMapper == null){
            userDaoMapper = getUserDaoMapper();
        }
        List<BlogComment> myCommets = userDaoMapper.getMyCommets(userID, (pageNum - 1) * 15, pageNum * 15);
        return myCommets;
    }
}
