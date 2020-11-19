package org.xsr.service;

import org.springframework.stereotype.Service;
import org.xsr.entity.Blog;

import java.util.List;

/**
 * @Author 谢胜荣
 * @Date 2020/10/21 21:10
 * @Version 1.0
 */

/**
 * 这个service用于操作博客模块
 */
public interface AdminArticleService {

    // 博客操作
    default public List<Blog> getAllApplyArticle(Long authorID){return null;}  //获取所有申请发布的博客
    default public boolean passArticle(Long articleId){ return false;} //通过博客发布
    default public boolean notPassArticle(Long articleId){return false;} //不通过博客发布
    default public boolean deleteArticle(Long articleId){ return false;} //删除某个博客
    default public boolean updateArticle(){ return  false;} //通过修改某个博客
    default public List<Blog> queryAllArticle(){return null;}   //管理员界面展示所有通过的博客信息
    default public Blog queryArticleById(Long id){return null;}  //管理员根据id查询一个博客
    default public List<Blog> queryArticleByTitle(String title){return null;}  //管理根据标题查博客
}
