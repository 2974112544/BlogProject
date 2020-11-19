package org.xsr.service.impl;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.xsr.dao.UserArticleDao;
import org.xsr.entity.Blog;
import org.xsr.entity.BlogComment;
import org.xsr.entity.SonComment;
import org.xsr.service.UserArticleService;
import org.xsr.util.MyDate;
import org.xsr.util.MySessionFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/27 16:19
 * @Version 1.0
 */
@Service
public class UserArticleImpl implements UserArticleService {

    private UserArticleDao userArticleDao;

    private UserArticleDao getUserArticleDao(){
        InputStream inputStream = null;
        try{
            inputStream = Resources.getResourceAsStream("mybatisConfig.xml");
            SqlSession sqlSession = MySessionFactory.getInstance(inputStream).openSession(true);
            UserArticleDao mapper = sqlSession.getMapper(UserArticleDao.class);
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
    public List<Blog> userGetAllSelfArticle(Long authorID,Integer  pageNum) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        List<Blog> blogs = userArticleDao.userGetAllSelfArticle(authorID,(pageNum-1)*10,pageNum*10);
        return blogs;
    }

    @Override
    public int userAddArticle(Blog blog) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        blog.setReleaseDate(MyDate.getDateEndSecond());
        System.out.println(blog);
        int i = userArticleDao.userAddArticle(blog);
        return i;
    }

    @Override
    public boolean userDeleteArticle(Long blogID) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        boolean b = userArticleDao.userDeleteArticle(blogID);
        return b;
    }

    @Override
    public boolean userDeleteArticleAll(Long authorID) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        boolean b = userArticleDao.userDeleteArticleAll(authorID);
        return b;
    }

    @Override
    public boolean userUpdateArticle(Blog blog) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        boolean b = userArticleDao.userUpdateArticle(blog);
        return b;
    }

    @Override
    public boolean makeArticleCommentIf(Integer state) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        boolean b = userArticleDao.makeArticleCommentIf(state);
        return b;
    }

    @Override
    public int updateLevel(Integer blogNum,Long authorID) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        int i = userArticleDao.selectBlogNum( 2l);
        int i1 = userArticleDao.updateLevel(i, 2l);
        System.out.println(i1);
        return 0;
    }

    @Override
    public Blog getOneArticle(Long blogID) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        int i = updateViews(blogID);
        if(i>0){
            Blog oneArticle = userArticleDao.getOneArticle(blogID);
            return oneArticle;
        }
       return null;
    }

    @Override
    public List<BlogComment> getOneArticleComments(Long blogID) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        int i = updateViews(blogID);
        if(i>0){
            List<BlogComment> oneArticleComments = userArticleDao.getOneArticleComments(blogID);
            return oneArticleComments;
        }
        return null;
    }

    @Override
    public List<SonComment> getOneArticleSonComments(Long blogID) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        List<SonComment> oneArticleComments = userArticleDao.getOneArticleSonComments(blogID);
        if(oneArticleComments.size()!=0){
            return oneArticleComments;
        }
        return null;
    }

    @Override
    public int updateViews(Long blogID) {
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        int i = userArticleDao.updateViews(blogID);
        return i;
    }
    @Override
    public List<Blog> getAllArticle(Integer pageNum) {
        if(userArticleDao ==null){
            userArticleDao = getUserArticleDao();
        }
        List<Blog> allArticle = userArticleDao.getAllArticle((pageNum-1)*5,pageNum*5);
        return allArticle;
    }
    @Override
    public int countBlogNums(){
        if(userArticleDao == null){
            userArticleDao = getUserArticleDao();
        }
        return userArticleDao.countBlogNums();
    }

    @Override
    public List<Blog> getHotArticle() {
        if(userArticleDao ==null){
            userArticleDao = getUserArticleDao();
        }
        List<Blog> hotArticle = userArticleDao.getHotArticle();
        return hotArticle;
    }
}
