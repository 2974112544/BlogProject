package org.xsr.util;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * @Author 谢胜荣
 * @Date 2020/10/24 15:48
 * @Version 1.0
 */
public class MySessionFactory {

    private static SqlSessionFactory sqlSessionFactory;

    public static synchronized SqlSessionFactory getInstance(InputStream inputStream){
        if(null == sqlSessionFactory){
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        }
        return sqlSessionFactory;
    }
}
