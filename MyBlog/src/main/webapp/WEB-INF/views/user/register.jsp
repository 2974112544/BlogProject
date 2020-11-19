<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/10/30
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>运营系统登录页</title>

    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/jquery/1.9.1/jquery.min.js"></script>
    <%-- <script src="static/js/verificationNumbers.js" tppabs="static/js/verificationNumbers.js" charset="UTF-8"></script>--%>
    <style>
        .J_codeimg{z-index:-1;position:absolute;}
    </style>
    <script>
        $(document).ready(function() {
            //验证码
            createCode();
        });
        function showCheck(a){
            var c = document.getElementById("myCanvas");
            var ctx = c.getContext("2d");
            ctx.clearRect(0,0,1000,1000);
            ctx.font = "80px 'Microsoft Yahei'";
            ctx.fillText(a,0,100);
            ctx.fillStyle = "rgba(255,255,255,.9)";
        }
        var code ;
        function createCode(){
            code = "";
            var codeLength = 4;
            var selectChar = new Array(1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','j','k','l','m','n','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
            for(var i=0;i<codeLength;i++) {
                var charIndex = Math.floor(Math.random()*60);
                code +=selectChar[charIndex];
            }
            if(code.length != codeLength){
                createCode();
            }
            showCheck(code);
        }
        //验证验证码是否一致
        function validate () {
            var inputCode = document.getElementById("J_codetext").value.toUpperCase();
            var codeToUp=code.toUpperCase();
            if(inputCode.length <=0) {
                document.getElementById("J_codetext").setAttribute("placeholder","输入验证码");
                createCode();
                return false;
            }
            else if(inputCode != codeToUp ){
                document.getElementById("J_codetext").value="";
                document.getElementById("J_codetext").setAttribute("placeholder","验证码错误");
                createCode();
                return false;
            }
            else {
                document.getElementById("J_codetext").value="";
                createCode();
                return true;
            }
        }
        function register() {
            var check = validate();
            if(check){
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                var phone = document.getElementById("phone").value;
                var email = document.getElementById("email").value;
                var sex = document.getElementById("sex").value;
                var age = document.getElementById("age").value;
                console.log(username+"-"+password+"-"+phone+"-"+email+"-"+sex)
                var array=[username,password,phone,email,sex,age];
                //  var checkInput = checkInput(array);//验证输入是否合法
                $.ajax({
                    url:'${pageContext.request.contextPath}/user/register',
                    type:'post',
                    data:{
                        "userName": username,
                        "userPassword":password,
                        "phone":phone,
                        "email":email,
                        "sex":sex,
                        "age":age
                    },
                    success:function (res) {
                        if(res=="success"){
                            console.log("register success:  " +res)
                            window.location.href='login.jsp'
                        }
                        else if(res == "fail") {
                            console.log("register fail: "+res)
                        }
                    }
                })
            }
        }
        function checkName() {
            var username = document.getElementById("username").value;
            if(username=="" || username.length ==0){
                document.getElementById("usernamecheck").innerHTML="输入不能为空";
                document.getElementById("username").focus();
            }
            else if(username.length>20){
                document.getElementById("usernamecheck").innerHTML="用户名在20个字符内"
                document.getElementById("username").focus();
            }
            else {
                document.getElementById("usernamecheck").innerHTML=""
            }
        }
        function checkpassword() {
            var password = document.getElementById("password").value;
            if(password.length == 0 ){
                document.getElementById("passwordcheck").innerHTML="密码不能为空";
                document.getElementById("password").focus();
            }
            else if(password.length<6 || password.length > 20){
                document.getElementById("passwordcheck").innerHTML=password.length<6?"密码至少六位":"密码最多20位";
                document.getElementById("password").focus();
            }
            else {
                document.getElementById("passwordcheck").innerHTML=""
            }
        }
        function checkphone() {
            var phone = document.getElementById("phone").value;
            var phonecheck = /^[1][3,4,5,7,8][0-9]{9}$/;
            console.log(phonecheck.test(phone))
            if(phone.length==0){
                document.getElementById("phonecheck").innerHTML="手机号不能为空";
                document.getElementById("phone").focus();
            }
            else if(/^[1][3,4,5,7,8][0-9]{9}$/.test(phone)==false){
                document.getElementById("phonecheck").innerHTML="请填写正确手机号";
                document.getElementById("phone").focus();
            }
            else {
                $.ajax({
                    url:'${pageContext.request.contextPath}/user/registerCheck',
                    type:'post',
                    data:{
                        "phone":phone
                    },
                    success:function (res) {
                        if(res == "fail"){
                            document.getElementById("phonecheck").innerHTML="手机号已经被占用";
                            document.getElementById("phone").focus();
                        }else {
                            document.getElementById("phonecheck").innerHTML="";
                        }
                    }
                })
                document.getElementById("phonecheck").innerHTML="";
            }
        }

    </script>
</head>
<body>
<div class="login-box" id="demo">
    <div class="input-content">
        <div class="login_tit">
            <div>
                <i class="tit-bg left"></i>
                博客社区注册页面
                <i class="tit-bg right"></i>
            </div>
            <p>Happy&nbsp;&nbsp;&nbsp;&nbsp;Everyday</p>
        </div>
        <p class="p user_icon">
            <input type="text" placeholder="用户名" autocomplete="off" class="login_txtbx" id="username" onblur="checkName()"><font id="usernamecheck" color="red"></font>
        </p>
        <p class="p pwd_icon">
            <input type="password" placeholder="密码" autocomplete="off" class="login_txtbx" id="password" onblur="checkpassword()"><font id="passwordcheck" color="red"></font>
        </p>
        <p class="p user_icon">
            <input type="text" placeholder="手机号" autocomplete="off" class="login_txtbx" id="phone" onblur="checkphone()"><font id="phonecheck" color="red"></font>
        </p>
        <p class="p user_icon">
            <input type="text" placeholder="性别" autocomplete="off" class="login_txtbx" id="sex"><span id="sexcheck"></span>
        </p>
        <p class="p user_icon">
            <input type="text" placeholder="年龄" autocomplete="off" class="login_txtbx" id="age"><span id="agecheck"></span>
        </p>
        <p class="p user_icon">
            <input type="" placeholder="邮箱" autocomplete="off" class="login_txtbx" id="email"><span id="emailcheck"></span>
        </p>
        <div class="p val_icon">
            <div class="checkcode">
                <input type="text" id="J_codetext" placeholder="验证码" autocomplete="off" maxlength="4" class="login_txtbx">
                <canvas class="J_codeimg" id="myCanvas" onclick="createCode()" onselectstart="return false">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
            </div>
            <a class="ver_btn" onclick="createCode();" onselectstart="return false">看不清，换一张</a>
        </div>
        <div class="signup">
            <a class="gv" href="#" onclick="register()">提&nbsp;&nbsp;交</a>
            <a class="gv" href="${pageContext.request.contextPath}/user/toLogin">登&nbsp;&nbsp;录</a>
        </div>
    </div>
    <div class="canvaszz"> </div>
    <canvas id="canvas"></canvas>
</div>
<script>
    //宇宙特效
    "use strict";
    var canvas = document.getElementById('canvas'),
        ctx = canvas.getContext('2d'),
        w = canvas.width = window.innerWidth,
        h = canvas.height = window.innerHeight,

        hue = 217,
        stars = [],
        count = 0,
        maxStars = 2500;//星星数量

    var canvas2 = document.createElement('canvas'),
        ctx2 = canvas2.getContext('2d');
    canvas2.width = 100;
    canvas2.height = 100;
    var half = canvas2.width / 2,
        gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);
    gradient2.addColorStop(0.025, '#CCC');
    gradient2.addColorStop(0.1, 'hsl(' + hue + ', 61%, 33%)');
    gradient2.addColorStop(0.25, 'hsl(' + hue + ', 64%, 6%)');
    gradient2.addColorStop(1, 'transparent');

    ctx2.fillStyle = gradient2;
    ctx2.beginPath();
    ctx2.arc(half, half, half, 0, Math.PI * 2);
    ctx2.fill();

    // End cache

    function random(min, max) {
        if (arguments.length < 2) {
            max = min;
            min = 0;
        }

        if (min > max) {
            var hold = max;
            max = min;
            min = hold;
        }

        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function maxOrbit(x, y) {
        var max = Math.max(x, y),
            diameter = Math.round(Math.sqrt(max * max + max * max));
        return diameter / 2;
        //星星移动范围，值越大范围越小，
    }

    var Star = function() {

        this.orbitRadius = random(maxOrbit(w, h));
        this.radius = random(60, this.orbitRadius) / 18;
        //星星大小
        this.orbitX = w / 2;
        this.orbitY = h / 2;
        this.timePassed = random(0, maxStars);
        this.speed = random(this.orbitRadius) / 500000;
        //星星移动速度
        this.alpha = random(2, 10) / 10;

        count++;
        stars[count] = this;
    }

    Star.prototype.draw = function() {
        var x = Math.sin(this.timePassed) * this.orbitRadius + this.orbitX,
            y = Math.cos(this.timePassed) * this.orbitRadius + this.orbitY,
            twinkle = random(10);

        if (twinkle === 1 && this.alpha > 0) {
            this.alpha -= 0.05;
        } else if (twinkle === 2 && this.alpha < 1) {
            this.alpha += 0.05;
        }

        ctx.globalAlpha = this.alpha;
        ctx.drawImage(canvas2, x - this.radius / 2, y - this.radius / 2, this.radius, this.radius);
        this.timePassed += this.speed;
    }

    for (var i = 0; i < maxStars; i++) {
        new Star();
    }

    function animation() {
        ctx.globalCompositeOperation = 'source-over';
        ctx.globalAlpha = 0.5; //尾巴
        ctx.fillStyle = 'hsla(' + hue + ', 64%, 6%, 2)';
        ctx.fillRect(0, 0, w, h)

        ctx.globalCompositeOperation = 'lighter';
        for (var i = 1, l = stars.length; i < l; i++) {
            stars[i].draw();
        };

        window.requestAnimationFrame(animation);
    }

    animation();
</script>

</body>
</html>

</html>
