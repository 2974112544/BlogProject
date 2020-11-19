<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/11/2
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

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
                    <img title="微信" alt="微信" src="static/picture/wechat.jpg">
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
            <div class="usbox usweixin"><img class="bk" title="微信咨询" alt="微信" src="static/picture/wechat.jpg">
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