package org.xsr.dao;

import org.apache.ibatis.annotations.Param;
import org.xsr.entity.Blog;
import org.xsr.entity.Users;

import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/28 20:57
 * @Version 1.0
 */
public interface AdminServiceDao {
    //待审核
    List<Blog> getAllSubmitBlog(@Param("beginNum") Integer beginNum, @Param("endNum") Integer endNum);
    //被举报
    List<Blog> getAllReportBlog(@Param("beginNum") Integer beginNum, @Param("endNum") Integer endNum);
}
