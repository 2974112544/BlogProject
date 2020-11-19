package org.xsr.service.impl;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.xsr.dao.UserTopicDao;
import org.xsr.entity.Community;
import org.xsr.service.UserTopicService;
import org.xsr.util.MySessionFactory;

import java.io.IOException;
import java.io.InputStream;

/**
 * @Author 谢胜荣
 * @Date 2020/10/28 11:05
 * @Version 1.0
 */
@Service
public class UseTopicServiceImpl implements UserTopicService {
    private UserTopicDao userTopicDao;

    private UserTopicDao getUserTopicDao(){
        InputStream inputStream = null;
        try{
            inputStream = Resources.getResourceAsStream("mybatisConfig.xml");
            SqlSession sqlSession = MySessionFactory.getInstance(inputStream).openSession(true);
            UserTopicDao mapper = sqlSession.getMapper(UserTopicDao.class);
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
    public int useOpenTopic(Community community) {
        if (userTopicDao == null){
            userTopicDao = getUserTopicDao();
        }
        int i = userTopicDao.userOpenTopic(community);
        System.out.println(i);
        return i;
    }

    @Override
    public int userDeleteTopic(Long communityID) {
        if (userTopicDao == null){
            userTopicDao = getUserTopicDao();
        }
        int i = userTopicDao.userDeleteTopic(communityID);
        System.out.println(i);
        return i;
    }
}
