package org.xsr.service;

/**
 * @Author 谢胜荣
 * @Date 2020/10/22 19:55
 * @Version 1.0
 */

import org.springframework.stereotype.Service;

/**
 * 这个service用于管理操作话题模块
 */
public interface AdminTopicService {

    //社区操作
    public void openTopic(); // 通过开启一个话题
    public void deleteTopic(); //删除一个话题
    public void frozenTopic(); //冻结一个话题(用户只能看无法操作)
    public void UnsealTopic(); //解封一个话题(用户可以重新开始参与话题)
    public void closeCommunity(); //暂时关闭社区功能
    public void openCommunity(); //开启社区,有权限的用户可以开始发表话题
}
