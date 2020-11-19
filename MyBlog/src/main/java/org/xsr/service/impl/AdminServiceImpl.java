package org.xsr.service.impl;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.xsr.dao.AdminServiceDao;
import org.xsr.dao.UserDao;
import org.xsr.entity.Blog;
import org.xsr.entity.Users;
import org.xsr.service.AdminService;
import org.xsr.util.MySessionFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/11/13 14:04
 * @Version 1.0
 */
@Service
public class AdminServiceImpl implements AdminService {
    private AdminServiceDao adminServiceDao;


    private AdminServiceDao getAdminServiceDao(){
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream("mybatisConfig.xml");
            SqlSession sqlSession = MySessionFactory.getInstance(inputStream).openSession(true);
            AdminServiceDao mapper = sqlSession.getMapper(AdminServiceDao.class);
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
    public boolean addAdmin(Users user) {
        return false;
    }

    @Override
    public List<Blog> getAllSubmitBlog(Integer pageNum) {
        if(adminServiceDao == null){
            adminServiceDao = getAdminServiceDao();
        }
        List<Blog> allSubmitBlog = adminServiceDao.getAllSubmitBlog((pageNum - 1) * 10, pageNum * 10);
        return allSubmitBlog;
    }

    @Override
    public List<Blog> getAllReportBlog(Integer pageNum) {
        return null;
    }
}
