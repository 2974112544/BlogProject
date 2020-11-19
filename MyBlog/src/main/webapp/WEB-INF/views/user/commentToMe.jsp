<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/11/12
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>博客后台 - 评论列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/css/back.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/user/static/plugin/font-awesome/css/font-awesome.min.css">
    <style>
        /*覆盖 layui*/
        .layui-table {
            margin-top: 0;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">

    <div class="layui-header">
        <div class="layui-logo">
            <a href="/admin" style="color: #009688;"> 用户个人页面 </a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/" target="_blank">首页</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${sessionScope.user.avatar}" class="layui-nav-img">
                    <label id="userName">${sessionScope.user.userName}</label> <input type="hidden" value="${sessionScope.user.userID}" id="userID">
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="${pageContext.request.contextPath}/user/toUserSelf">基本资料</a>
                    </dd>
                </dl></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/signOut">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed"><a class="" href="javascript:;">文章</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}">我的文章</a>
                        </dd>
                        <dd>
                            <a href="javascript:void(0)">写文章</a>
                        </dd>
                    </dl></li>
                <li class="layui-nav-item"><a href="javascript:;">评论</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/commentToMe">回复我的</a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/myComments">我发表的</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a><cite>评论列表</cite></a>
        </span>
            </blockquote>
            <div class="layui-tab layui-tab-card">
                <table class="layui-table" lay-even lay-skin="nob">
                    <colgroup>
                        <col width="15%">
                        <col width="50%">
                        <col width="10%">
                        <col width="20%">
                        <col width="5%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>作者</th>
                        <th>评论内容</th>
                        <th>回复至</th>
                        <th>提交于</th>
                        <th>ID</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${commentsToMe.size()==0}">
                        您已浏览完毕
                    </c:if>
                    <c:forEach items="${commentsToMe}" var="item">
                        <tr>
                            <td>
                                <img src="${item.avatar}" alt="" width="64px">
                                <strong>${item.author}</strong><br/>
                            <td class="dashboard-comment-wrap">
                                ${item.commentText}
                                <div class="row-actions">
                                     <span class="">
                                        <a href="${pageContext.request.contextPath}/user/toReplyComment?comment=${item.commentText}&commentID=${item.commentID}&articleID=${item.blogID}">
                                            回复
                                        </a>
                                     </span>
                                    <%--<span class=""> |
                                        <a href="">编辑</a>
                                     </span>--%>

                                </div>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/readBlog?blogID=${item.blogID}"
                                   target="_blank">点击查看</a>
                            </td>
                            <td>
                                ${item.releaseDate}</td>
                            <td>${item.commentID}</td>

                        </tr>
                    </c:forEach>


                    </tbody>

                </table>

                <div id="nav" style="">
                    <nav class="navigation pagination" role="navigation">
                        <div class="nav-links">

                            <c:if test="${commentPageNum!=1}">
                                <a class="page-numbers"
                                   href="${pageContext.request.contextPath}/user/commentToMe?userID=${sessionScope.user.userID}&pageNum=${commentPageNum-1}">
                                    <i class="be be-arrowleft"></i>
                                </a>
                            </c:if>

                            <a class="page-numbers current"> ${commentPageNum}</a>
                            <c:if test="${commentPageNum==1}">
                                <a class="page-numbers"
                                    href="${pageContext.request.contextPath}/user/commentToMe?userID=${sessionScope.user.userID}&pageNum=${commentPageNum+1}">
                                    <i class="layui-icon">&#xe602;</i>
                                </a>
                            </c:if>

                        </div>
                    </nav>
                </div>
            </div>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>

<script src="${pageContext.request.contextPath}/resource/user/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/user/static/plugin/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resource/user/static/js/back.js"></script>
</body>
</html>
