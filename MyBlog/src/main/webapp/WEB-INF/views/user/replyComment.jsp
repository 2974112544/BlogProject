<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/11/12
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="img/logo.png">
    <title>博客后台 - 回复评论
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/css/back.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/user/static/plugin/font-awesome/css/font-awesome.min.css">
    <style>
        /*覆盖 layui*/

        .layui-btn {
            margin: 2px 0 !important;
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
              <a href="/admin/comment">评论列表</a>
              <a><cite>回复评论</cite></a>
        </span>
            </blockquote>
            <form class="layui-form"  method="post" id="myForm" action="/admin/comment/replySubmit">
                <input type="hidden" id="fatherCommentID" value="${fatherCommentID}">
                <input type="hidden" id="commentArticleId" value="${articleID}">
                <input type="hidden" id="replyAuthorID" value="${sessionScope.user.userID}">
                <input type="hidden" id="userAvatar" value="${sessionScope.user.avatar}">

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">原内容</label>
                    <div class="layui-input-block">
                        <textarea  class="layui-textarea" disabled>${fatherComment}</textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">我的昵称 </label>
                    <div class="layui-input-block">
                        <input type="text" id="commentAuthorName"  value="${sessionScope.user.userName}" class="layui-input">
                    </div>
                </div>
                <%--<div class="layui-form-item">
                    <label class="layui-form-label">我的邮箱 </label>
                    <div class="layui-input-block">
                        <input type="text" name="commentAuthorEmail"  value="${sessionScope.user.email}" class="layui-input">
                    </div>
                </div>--%>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">我的回复</label>
                    <div class="layui-input-block">
                        <textarea id="replyComment"  class="layui-textarea"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" type="button" onclick="reply();">回复</button>
                        <button type="reset" class="layui-btn layui-btn-primary" >重置</button>
                    </div>
                </div>

            </form>


        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>

<script>
    var referrer = document.referrer;

    function reply() {
        var replyComment = document.getElementById('replyComment').value  //回复
        if(replyComment==""||replyComment.length==0){
            alert('评论不能为空！')
            return ;
        }
        var src = document.getElementById("userAvatar").value;   //头像图片地址
        var blogID = document.getElementById("commentArticleId").value;  //当前博客id
        var authorID = document.getElementById("replyAuthorID").value;  //评论者id
        var author = document.getElementById("commentAuthorName").innerText;   //评论者姓名
        var fatherID = document.getElementById("fatherCommentID").value;  //回复的评论id
        $.ajax({
            url:'${pageContext.request.contextPath}/user/createBlogCommentSon',
            type:'post',
            data:{
                "articleID":blogID,
                "authorID":authorID,
                "author":author,
                "avatar":src,
                "commentText":replyComment,
                "articleType":0,
                "fatherID":fatherID
            },
            success:function (res) {
                document.getElementById("replyComment").value=""
                alert("回复成功")
                location.href = document.referrer;
            },
            error:function (res) {
                console.log(res)
            }
        })
    }

</script>

<script src="${pageContext.request.contextPath}/resource/user/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/user/static/plugin/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resource/user/static/js/back.js"></script>

</body>
</html>
