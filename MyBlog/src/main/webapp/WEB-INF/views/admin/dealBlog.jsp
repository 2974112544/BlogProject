<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/11/13
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">

    <link rel="shortcut icon" href="img/logo.png">
    <title>管理信息</title>
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
            <a href="/admin" style="color: #009688;"> 管理操作界面 </a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/" target="_blank">首页</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/toUserSelf">个人页面</a></li>
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
                <li class="layui-nav-item layui-nav-itemed"><a class="" href="javascript:;">博客</a>
                    <dl class="layui-nav-child">
                        <%--<dd>
                         <a href="javaScript:void(0);">全部文章</a>
                        </dd>--%>
                        <dd>
                            <a href="${pageContext.request.contextPath}/admin/dealSubmitBlog">待审核博客</a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/admin/dealReportBlog">被举报博客</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;">评论</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/admin/dealReportComment">被举报评论</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:;">用户</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/admin/dealUsers">注册用户</a>
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
                            href="javascript:void(0)">管理</a> <a><cite>添审核文章</cite></a>
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
                            <th>作者</th>
                            <th>发布时间</th>
                            <th>操作</th>
                            <th>id</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${allSubmitBlog.size()==0}">
                            已经没有了哦
                        </c:if>
                        <c:forEach items="${allSubmitBlog}" var="item">
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
                                        <span style="color:#5FB878">${item.author}</span>
                                    </a></td>
                                <td>${item.releaseDate}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/user/toUpdateBlog?blogID=${item.articleID}" class="layui-btn layui-btn-mini">通过</a>
                                    <a href="javascript:void(0)" onclick="deleteArticle(${item.articleID})" class="layui-btn layui-btn-danger layui-btn-mini">驳回</a>
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
