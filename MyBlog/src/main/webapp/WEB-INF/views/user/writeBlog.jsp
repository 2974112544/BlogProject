<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/11/1
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>用户中心</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/static/css/back.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resource/user/static/plugin/font-awesome/css/font-awesome.min.css">
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
                        <a href="${pageContext.request.contextPath}/user/getAllMyBlog?userID=${sessionScope.user.userID}&blogID=1">我的文章</a>
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
					<span class="layui-breadcrumb" lay-separator="/"> <a
                            href="/admin">首页</a> <a href="/admin/article">文章列表</a> <a><cite>添加文章</cite></a>
					</span>
            </blockquote>
            <form class="layui-form" method="post" id="myForm"
                  action="/admin/article/insertSubmit">

                <div class="layui-form-item">
                    <label class="layui-form-label">标题 <span
                            style="color: #FF5722;">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" name="articleTitle" lay-verify="title"
                               id="title" autocomplete="off" placeholder="请输入标题"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">内容 <span
                            style="color: #FF5722;">*</span></label>
                    <div class="layui-input-block">
							<textarea class="layui-textarea layui-hide" name="articleContent"
                                      lay-verify="content" id="content"></textarea>
                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">分类 <span
                            style="color: #FF5722;">*</span>
                    </label>
                    <div class="layui-input-inline">
                        <select name="articleParentCategoryId"
                                id="articleParentCategoryId"
                                lay-filter="articleParentCategoryId" required>
                            <option value="" selected="">一级分类</option>
                            <option value="1">Java</option>
                            <option value="10">计算机科学</option>
                            <option value="15">其他技术</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="articleChildCategoryId" id="articleChildCategoryId">
                            <option value="" selected>二级分类</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">标签</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="Java" value="1"> <input type="checkbox"
                                                              name="articleTagIds" lay-skin="primary" title="算法" value="2">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="数据结构" value="3"> <input type="checkbox"
                                                              name="articleTagIds" lay-skin="primary" title="C" value="4">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="操作系统" value="5"> <input type="checkbox"
                                                              name="articleTagIds" lay-skin="primary" title="计算机网络" value="6">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="面试题" value="8"> <input type="checkbox"
                                                             name="articleTagIds" lay-skin="primary" title="数据库" value="9">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="MySQL" value="10"> <input type="checkbox"
                                                                name="articleTagIds" lay-skin="primary" title="Spring"
                                                                value="11"> <input type="checkbox" name="articleTagIds"
                                                                                   lay-skin="primary" title="SpringMVC" value="12"> <input
                            type="checkbox" name="articleTagIds" lay-skin="primary"
                            title="MyBatis" value="13"> <input type="checkbox"
                                                               name="articleTagIds" lay-skin="primary" title="JVM" value="14">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="设计模式" value="15"> <input type="checkbox"
                                                               name="articleTagIds" lay-skin="primary" title="网络编程" value="16">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="IO" value="17"> <input type="checkbox"
                                                             name="articleTagIds" lay-skin="primary" title="JSP" value="18">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="Servlet" value="19"> <input type="checkbox"
                                                                  name="articleTagIds" lay-skin="primary" title="JavaWeb"
                                                                  value="20"> <input type="checkbox" name="articleTagIds"
                                                                                     lay-skin="primary" title="Hibernate" value="21"> <input
                            type="checkbox" name="articleTagIds" lay-skin="primary"
                            title="SQL" value="22"> <input type="checkbox"
                                                           name="articleTagIds" lay-skin="primary" title="Redis" value="24">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="SPA" value="25"> <input type="checkbox"
                                                              name="articleTagIds" lay-skin="primary" title="SpringCloud"
                                                              value="26"> <input type="checkbox" name="articleTagIds"
                                                                                 lay-skin="primary" title="Dubbo" value="27"> <input
                            type="checkbox" name="articleTagIds" lay-skin="primary"
                            title="EDAS" value="28"> <input type="checkbox"
                                                            name="articleTagIds" lay-skin="primary" title="MongoDB"
                                                            value="29"> <input type="checkbox" name="articleTagIds"
                                                                               lay-skin="primary" title="SpringBoot" value="31"> <input
                            type="checkbox" name="articleTagIds" lay-skin="primary"
                            title="ElasticSearch" value="32"> <input type="checkbox"
                                                                     name="articleTagIds" lay-skin="primary" title="Docker"
                                                                     value="33"> <input type="checkbox" name="articleTagIds"
                                                                                        lay-skin="primary" title="Jenkins" value="34"> <input
                            type="checkbox" name="articleTagIds" lay-skin="primary"
                            title="Vue" value="35"> <input type="checkbox"
                                                           name="articleTagIds" lay-skin="primary" title="IDEA" value="36">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary"
                               title="Shiro" value="37"> <input type="checkbox"
                                                                name="articleTagIds" lay-skin="primary" title="RocketMQ"
                                                                value="38">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    </div>
                </div>
                <blockquote class="layui-elem-quote layui-quote-nm">
                    温馨提示：<br> 1、文章内容的数据表字段类型为MEDIUMTEXT,每篇文章内容请不要超过500万字 <br>
                    2、写文章之前，请确保标签和分类存在，否则可以先新建；请勿刷新页面，博客不会自动保存 <br> 3、插入代码前，可以点击
                </blockquote>

            </form>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 这里展示一些提示性信息 <a href="#" target="_blank">其他导航</a> / <a href="#"
                                                                target="_blank">其他导航</a>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resource/user/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/user/static/plugin/layui/layui.all.js"></script>
<script src="${pageContext.request.contextPath}/resource/user/static/js/back.js"></script>
<script>
    layui.use([ 'form', 'layedit', 'laydate' ], function() {
            var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage : {
                    url : '/admin/upload/img' //接口url
                    ,
                    type : 'post' //默认post
                }
            });

            //创建一个编辑器
            var editIndex = layedit.build('content', {
                height : 350,
                tool : [ 'strong' //加粗
                    , 'italic' //斜体
                    , 'underline' //下划线
                    , 'del' //删除线
                    , '|' //分割线
                    , 'left' //左对齐
                    , 'center' //居中对齐
                    , 'right' //右对齐
                    , 'link' //超链接
                    , 'unlink' //清除链接
                    , 'face' //表情
                    , 'image' //插入图片
                    , 'code' ]
            });

            //自定义验证规则
            form.verify({
                title : function(value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                },
                pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
                content : function(value) {
                    layedit.sync(editIndex);
                }
            });



            layui.use('code', function() { //加载code模块
                layui.code();
            });

            //二级联动
            form.on("select(articleParentCategoryId)", function() {
                        var optionstring = "";
                        var articleParentCategoryId = $(
                            "#articleParentCategoryId")
                            .val();

                        if (articleParentCategoryId == 0) {
                            optionstring += "<option name='childCategory' value='1'>Java</option>";
                        }

                        if (articleParentCategoryId == 1) {
                            optionstring += "<option name='childCategory' value='2'>Java基础</option>";
                        }

                        if (articleParentCategoryId == 1) {
                            optionstring += "<option name='childCategory' value='3'>Core Java</option>";
                        }

                        if (articleParentCategoryId == 1) {
                            optionstring += "<option name='childCategory' value='4'>多线程并发编程</option>";
                        }

                        if (articleParentCategoryId == 1) {
                            optionstring += "<option name='childCategory' value='5'>Sockets和IO</option>";
                        }

                        if (articleParentCategoryId == 1) {
                            optionstring += "<option name='childCategory' value='6'>设计模式和反射</option>";
                        }

                        if (articleParentCategoryId == 1) {
                            optionstring += "<option name='childCategory' value='7'>JVM</option>";
                        }

                        if (articleParentCategoryId == 1) {
                            optionstring += "<option name='childCategory' value='8'>JavaWeb</option>";
                        }

                        if (articleParentCategoryId == 1) {
                            optionstring += "<option name='childCategory' value='9'>Java框架</option>";
                        }

                        if (articleParentCategoryId == 0) {
                            optionstring += "<option name='childCategory' value='10'>计算机科学</option>";
                        }

                        if (articleParentCategoryId == 10) {
                            optionstring += "<option name='childCategory' value='11'>数据结构和算法</option>";
                        }

                        if (articleParentCategoryId == 10) {
                            optionstring += "<option name='childCategory' value='12'>操作系统</option>";
                        }

                        if (articleParentCategoryId == 10) {
                            optionstring += "<option name='childCategory' value='13'>数据库</option>";
                        }

                        if (articleParentCategoryId == 10) {
                            optionstring += "<option name='childCategory' value='14'>计算机网络</option>";
                        }

                        if (articleParentCategoryId == 0) {
                            optionstring += "<option name='childCategory' value='15'>其他技术</option>";
                        }

                        if (articleParentCategoryId == 15) {
                            optionstring += "<option name='childCategory' value='16'>消息服务</option>";
                        }

                        if (articleParentCategoryId == 15) {
                            optionstring += "<option name='childCategory' value='17'>缓存服务</option>";
                        }

                        if (articleParentCategoryId == 100000000) {
                            optionstring += "<option name='childCategory' value='19'>Hello</option>";
                        }

                        if (articleParentCategoryId == 15) {
                            optionstring += "<option name='childCategory' value='100000003'>微服务</option>";
                        }

                        if (articleParentCategoryId == 15) {
                            optionstring += "<option name='childCategory' value='100000004'>搜索引擎</option>";
                        }

                        if (articleParentCategoryId == 15) {
                            optionstring += "<option name='childCategory' value='100000005'>权限框架</option>";
                        }

                        if (articleParentCategoryId == 15) {
                            optionstring += "<option name='childCategory' value='100000006'>开发利器</option>";
                        }

                        $("#articleChildCategoryId")
                            .html(
                                "<option value=''selected>二级分类</option>"
                                + optionstring);
                        form.render('select'); //这个很重要
                    })
            form.on('submit(demo1)', function(data){
                console.log(layedit.getContent(editIndex))
                console.log(layedit.getText(editIndex))
                var content = layedit.getText(editIndex);
                var articleView = content.replace(/<[^>]+>/g, "");
                console.log("articleVIew: "+articleView)
                $.ajax({
                    url:'${pageContext.request.contextPath}/user/createBlog',
                    type:'post',
                    data:{
                        "authorID":document.getElementById("userID").value,
                        "author":document.getElementById("userName").innerText,
                        "avatar":"resource/user/static/uploads/2017/10/20171006225356181.jpg",
                        "articleTitle":data.field.articleTitle,
                        "articleView":articleView,
                        "articleText":data.field.articleContent
                    },
                    success:function (res) {
                        console.log(res)
                    }
                })
                return false;
            });


        });
</script>

</body>
</html>