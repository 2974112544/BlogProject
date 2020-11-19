<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            -webkit-line-clamp: 3;
            text-overflow: ellipsis;
        }
    </style>
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
                    <c:if test="${sessionScope.user==null}">
                        <a href="${pageContext.request.contextPath}/user/toLogin" ><font color="red" >登录</font></a>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <a href="${pageContext.request.contextPath}/user/toUserSelf" ><font color="red" >个人中心</font></a>
                    </c:if>
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
                                            <li class="menu-item me nu-item-type-taxonomy menu-item-object-category">
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


    <!-body 主体-->
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


    <div id="content" class="site-content">
        <div id="primary" class="content-area common">
            <main id="main" class="site-main" role="main">

                <div class="sorting">
                    <ul>
                        <li class="order"><a href="javascript:void(0)" title="文章排序"><i class="be be-sort"></i></a></li>
                    </ul>
                    <ul class="order-box" style="display: none;">
                        <li><a href="createTime.html" rel="nofollow" title="按日期排序"><i class="be be-calendar2"></i></a></li>
                        <li><a href="commentSize.html" rel="nofollow" title="按评论排序"><i class="be be-speechbubble"></i></a></li>
                        <li><a href="viewSize.html" rel="nofollow" title="按浏览排序"><i class="be be-eye"></i></a></li>
                        <li><a href="likeSize.html" rel="nofollow" title="按点赞排序"><i class="be be-thumbs-up"></i></a></li>
                    </ul>
                </div>
                <div id="slideshow" class="wow fadeInUp" data-wow-delay="0.3s">
                    <div id="slider-home" class="slider-home"></div>
                    <div class="clear"></div>
                </div>

                <c:forEach items="${articles}" var="item">
                    <article class="wow fadeInUp post type-post status-publish format-standard has-post-thumbnail<%-- sticky--%>" data-wow-delay="0.3s">
                        <figure class="thumbnail page-thumbnail">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/resource/static/picture/1.jpg" alt="${item.articleTitle}">
                            </a>
                        </figure>
                        <header class="entry-header">
                            <h2 class="entry-title">
                                <a href="" rel="bookmark">${item.articleTitle} </a>
                            </h2>
                        </header>
                        <!-- .entry-header -->

                        <div class="entry-content">
                            <div class="archive-content">
                                <p class="article_text">${item.articleView}</p>
                            </div>
                            <div class="clear"></div>
                            <span class="entry-meta">
                                <span class="meta-author">
                                    <img src="${pageContext.request.contextPath}/resource/static/picture/author.gif" alt="avatar" class="avatar avatar-128" height="128" width="128">
                                    <span class="author-nick">${item.author} </span>
                                </span>
                                <span class="date">${item.releaseDate}</span>
                                <span class="views"><i class="be be-eye"></i> ${item.views}</span>
                                <span>
                                    <a href="1317668426088583168.html#respond" rel="external nofollow">
                                        <span class="no-comment"><i class="be be-speechbubble"></i>${item.commentNum}</span>
                                    </a>
                                </span>
                            </span>

                            <div class="clear"></div>
                        </div><!-- .entry-content -->
                        <span class="entry-more more-roll"><a href="${pageContext.request.contextPath}/user/readBlog?blogID=${item.articleID}" rel="bookmark">阅读全文</a></span>
                    </article>

                </c:forEach>

            </main><!-- .site-main -->


            <nav class="navigation pagination" role="navigation">
                <div class="nav-links">

                    <!-- 上一页 -->
                    <c:if test="${nums[1]>1}">
                        <a class="page-numbers prev" href="${pageContext.request.contextPath}/index?pageNum=${nums[1]-1}">
                            <i class="be be-arrowleft"></i>
                        </a>
                    </c:if>`
                    <!--首页-->
                    <a class='page-numbers current' href="${pageContext.request.contextPath}/index?pageNum=1">
                        首<span class="screen-reader-text"> 页</span>
                    </a>

                    <c:if test="${nums[0]==2}">
                        <a class='${nums[1]==1?'page-numbers current':'page-numbers'}' href="${pageContext.request.contextPath}/index?pageNum=1">
                           1
                        </a>
                        <a class="${nums[1]==2?'page-numbers current':'page-numbers' }" href="${pageContext.request.contextPath}/index?pageNum=2">
                           2
                        </a>
                    </c:if>
                    <c:if test="${nums[0]>2}">
                        <!-- 当前页数大于三 -->
                        <!-- 当前页面页数 -->
                        <a class='page-numbers current' href="${pageContext.request.contextPath}/index?pageNum=${nums[1]}" id="pageNum">
                            <label id="pageNumCount">${nums[1]}</label>
                        </a>
                        <span class="page-numbers dots">&hellip;</span>
                        <%--尾页--%>
                        <a class='page-numbers' href="${pageContext.request.contextPath}/index?pageNum=${nums[0]}">
                            ${nums[0]}
                        </a>
                    </c:if>

                    <!-- 最后一页 -->
                    <a class='page-numbers current' href="${pageContext.request.contextPath}/index?pageNum=${nums[0]}">
                         尾<span class="screen-reader-text"> 页</span>
                    </a>

                    <!-- 下一页 -->
                    <c:if test="${nums[0]>nums[1]}">
                        <a class='page-numbers next' href="${pageContext.request.contextPath}/index?pageNum=${nums[1]+1}">
                            <i class="be be-arrowright"></i>
                        </a>
                    </c:if>
                </div>

            </nav>


        </div><!-- .content-area -->

        <div id="sidebar" class="widget-area all-sidebar">
            <div class="wow fadeInUp" data-wow-delay="0.5s">
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
                                        <span
                                                class="arrow-s"><i class="be be-favorite"></i></span><span
                                            class="arrow-b"><i class="be be-favorite"></i></span></span>
                                        <img
                                                src="https://oss.liuyanzhao.com/assets/img/wechat.jpg"
                                                alt=" weixin"/></span><a title="微信"><i class="be be-weixin"></i></a></span>
                            </li>
                            <li class="tqq"><a target=blank rel="external nofollow"
                                               href=http://wpa.qq.com/msgrd?V=3&uin=847064370&Site=QQ&Menu=yes
                                               title="QQ在线"><i class="be be-qq"></i></a></li>
                            <li class="tsina"><a title=""
                                                 href="http://weibo.com/5936412667/profile?rightmod=1&wvr=6&mod=personinfo&is_all=1"
                                                 target="_blank" rel="external nofollow"><i
                                    class="iconfont icon-weibo"></i></a></li>
                            <li class="feed"><a title="" href="https://github.com/saysky" target="_blank"
                                                rel="external nofollow"><i class="iconfont icon-github"></i></a>
                            </li>
                        </ul>

                        <div class="about-inf">
                            <span class="about about-cn">文章<br>${countBlogNums}</span>
                            <span class="about about-pn">话题<br>0</span>
                            <span class="about about-cn">用户<br><span class="animateNum all-view" data-animatetype="num" data-animatetarget="10563">10563</span></span>
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
        </div>
        </div>


        <div class="clear"></div>
    </div><!-- .site-content -->
    <div class="clear"></div>

    <!--  友情链接  -->
    <div class="links-box">
        <div id="links">
            <ul class="lx7">
                <li class="link-f link-name wow fadeInUp" data-wow-delay="0.3s"><a href="javascript:;" target="_blank">GitHub</a></li>
            </ul>
            <ul class="lx7">
                <li class="link-f link-name wow fadeInUp" data-wow-delay="0.3s"><a href="javascript:;" target="_blank">CSDN</a></li>
            </ul>
            <ul class="lx7">
                <li class="link-f link-name wow fadeInUp" data-wow-delay="0.3s"><a href="javascript:;" target="_blank">阿里云活动</a></li>
            </ul>
            <ul class="lx7">
                <li class="link-f link-name wow fadeInUp" data-wow-delay="0.3s"><a href="javascript:;" target="_blank">腾讯云活动</a></li>
            </ul>
            <div class="clear"></div>
        </div>
    </div>

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

            <aside id="text-23" class="widget widget_text wow fadeInUp" data-wow-delay="0.3s"><h3 class="widget-title">
                <span class="s-icon"></span>关于开发者</h3>
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
<%--
                <br>
                基于 SpringBoot2.x + MyBatis + Redis + ES + Thymeleaf + Vue.js 实现 <br>
--%>
                <%--其博客网站已运行 <span id="run_time" style="color: #c40000;"></span> <br>--%>
            </div>
        </div><!-- .site-info -->
    </footer><!-- .site-footer -->


    <ul id="scroll">
        <li class="log log-no"><a class="log-button" title="文章目录"><i class="be be-menu"></i></a>
            <div class="log-prompt">
                <div class="log-arrow">文章目录<i class="be be-playarrow"></i></div>
            </div>
        </li>
        <li><a class="scroll-h" title="返回顶部"><i class="be be-arrowup"></i></a></li>
        <li><a class="scroll-b" title="转到底部"><i class="be be-arrowdown"></i></a></li>
        <li><a class="scroll-search" title="搜索"><i class="be be-search"></i></a></li>
        <li class="gb2-site"><a id="gb2big5"><span>繁</span></a></li>
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
        <div class="usbtn bk"><span>联</span><span>系</span><span>作</span><span>者</span></div>
        <div class="usmain-box">
            <div class="usmain bk">
                <div class="usbox usweixin"><img class="bk" title="微信咨询" alt="微信" src="${pageContext.request.contextPath}/resource/static/picture/wechat.jpg">
                    <p><i class="be be-weixin"></i>微信扫码</p></div>
                <div class="usbox usqq"><p><a href="javascript:;" title="QQ咨询" target="_blank" rel="external nofollow"><i class="be be-qq"></i>QQ咨询</a>
                </p></div>

                <div class="usbox usphone"><p><i class="be be-phone"></i>服务热线</p>
                    <p class="ustel">电话号码</p></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>

</div><!-- .site -->

<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/superfish-20200717.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/script-20200717.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/gb2big5-20200717.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/owl.carousel.min-20200717.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/jquery.share.min-20200717.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/sticky-1.6.0.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/jquery.lazyload-20200717.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/fancybox-20200717.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/resource/static/js/prettify-20200717.js'></script>
</body>
</html>
