<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/11/2
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>Blog / Index</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!--<link rel="profile" href="http://gmpg.org/xfn/11">-->
    <link rel='stylesheet' href='${pageContext.request.contextPath}/resource/static/css/prettify-20200717.css' type='text/css' media='all'>
    <link rel='stylesheet' id='begin-style-css' href='${pageContext.request.contextPath}/resource/static/css/style-LTS.css' type='text/css' media='all'>
    <link rel='stylesheet' id='fonts-css' href='${pageContext.request.contextPath}/resource/static/css/fonts-20200717.css' type='text/css' media='all'>
    <link rel='stylesheet' id='iconfontd-css' href='${pageContext.request.contextPath}/resource/static/css/font_1449272_jaknu9yig2d-2020071.css' type='text/css' media='all'>
    <script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/jquery.min-1.10.1.js'></script>
    <link rel='stylesheet' id='highlight-css' href='${pageContext.request.contextPath}/resource/static/css/highlight-20200717.css' type='text/css' media='all'>
    <!--[if lt IE 9]
     <script type='text/javascript' src='https://oss.liuyanzhao.com/assets/js/html5.js?ver=20200717'></script>
    <![endif]-->

    <style>
        .article_text{
            overflow: hidden;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1;
            text-overflow: ellipsis;
            width: 100%;
        }
        #leftMenu {
            background: #CCCCCC; height: 225px; width:40%;
            position: fixed; left: 27%; top: 50%; border: 1px solid #666666; padding: 10px;
            z-index: 1;
        }
    </style>
    <script>

    //获取当前网址，如： http://localhost:8080/MyBlog_war_exploded/user/readBlog?blogID=2
        var curPath = window.document.location.href;
        //获取主机地址之后的目录，如： /MyBlog_war_exploded/user/readBlog
        var pathName = window.document.location.pathname;
        var pos = curPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8080
        var localhostPath = curPath.substring(0, pos);
        //获取带"/"的项目名，如：/yummy
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

        const basePath = localhostPath + projectName;
        function submitComment() {
            var comment = document.getElementById("comment").value;  //评论
            if(comment==""||comment.length==0){
                alert('评论不能为空！')
                return ;
            }
            var src = document.getElementById("commentAvatar").src;   //头像图片地址
            var blogID = document.getElementById("blogID").value;  //当前博客id
            var authorID = document.getElementById("userID").value;  //评论者id
            var author = document.getElementById("commentName").innerText;   //评论者姓名
            //var avatar = src.substring(basePath.length+1,src.length);
            $.ajax({
                url:'${pageContext.request.contextPath}/user/createBlogComment',
                type:'post',
                data:{
                    "blogID":blogID,
                    "authorID":authorID,
                    "author":author,
                    "avatar":src,
                    "commentText":comment
                },
                success:function (res) {
                    //插入成功，js拼写评论内容（异步刷新）
                    appendText(comment,src,blogID,author,authorID,res);
                    document.getElementById("comment").value=""
                },
                error:function (res) {
                    console.log(res)
                }
            })
        }
        function appendText(comment,src,blogID,author,authorID,res){
            var text = "<li class='comment fadeInUp'>" +
                "<div class='comment-body'> " +
                "<div class='comment-author vcard'> " +
                "<img class='avatar' src="+src+" alt='avatar'> " +
                "<a href='javascript:;' target='_blank'><strong>"+author+"</strong></a> " +
                "<span class='comment-meta commentmetadata'><br> " +
                "<span class='comment-aux'>"+res+"</span> " +
                "</span> " +
                "</div> " +
                "<p>"+comment+"</p> " +
                "</div> " +
                "<div id='anchor-2683'></div> " +
                "<ul class='children'> " +
                "</ul> " +
                "</li>";
            var commentFather = document.getElementById("commentFather");
            commentFather.innerHTML =text+ commentFather.innerHTML;
        }
    function reportComment(commentID) {
        $.ajax({
            url:'${pageContext.request.contextPath}/user/reportBlogComment',
            type:'post',
            data:{
                "commentID":commentID,
                "type":0,
                "state":0
            },
            //data:JSON.stringify(oneComment),
            success:function (res) {
                if(res == 'success'){
                    alert('已举报')
                }
                else{
                    alert("举报失败")
                }
            }
        })
    }
    function userReply(text,fatherID) {
        var userID = document.getElementById("userID");

        if(userID!=null){
            document.getElementById("beReply").value=text;
            document.getElementsByName("fatherCommentID").value=fatherID;  //设置隐藏的被回复的评论id
            document.getElementById('leftMenu').style.display='block';
        }else{
            alert('请先登录')
        }
    }
    function upSecondComment() {

        document.getElementById('leftMenu').style.display='none';
        var replyComment = document.getElementById('replyComment').value  //评论
        if(replyComment==""||replyComment.length==0){
            alert('评论不能为空！')
            return ;
        }
        var src = document.getElementById("commentAvatar").src;   //头像图片地址
        var blogID = document.getElementById("blogID").value;  //当前博客id
        var authorID = document.getElementById("userID").value;  //评论者id
        var author = document.getElementById("commentName").innerText;   //评论者姓名
        var fatherID = document.getElementsByName("fatherCommentID").value;
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
                //插入成功，js拼写评论内容（异步刷新）
                appendSonText(fatherID,replyComment,src,blogID,author,authorID,res);
                document.getElementById("replyComment").value=""
            },
            error:function (res) {
                console.log(res)
            }
        })
    }
    function appendSonText(fatherID,replyComment,src,blogID,author,authorID,res){
        var text = "<li class='comment fadeInUp'>" +
            "<div class='comment-body'> " +
            "<div class='comment-author vcard'> " +
            "<img class='avatar' src="+src+" alt='avatar'> " +
            "<a href='javascript:;' target='_blank'><strong>"+author+"</strong></a> " +
            "<span class='comment-meta commentmetadata'> <br> " +
            "<span class='comment-aux'>"+res+"</span> " +
            "</span> " +
            "</div> " +
            "<p>"+replyComment+"</p> " +
            "</div> " +
            "<div id='anchor-2683'></div> " +
            "<ul class='children'> " +
            "</ul> " +
            "</li>";
        var commentFather = document.getElementById(fatherID);
        console.log(fatherID)
        console.log(commentFather)
        commentFather.innerHTML =text+ commentFather.innerHTML;
    }
    function reportSonComment(commentID) {
        $.ajax({
            url:'${pageContext.request.contextPath}/user/reportBlogComment',
            type:'post',
            data:{
                "commentID":commentID,
                "type":1,
                "state":0
            },
            //data:JSON.stringify(oneComment),
            success:function (res) {
                if(res == 'success'){
                    alert('已举报')
                }
                else{
                    alert("举报失败")
                }
            }
        })
    }
    </script>
</head>

<body class="home blog custom-background archive" ontouchstart="">
<div id="page" class="hfeed site">
    <header id="masthead" class="site-header site-header-s">
        <div id="header-main-g" class="header-main-g">
            <nav id="header-top" class="header-top">
                <div class="nav-top">
                    <div id="user-profile">
                        <a href="my-service.html" style="color: #c40000;font-weight: bold;"></a>

                    </div>
                </div>
            </nav><!-- #top-header -->

            <div id="menu-container">
                <div style="float: right;margin-right: 100px;margin-top: 30px;color: red">
                    <a href="${pageContext.request.contextPath}/user/toLogin" ><font color="red" >登录</font></a>
                </div>
                <div id="navigation-top">
                    <span class="nav-search"></span>
                    <div class="logo-site">
                        <h1 class="site-title">
                            <a href="#" >
                                <span class="logo-small"><img src="${pageContext.request.contextPath}/resource/static/picture/blogPic.jpg" alt="博客社区"></span>博客社区</a>
                            <p><h4>用心提供分享</h4></p>
                        </h1>
                        <p class="site-description clear-small"></p>
                    </div>

                    <div id="site-nav-wrap">
                        <nav id="site-nav" class="main-nav">
                            <span id="navigation-toggle" class="bars"><i class="be be-menu"></i></span>
                            <div class="menu-mainmenu-container">
                                <ul id="menu-mainmenu" class="down-menu nav-menu">
                                    <li class="fa-coffee fa menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children">
                                        <a href="138.html">Java 开发</a>
                                        <ul class="sub-menu">
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="109.html">Java 基础</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="155.html">JavaWeb</a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="230.html">模板引擎</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="193.html">java 进阶</a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="229.html">Java 源码</a>
                                                    </li>
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="242.html">多线程并发编程</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="213.html">备战面试</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="243.html">工具类</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="245.html">技术架构</a>

                                            </li>
                                        </ul>
                                    </li>
                                    <li class="fa-coffee fa menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children">
                                        <a href="275.html">主流框架</a>
                                        <ul class="sub-menu">
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="271.html">微服务和分布式</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="280.html">安全框架</a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="281.html">Shiro</a>
                                                    </li>
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="282.html">Spring Security</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="288.html">消息中间件</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="292.html">Netty</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="65.html">开发利器</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="179.html">Spring 家族</a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="250.html">SpringBoot教程</a>
                                                    </li>
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="251.html">SpringCloud</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="228.html">ORM 框架</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="232.html">搜索引擎框架</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="233.html">缓存技术</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="244.html">第三方依赖</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="24.html">异常与报错</a>

                                            </li>
                                        </ul>
                                    </li>
                                    <li class="fa-coffee fa menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children">
                                        <a href="198.html">计算机科学</a>
                                        <ul class="sub-menu">
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="200.html">数据结构和算法</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="201.html">操作系统</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="202.html">数据库</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="203.html">计算机网络</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="246.html">编译原理</a>

                                            </li>
                                        </ul>
                                    </li>
                                    <li class="fa-coffee fa menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children">
                                        <a href="236.html">其他技术</a>
                                        <ul class="sub-menu">
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="63.html">PHP</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="85.html">网站建设</a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="86.html">服务器与主机</a>
                                                    </li>
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="89.html">网站优化</a>
                                                    </li>
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="10.html">WordPress</a>
                                                    </li>
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="15.html">Linux</a>
                                                    </li>
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="16.html">Apache/Nginx</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="237.html">C</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="241.html">前端框架和工具</a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                        <a href="286.html">vue</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="3.html">HTML/CSS</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="4.html">JavaScript/jQuery</a>

                                            </li>
                                        </ul>
                                    </li>
                                    <li class="fa-coffee fa menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children">
                                        <a href="276.html">资源共享</a>
                                        <ul class="sub-menu">
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="59.html">资源分享</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="110.html">上网百科</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="182.html">娱乐游戏</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="23.html">闲文与散文</a>

                                            </li>
                                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                                <a href="13.html">视频收藏</a>

                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div id="overlay"></div>
                        </nav>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </header><!-- #masthead -->


    <%--搜索部分--%>
    <div id="search-main">
        <div class="off-search wow fadeInRight animated" data-wow-delay="0.4s"></div>
        <div class="off-search-a"></div>
        <div class="search-wrap wow fadeInDown animated" data-wow-delay="0.4s">
            <div class="searchbar">
                <form method="post" id="searchform" action="${pageContext.request.contextPath}/user/search">
		                    <span class="search-input">
                                <input type="text" value="" name="keywords" id="s" placeholder="输入搜索内容" required="">
                                <button type="submit" id="searchsubmit"><i class="be be-search"></i></button>
                            </span>
                </form>
            </div>
            <div class="searchbar">
                <script>
                    function g(formname) {
                        var url = "https://www.baidu.com/baidu";
                        if (formname.s[1].checked) {
                            formname.ct.value = "2097152";
                        } else {
                            formname.ct.value = "0";
                        }
                        formname.action = url;
                        return true;
                    }
                </script>
                <form name="f1" onsubmit="return g(this)" target="_blank" action="https://www.baidu.com/baidu">
                                <span class="search-input">
                                <input name="word" class="swap_value" placeholder="输入百度站内搜索关键词">
                                <input name="tn" type="hidden" value="bds">
                                <input name="cl" type="hidden" value="3">
                                <input name="ct" type="hidden" value="2097152">
                                <input name="si" type="hidden" value="liuyanzhao.com">
                                <button type="submit" id="searchbaidu" class="search-close"><i class="be be-baidu"></i></button>
                                <input name="s" class="choose" type="radio">
                                <input name="s" class="choose" type="radio" checked="">
                                </span>
                </form>
            </div>

            <div class="clear"></div>
            <div class="clear"></div>
        </div>
        <div class="off-search-b">
            <div class="clear"></div>
        </div>
    </div>

    <%--body 主体--%>
    <nav class="bread">
        <div class="bull"><i class="be be-volumedown"></i></div>
        <div id="scrolldiv">
            <div class="scrolltext">
                <ul>
                    <li class="scrolltext-title">
                        <a href="files/my-service.html" rel="bookmark">本平台不用于任何商业用途</a>
                    </li>
                    <li class="scrolltext-title">
                        <a href="files/my-service.html" rel="bookmark">平台用于交流分享</a>
                    </li>
                </ul>
            </div>
        </div>
        <script type="text/javascript">$(document).ready(function () {
            $("#scrolldiv").textSlider({line: 1, speed: 300, timer: 4000});
        })</script>
    </nav>

    <div id="content" class="site-content" style="transform: none;">
        <div id="primary" class="content-area common">
            <main id="main" class="site-main" role="main">
                <%--正文--%>
                <article class="post type-post status-publish format-standard hentry category-data-structure-and-algorithm tag-168 tag-101 een">
                    <header class="entry-header">
                        <h1 class="entry-title">${oneArticle.articleTitle}</h1></header><!-- .entry-header -->
                    <input type="hidden" value="${oneArticle.articleID}" id="blogID">
                    <div class="entry-content">

                        <div class="begin-single-meta">
                                <span class="meta-author">
                                <img src="${oneArticle.avatar}" alt="avatar" class="avatar avatar-128" height="128" width="128">
                                ${oneArticle.author}
                                </span>
                            <span class="my-date"><i class="be be-schedule"></i>     ${oneArticle.releaseDate}</span>
                            <span class="baidu-r"></span>
                            <span class="views"><i class="be be-eye"></i>${oneArticle.views}</span>

                            <div class="tao-goods" style="text-align: center;">
                                <div class="brief">
                                    <span class="pricex"><strong></strong></span>
                                    <span class="pricey"><del></del></span>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <span class="s-hide"><span class="off-side"></span></span>
                        </div>

                        <div class="single-content" style="margin-bottom: 20px;" id="postContentDiv">
                            ${oneArticle.articleText}

                        </div>

                        <div class="clear"></div>

                        <footer class="single-footer">
                            <ul id="fontsize">
                                <li>A+</li>
                            </ul>
                            <div class="single-cat-tag">
                                <div class="single-cat">所属分类：
                                    <a href="javascript:;" rel="category tag">${oneArticle.label}</a>
                                </div>
                            </div>
                        </footer><!-- .entry-footer -->

                        <div class="clear"></div>
                    </div><!-- .entry-content -->

                </article><!-- #post -->
                <%--评论--%>
                <div class="scroll-comments"></div>

                <%--文章评论--%>
                <div id="comments" class="comments-area">

                    <div id="anchor-top">
                        <!--  登录状态    -->
                        <div id="respond" class="comment-respond wow fadeInUp" data-wow-delay="0.3s">
                            <h3 id="reply-title" class="comment-reply-title">
                                <span id="respond-title">发表评论</span>
                                <small>
                                    <a rel="nofollow" id="cancel-comment-reply-link" href="javascript:void(0)" style="display:none;">取消回复</a>
                                </small>
                            </h3>

                            <form action="" method="post" id="commentform">
                                <div class="user_avatar">
                                    <c:if test="${empty user}">
                                        <img src="${pageContext.request.contextPath}/resource/static/avatar/avatardefault.jpg" alt="avatar" class="avatar avatar-128" height="128" width="128">
                                        游客<br>
                                        <span style="color: #c40000;">您需要登录才能评论</span>
                                    </c:if>
                                    <c:if test="${!empty user}">
                                        <img src="${sessionScope.user.avatar}" alt="avatar" class="avatar avatar-128" height="128" width="128" id="commentAvatar">
                                        <label id="commentName"> ${sessionScope.user.userName} </label><br>
                                        <input type="hidden" value="${sessionScope.user.userID}" id="userID">
                                        <span style="color: #c40000;">欢迎，请文明评论</span>
                                    </c:if>
                                </div>

                                <p class="comment-form-comment">
                                    <textarea id="comment" name="comment" rows="4" tabindex="1" placeholder="文明评论..."></textarea>
                                </p><div id="loading" style="display: none;">
                                <span class="loading-spin"><i class="be be-loader"></i></span>
                                <span class="txt-etc">正在提交, 请稍候...</span>
                            </div>
                                <div id="error" style="display: none;">#</div>

                                <div class="clear"></div>
                                <p class="form-submit">
                                    <c:if  test="${empty user}">
                                        <input class="submit" style="cursor: not-allowed;" type="button" tabindex="5" value="提交评论(请先登录)" disabled=""> &nbsp;&nbsp;
                                        <%--<button type="button" id="qqLoginBtn" class="btn  btn-primary">QQ快速登录</button> &nbsp;&nbsp;--%>
                                        <a href="${pageContext.request.contextPath}/user/toLogin">账号登录</a>
                                    </c:if>
                                    <c:if test="${!empty user}">
                                        <input class="submit"  type="button" tabindex="5" value="提交评论" onclick="submitComment()"> &nbsp;&nbsp;
                                    </c:if>
                                </p>
                            </form>

                        </div>
                    </div>

                    <div class="comments-title wow fadeInUp ms bk"> 当前评论数: ${oneArticle.commentNum}</div>

                    <ol class="comment-list">
                        <div id="commentFather">
                            <!-- #comment-## -->
                            <c:forEach items="${firstComments}" var="item" >
                                <li class="comment fadeInUp" >
                                    <div  class="comment-body">
                                        <div class="comment-author vcard">
                                            <img class="avatar" src="${item.avatar}" alt="avatar">
                                            <a href="javascript:;" target="_blank"><strong>${item.author}</strong></a>
                                            <span class="comment-meta commentmetadata">
                                                <br/>
                                                <span class="comment-aux">${item.releaseDate}</span>
                                                <span class="comment-aux" style="float: right;">
                                                    <a href="javascript:void(0)" onclick = "userReply('${item.commentText}',${item.commentID});">回复</a>
                                                    <a href="javaScript:void(0);" onclick="reportComment(${item.commentID})">举报评论</a>
                                                </span>
                                            </span>
                                        </div>
                                        <p>${item.commentText}</p>
                                    </div>
                                    <div id="anchor-2683"></div>
                                        <%--子级评论--%>
                                    <ul class="children" id="${item.commentID}">
                                        <c:forEach items="${secondComments}" var="sonComment">
                                            <c:if test="${sonComment.fatherID==item.commentID}">
                                                <li class="comment fadeInUp">
                                                    <div  class="comment-body">
                                                        <div class="comment-author vcard">
                                                            <img class="avatar" src="${sonComment.avatar}" alt="avatar">
                                                            <a href="javascript:;" target="_blank"><strong>${sonComment.author}</strong></a>
                                                            <span class="comment-meta commentmetadata">
                                                <br/>
                                                <span class="comment-aux">${sonComment.releaseDate}</span>
                                                <span class="comment-aux" style="float: right;">
                                                   <a href="javaScript:void(0);" onclick="reportSonComment(${sonComment.commentID})">举报评论</a>
                                                </span>
                                            </span>
                                                        </div>
                                                        <p>${sonComment.commentText}</p>
                                                        <input type="hidden" value="${sonComment.commentID}" id="sonCommentID">
                                                    </div>
                                                </li>
                                            </c:if>

                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:forEach>
                            <%--回复评论--%>
                            <div id="leftMenu" style="display: none">
                                <br/>
                                <input type="hidden" name="fatherCommentID" value="" >
                                <input readonly  class="article_text" value="" id="beReply">
                                <textarea id="replyComment" name="comment" rows="4" tabindex="1" placeholder="文明回复..." style="width: 100%"></textarea>
                                <input type="button" onclick="upSecondComment();" value="hidden"/>
                            </div>
                        </div>
                    </ol><!-- .comment-list -->

                </div>
                <!-- #comments -->

                    <div class="clear"></div>
                </nav>
                    <nav class="navigation post-navigation" role="navigation">
                        <div class="nav-links">
                            <div class="nav-previous"><a href="${pageContext.request.contextPath}/" rel="prev"><span class="meta-nav-r" aria-hidden="true"><i class="be be-arrowleft"></i></span></a>
                            </div>

                        </div>
                    </nav>
                <!-- 引用 -->

                <div class="scroll-comments"></div>

                <!-- #comments -->
                <nav class="navigation pagination" role="navigation">
                    <h2 class="screen-reader-text">评论导航</h2>
                    <div class="nav-links">
                        <!-- 上一页 -->
                        <a class='page-numbers current' href="javascript:;">
                            <span class="screen-reader-text">第 </span>1<span class="screen-reader-text"> 页</span>
                        </a>
                        <!-- 当前页面小于等于4 -->
                        <a class='page-numbers' href="javascript:;">
                            <span class="screen-reader-text">第 </span>2<span class="screen-reader-text"> 页</span>
                        </a><a class='page-numbers' href="javascript:;">
                        <span class="screen-reader-text">第 </span>3<span class="screen-reader-text"> 页</span>
                    </a><a class='page-numbers' href="javascript:;">
                        <span class="screen-reader-text">第 </span>4<span class="screen-reader-text"> 页</span>
                    </a><a class='page-numbers' href="javascript:;">
                        <span class="screen-reader-text">第 </span>5<span class="screen-reader-text"> 页</span>
                    </a>

                        <span class="page-numbers dots">&hellip;</span>
                        <!-- 最后一页与当前页面之差，小于等于3 -->
                        <!-- 最后一页 -->
                        <a class='page-numbers' href="javascript:;">
                            <span class="screen-reader-text">第 </span>25<span class="screen-reader-text"> 页</span>
                        </a>
                        <!-- 下一页 -->
                        <a class='page-numbers next' href="javascript:;">
                            <i class="be be-arrowright"></i>
                        </a>
                    </div>
                </nav>
            </main>
        </div><!-- .content-area -->

        <div id="sidebar" class="widget-area all-sidebar" style="position: relative; overflow: visible; box-sizing: border-box; min-height: 4693px;">

            <div class="theiaStickySidebar" style="padding-top: 0px; padding-bottom: 1px; position: absolute; transform: translateY(3722px); width: 320.887px; top: 0px;"><div class="wow fadeInUp" data-wow-delay="0.5s">
                <aside id="about-5" class="widget about wow fadeInUp" data-wow-delay="0.3s"><h3 class="widget-title">
                    <span class="title-i"><span></span><span></span><span></span><span></span></span>关于本站</h3>
                    <div id="feed_widget">
                        <div class="feed-about">
                            <div class="author-back"><img src="${pageContext.request.contextPath}/resource/static/picture/Vlw7B6.jpg" alt="背景图">
                            </div>
                            <div class="about-main">
                                <div class="about-img">
                                    <img src="${pageContext.request.contextPath}/resource/static/picture/avatar.png" alt="name">
                                </div>
                                <div class="clear"></div>
                                <div class="about-name">网站宗旨</div>
                                <div class="about-the">共赢社区，提供一个平台记录自己，也提供一个平台供于学习交流。欢迎各位用户使用，可以共同进步</div>
                            </div>
                            <div class="clear"></div>

                            <ul>
                                <li class="tqq">
                                    <span class="weixin-b"><span class="weixin-qr"><span class="weixin-arrow">
                                        <span class="arrow-s"><i class="be be-favorite"></i></span><span class="arrow-b"><i class="be be-favorite"></i></span></span>
                                        <img src="https://oss.liuyanzhao.com/assets/img/wechat.jpg" alt=" weixin"></span><a title="微信"><i class="be be-weixin"></i></a></span>
                                </li>
                                <li class="tqq"><a target="blank" rel="external nofollow" href="http://wpa.qq.com/msgrd?V=3&amp;uin=847064370&amp;Site=QQ&amp;Menu=yes" title="QQ在线"><i class="be be-qq"></i></a></li>
                                <li class="tsina"><a title="" href="http://weibo.com/5936412667/profile?rightmod=1&amp;wvr=6&amp;mod=personinfo&amp;is_all=1" target="_blank" rel="external nofollow"><i class="iconfont icon-weibo"></i></a></li>
                                <li class="feed"><a title="" href="https://github.com/saysky" target="_blank" rel="external nofollow"><i class="iconfont icon-github"></i></a>
                                </li>
                            </ul>


                            <div class="about-inf">
                                <span class="about about-cn">文章<br>${sessionScope.countBlogNums}</span>
                                <span class="about about-pn">话题<br>0</span>
                                <span class="about about-cn">访客<br><span class="animateNum" data-animatetype="num" data-animatetarget="10563" style="">10563</span></span>
                            </div>
                        </div>
                    </div>

                    <div class="clear"></div>
                </aside>

                <!--   热门文章  -->
                <aside id="hot_comment-5" class="widget hot_comment wow fadeInUp" data-wow-delay="0.3s">
                    <h3 class="widget-title"><span class="title-i"><span></span><span></span><span></span><span></span></span>热评文章
                    </h3>
                    <div class="new_cat">
                        <ul>
                            <c:forEach items="${sessionScope.hotArticle}" var="item">
                                <li>
                                <span class="thumbnail">
                                    <a href="${pageContext.request.contextPath}/user/readBlog?blogID=${item.articleID}">
                                        <img src="${pageContext.request.contextPath}/resource/static/picture/java-2.jpg" alt="${item.articleTitle}">
                                    </a>
                                </span>
                                    <span class="new-title">
                                            <a href="#" rel="bookmark">${item.articleTitle}</a>
                                        </span>
                                    <span class="date">${item.releaseDate} </span>
                                    <span class="discuss"><i class="be be-eye"></i> 热度${item.views+item.commentNum}</span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="clear"></div>
                </aside>
            </div></div></div>


        <div class="clear"></div>
    </div><!-- .site-content -->
    <div class="clear"></div>

    <div id="footer-widget-box" class="site-footer">
        <div class="footer-widget">
            <aside id="text-22" class="widget widget_text wow fadeInUp" data-wow-delay="0.3s">
                <h3 class="widget-title">
                    <span class="s-icon"></span>勤有功，戏无益</h3>
                <div class="textwidget">
                    <ul class="menu">
                        <li>
                            <a target="_blank" href="message.html" rel="noopener noreferrer">
                                <i class="fa-commenting fa"></i>
                                <span class="font-text">留言板</span>
                            </a>
                        </li>
                        <li>
                            <a target="_blank" href="readerRank.html" rel="noopener noreferrer">
                                <i class="fa-newspaper-o fa"></i>
                                <span class="font-text">读者排行</span>
                            </a>
                        </li>
                        <li>
                            <a target="_blank" href="applyLink.html" rel="noopener noreferrer">
                                <i class="fa-link fa"></i>
                                <span class="font-text">申请友链</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="clear"></div>
            </aside>

            <aside id="text-23" class="widget widget_text wow fadeInUp" data-wow-delay="0.3s">
                <h3 class="widget-title"><span class="s-icon"></span>关于开发者</h3>
                <div class="textwidget"><p style="text-indent: 2em;">
                    开发者是即将毕业的学生，如有不足或意见可以联系本人。</p>
                    <p style="text-indent: 2em;">QQ：qq号码 </p></div>
                <div class="clear"></div>
            </aside>

            <aside id="text-24" class="widget widget_text wow fadeInUp" data-wow-delay="0.3s">
                <h3 class="widget-title">
                    <span class="s-icon"></span>捐赠与支持</h3>
                <div class="textwidget">
                    <div style="float:right;width:35%;">
                        <img src="${pageContext.request.contextPath}/resource/static/picture/wechat.jpg">
                    </div>
                    <div style="margin-right:35%;padding-right:5px;">
                        <p>如果这个产品对你有帮助，或者觉得开发者值得鼓励，可以打赏</p>
                        <div>

                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </aside>
            <div class="clear"></div>
        </div>
    </div>


    <footer id="colophon" class="site-footer" role="contentinfo">
        <div class="site-info">

            <div class="add-info">
                本项目前端模板借鉴 @言曌博客
                <a href="javascript:;" target="_blank" rel="bookmark">GitHub上开源项目，如有不当请联系</a>
                <br>
                基于 Spring，SpringMVC，mybatis，mysql实现 <br>
                <%--其博客网站已运行 <span id="run_time" style="color: #c40000;"></span> <br>--%>
            </div>
        </div><!-- .site-info -->
    </footer><!-- .site-footer -->


    <ul id="scroll">
        <li class="log log-no"><a class="log-button" title="文章目录"><i class="be be-menu"></i></a>
            <div class="log-prompt" style="display: none;">
                <div class="log-arrow">文章目录<i class="be be-playarrow"></i></div>
            </div>
        </li>
        <li><a class="scroll-h" title="返回顶部"><i class="be be-arrowup"></i></a></li>
        <li><a class="scroll-b" title="转到底部"><i class="be be-arrowdown"></i></a></li>
        <li><a class="scroll-search" title="搜索"><i class="be be-search"></i></a></li>
        <li class="gb2-site"><a id="gb2big5" href="javascript:StranBody()" title="绻鐖綋"><span>繁</span></a></li>
        <li class="qqonline">
            <div class="online">
                <a href="javascript:void(0)"><i class="be be-qq"></i></a>
            </div>
            <div class="qqonline-box">
                <div class="qqonline-main">
                    <div class="nline-wiexin">
                        <h4>微信</h4>
                        <img title="微信" alt="微信" src="${pageContext.request.contextPath}/resource/static/picture/wechat.jpg">
                    </div>
                    <div class="nline-qq">
                        <h4>在线咨询</h4>
                        <a target="_blank" href="javascript:;" title="QQ在线咨询" rel="external nofollow"><i class="be be-qq"></i></a>
                    </div>
                    <div class="clear"></div>
                    <div class="nline-phone">
                        <i class="be be-favoriteoutline"></i>选择一种方式联系我们！
                    </div>
                </div>
                <span class="qq-arrow"><span class="arrow arrow-y"><i class="be be-playarrow"></i></span><span class="arrow arrow-x"><i class="be be-playarrow"></i></span></span>
            </div>
        </li>
        <script type="text/javascript">$(document).ready(function () {
            if (!+[1,]) {
                present = "table";
            } else {
                present = "canvas";
            }
            $('#output').qrcode({render: present, text: window.location.href, width: "150", height: "150"});
        });</script>
    </ul>
    <div class="contactus " style="right: -160px;">
        <div class="usbtn bk"><span>联</span><span>系</span><span>博</span><span>主</span></div>
        <div class="usmain-box">
            <div class="usmain bk">
                <div class="usbox usweixin"><img class="bk" title="微信咨询" alt="微信" src="${pageContext.request.contextPath}/resource/static/picture/wechat.jpg">
                    <p><i class="be be-weixin"></i>微信扫码</p></div>
                <div class="usbox usqq"><p><a href="javascript:;" title="QQ咨询" target="_blank" rel="external nofollow"><i class="be be-qq"></i>QQ咨询</a>
                </p></div>
                <div class="usbox usphone"><p><i class="be be-phone"></i>服务热线</p>
                    <p class="ustel">15779216424</p></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>

</div><!-- .site -->

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/superfish-20200717.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/script-20200717.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/gb2big5-20200717.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/owl.carousel.min-20200717.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/jquery.share.min-20200717.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/sticky-1.6.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/jquery.lazyload-20200717.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/fancybox-20200717.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/static/js/prettify-20200717.js"></script>

</body>
</html>
