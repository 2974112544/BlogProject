package org.xsr.dao;

import org.xsr.entity.Community;

/**
 * @Author 谢胜荣
 * @Date 2020/10/28 11:05
 * @Version 1.0
 */
public interface UserTopicDao {
    //社区操作
    int userOpenTopic(Community community); // 申请开启一个话题
    int userDeleteTopic(Long communityID); //删除一个话题
}
