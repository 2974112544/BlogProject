<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/11/1
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">

    <link rel="shortcut icon" href="img/logo.png">
    <title>
        博客后台- 基本信息列表
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/css/back.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/user/static/plugin/font-awesome/css/font-awesome.min.css">
    <style>
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
            <c:if test="${sessionScope.user.admin==2}">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/dealSubmitBlog">管理</a></li>
            </c:if>
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
                            <a href="${pageContext.request.contextPath}/user/writeBlog">写文章</a>
                        </dd>
                    </dl></li>
                <li class="layui-nav-item"><a href="javascript:;">评论</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/commentToMe?userID=${sessionScope.user.userID}&pageNum=1">回复我的</a>
                        </dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/user/myComments?userID=${sessionScope.user.userID}&pageNum=1">我发表的</a>
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
          <a href="javaScript:void(0)">用户</a>
          <a><cite>基本信息</cite></a>
        </span>
            </blockquote>
            <form class="layui-form" action="/admin/options/editSubmit" method="post">
                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                    <ul class="layui-tab-title">
                        <li>小工具</li>
                    </ul>
                    <div class="layui-tab-content">
                        <br><br>
                        <input type="hidden" name="optionId" value="1">
                        <div class="layui-tab-item layui-show">
                            <div class="layui-form-item">
                                <label class="layui-form-label">头像</label>
                                <div class="layui-input-inline">
                                    <div class="layui-upload">
                                        <div class="layui-upload-list" style="">
                                            <img class="layui-upload-img" src="${sessionScope.user.avatar}" id="demo1" width="100" height="100">
                                            <p id="demoText"></p>
                                        </div>
                                        <button type="button" class="layui-btn" id="test1" >上传图片</button><%--onclick="userUploadImg();"--%>
                                        <input type="hidden" id="image" name="image" value="">
                                    </div>
                                </div>
                                <div class="layui-form-mid layui-word-aux">建议 150px*150px</div>

                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">昵称</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="changeName"   value="${sessionScope.user.userName}"   autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">年龄</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="userAge"   value="${sessionScope.user.age}"   autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">性别</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="sex" value="男" title="男" ${sessionScope.user.sex=="男"?"checked=''":""}><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>男</div></div>
                                        <input type="radio" name="sex" value="女" title="女" ${sessionScope.user.sex=="女"?"checked=''":""}><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>女</div></div>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="pswd"   value="${sessionScope.user.userPassword}"   autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">电话</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="phone"   value="${sessionScope.user.phone}"   autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">Email</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="email"   value="${sessionScope.user.email}"   autocomplete="off" class="layui-input">
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" type="button" onclick="UpdateUser();">保存设置</button>
                    </div>
                </div>
            </form>




        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>

<script src="${pageContext.request.contextPath}/resource/user/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/user/static/plugin/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resource/user/static/js/back.js"></script>
<script>
    //上传头像
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '${pageContext.request.contextPath}/user/UploadImg'
            , accept: 'file'
            , size: 50000
            ,data: {
                "userID":document.getElementById("userID").value,
                "phone":document.getElementById("phone").value
            }
            , before: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result);
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                var demoText = $('#demoText');
                demoText.html('<span style="color: #4cae4c;">上传成功</span>');

                var fileupload = $("#image");
                fileupload.attr("value", res.data.src);
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });


</script>
<script>
    function UpdateUser() {
        $.ajax({
            url:'${pageContext.request.contextPath}/user/updateMess',
            type:'post',
            data:{
                "userID":document.getElementById("userID").value,
                "avatar":document.getElementById("image").value,
                "userName":document.getElementById("changeName").value,
                "age":document.getElementById("userAge").value,
                "sex":$("input[type='radio']:checked").val(),
                "userPassword":document.getElementsByName("pswd")[0].value,
                "phone":document.getElementById("phone").value,
                "email":document.getElementById("email").value
            },
            success:function(res){
                if(res == "success"){
                    location.reload();
                }else{
                    alert("修改失败")
                }
            }
        })
    }

</script>

</body>
</html>
