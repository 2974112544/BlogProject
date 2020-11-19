
<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/11/3
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">

    <link rel="shortcut icon" href="img/logo.png">
    <title>文章列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/css/back.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/user/static/plugin/font-awesome/css/font-awesome.min.css">
    <style>
        /*覆盖 layui*/
        .layui-input {
            display: inline-block;
            width: 33.333% !important;
        }

        .layui-input-block {
            margin: 0px 10px;
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
                            <a href="javaScript:void(0);">我的文章</a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/writeBlog">写文章</a>
                        </dd>
                    </dl></li>
                <li class="layui-nav-item"><a href="javascript:;">评论</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/commentToMe?userID=${sessionScope.user.userID}">回复我的</a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/myComments?userID=${sessionScope.user.userID}">我发表的</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <!-- 下面这里的内容是要重写的 -->
            <blockquote class="layui-elem-quote">
					<span class="layui-breadcrumb" lay-separator="/"> <a
                            href="javascript:void(0)">个人</a> <a><cite>添加文章</cite></a>
					</span>
            </blockquote>

            <div class="layui-tab layui-tab-card">
                <form id="articleForm" method="post">
                    <input type="hidden" name="currentUrl" id="currentUrl" value="">
                    <table class="layui-table">
                        <colgroup>
                            <col width="35%">
                            <col width="10%">
                            <col width="10%">
                            <col width="40">
                            <col width="40">
                            <col width="40">
                            <col width="40">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>所属分类</th>
                            <th>标签</th>
                            <th>状态</th>
                            <th>发布时间</th>
                            <th>操作</th>
                            <th>id</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${myBlogs}" var="item">
                            <tr>
                                <td>
                                    <a href="${pageContext.request.contextPath}/user/readBlog?blogID=${item.articleID}" target="_blank"> ${item.articleTitle}</a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" target="_blank">${item.beLong}</a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" target="_blank">${item.label}</a> &nbsp;
                                </td>
                                <td>
                                    <a href="javaScript:void(0)">
                                        <span style="color:${item.status==2?'#5FB878':'#FF5722'};">
                                                <c:if test="${item.status==0}">待审核</c:if>
                                                <c:if test="${item.status==1}">已退回</c:if>
                                                <c:if test="${item.status==2}">已发布</c:if>
                                                <c:if test="${item.status==3}">待处理</c:if>
                                        </span>
                                    </a></td>
                                <td>${item.releaseDate}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/user/toUpdateBlog?blogID=${item.articleID}" class="layui-btn layui-btn-mini">修改</a>
                                    <a href="javascript:void(0)" onclick="deleteArticle(${item.articleID})" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
                                </td>
                                <td>${item.articleID}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>

                <%--分页--%>
                <nav class="navigation pagination" role="navigation">
                    <div class="nav-links">

                        <!-- 上一页 -->
                        <c:if test="${pageNum>1}">   <%--超过一页--%>
                            <a class="page-numbers prev" href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=${pageNum-1}">
                                <i class="be be-arrowleft"></i>
                            </a>
                        </c:if>`
                        <!--首页-->
                        <a class='page-numbers current' href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=1">
                            首页</span>
                        </a>
                        <c:if test="${sessionScope.user.blogNum<=10}">
                            <a class='page-numbers current' href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=1">
                                1
                            </a>
                        </c:if>
                        <c:if test="${sessionScope.user.blogNum/10+1==2}">
                            <a class="${pageNum==1?'page-numbers current':'page-numbers'}" href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=1">
                                1
                            </a>
                            <a class="${pageNum==2?'page-numbers current':'page-numbers'} " href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=2">
                                2
                            </a>
                        </c:if>
                        <c:if test="${sessionScope.user.blogNum/10+1>3}">
                            <!-- 当前页数大于三 -->
                            <!-- 当前页面页数 -->
                            <a class='page-numbers current' href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=${pageNum}" id="pageNum">
                                <label id="pageNumCount">${pageNum}</label>
                            </a>
                            <c:if test="${sessionScope.user.blogNum-pageNum>2}">
                                <span class="page-numbers dots">&hellip;</span>
                            </c:if>

                            <%--尾页--%>
                            <a class='page-numbers' href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=${pageNum}">

                            </a>
                        </c:if>

                        <!-- 最后一页 -->
                        <a class='page-numbers current' href="${pageContext.request.contextPath}//user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=${nums[0]}">
                            尾页</span>
                        </a>

                        <!-- 下一页 -->
                        <c:if test="${nums[0]>nums[1]}">
                            <a class='page-numbers next' href="${pageContext.request.contextPath}//user/getAllMyBlog?userID=${sessionScope.user.userID}&pageNum=${nums[1]+1}">
                                <i class="be be-arrowright"></i>
                            </a>
                        </c:if>
                    </div>

                </nav>
            </div>
            <!-- 重写结束 -->

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
