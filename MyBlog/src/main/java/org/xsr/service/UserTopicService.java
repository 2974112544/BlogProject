package org.xsr.service;

/**
 * @Author 谢胜荣
 * @Date 2020/10/22 20:48
 * @Version 1.0
 */

import org.springframework.stereotype.Service;
import org.xsr.entity.Community;

/**
 * 这个service用于用户操作话题部分
 */
public interface UserTopicService {

    //社区操作
    int useOpenTopic(Community community); // 申请开启一个话题
    int  userDeleteTopic(Long communityID); //删除一个话题

}
