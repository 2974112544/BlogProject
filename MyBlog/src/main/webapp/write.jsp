<%--
  Created by IntelliJ IDEA.
  User: 谢胜荣
  Date: 2020/10/29
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Summernote</title>

    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
</head>
<body>
<textarea id="summernote" class="summernote"></textarea>
<button onclick="sub()">保存</button>
<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOwAAAAOCAYAAAAsX/CdAAADTUlEQVRoBe1aUW4jIQzljJF6oWiukkq5SHKQfuQYXmFjMDabeom7M9mlUhNNy/Dw83sYmEnX6xV+8ufxeYKUNrg9BbnBlhKcPh9PW3X/vG+Q0gkuX91f1cUDLh8J0vk5OoATfwdMH3+xcYZiujgD2APzdk6QPi7wB6pT+vr7l2kZNpO+DCult4d59sD8Lw2LQacECX83uKkZtSYC/87tdDUdGKa2p+pc+2FlMc79AqeKr6tpqzz9OHVlZvwbVeTan1oZ7IBZ4658EIf9aiQ2zlBMF2eiwkbE6cS0hiUdZC1vdxbasb5fqLBFJHK5W8luhqDkq6VHaddIYcOUxQn3I5ayVUTMH7eR+F9k3iZmHmM/QZB5pRlHiSr3yiXTDpg+/mLjDMV0ccaG/U4nzjidmL1hWQNSFyy243zPG7aQ0kxHQZEZtGHbdWml9qzCsEy2MGu+53eG7fFLQuu9A9PlzhBDjqkkq95HozwCJo1BjjWPTfCFQ42NMxRzqBOdJ85vUJxOzGbY9zBrTvW0YY2YSePFWI34cTttkCLA80bLW1nVun7F7GdMlxtq4VphYHcmodoABGqEuwOmj7/YOEMxXZyxYUV+MQVaJ844nZhk2A22fDD57QEmaWLvz2nDUiXVBNvq5Ut+SUzdO/ZL2EyS6ceVFGeCTcWitBBmm3xsZcaR0b63TjKxmCZuHNqkkJ1xhmK68jTI7ytxOjFJw+1c5R1OjKcNO04qE99EPm6nBUfXvPckIlsfaAv9eMiVlFjzLMPKQz0nt648sW50AdA6icWkClse6+A4baHAeeNAH9OGJfHa0zRtthnD8h5NPj81/biE4Eyws/Isw/7Dhs0nA/m5rDzEPJBReSjzhuX9ogywzFIyaGM0RNYzZ19hcxO6r00Ipp9lWPFCSOzEZLge5syJ6coT53vHCptjLE8ZZKHA0A/08YJhKQqalXgfwM9hG/G+5FvD1gOkchhg+nEJwSmqVWG7QxfDNaZaT7JObl15OohhRaHg7dmBvIpDedmwOiBMdj2A0f+dvx6LaL6/dedi4B0ZmDcszpxtyYrBmxcX4ijpDgjiul09LQbeioF5w4rlA72WSMvi/kWGAC54X3Hg18UColxdLAZcDPwC41tiy0ioUScAAAAASUVORK5CYII=" alt=""><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOwAAAAOCAYAAAAsX/CdAAADTUlEQVRoBe1aUW4jIQzljJF6oWiukkq5SHKQfuQYXmFjMDabeom7M9mlUhNNy/Dw83sYmEnX6xV+8ufxeYKUNrg9BbnBlhKcPh9PW3X/vG+Q0gkuX91f1cUDLh8J0vk5OoATfwdMH3+xcYZiujgD2APzdk6QPi7wB6pT+vr7l2kZNpO+DCult4d59sD8Lw2LQacECX83uKkZtSYC/87tdDUdGKa2p+pc+2FlMc79AqeKr6tpqzz9OHVlZvwbVeTan1oZ7IBZ4658EIf9aiQ2zlBMF2eiwkbE6cS0hiUdZC1vdxbasb5fqLBFJHK5W8luhqDkq6VHaddIYcOUxQn3I5ayVUTMH7eR+F9k3iZmHmM/QZB5pRlHiSr3yiXTDpg+/mLjDMV0ccaG/U4nzjidmL1hWQNSFyy243zPG7aQ0kxHQZEZtGHbdWml9qzCsEy2MGu+53eG7fFLQuu9A9PlzhBDjqkkq95HozwCJo1BjjWPTfCFQ42NMxRzqBOdJ85vUJxOzGbY9zBrTvW0YY2YSePFWI34cTttkCLA80bLW1nVun7F7GdMlxtq4VphYHcmodoABGqEuwOmj7/YOEMxXZyxYUV+MQVaJ844nZhk2A22fDD57QEmaWLvz2nDUiXVBNvq5Ut+SUzdO/ZL2EyS6ceVFGeCTcWitBBmm3xsZcaR0b63TjKxmCZuHNqkkJ1xhmK68jTI7ytxOjFJw+1c5R1OjKcNO04qE99EPm6nBUfXvPckIlsfaAv9eMiVlFjzLMPKQz0nt648sW50AdA6icWkClse6+A4baHAeeNAH9OGJfHa0zRtthnD8h5NPj81/biE4Eyws/Isw/7Dhs0nA/m5rDzEPJBReSjzhuX9ogywzFIyaGM0RNYzZ19hcxO6r00Ipp9lWPFCSOzEZLge5syJ6coT53vHCptjLE8ZZKHA0A/08YJhKQqalXgfwM9hG/G+5FvD1gOkchhg+nEJwSmqVWG7QxfDNaZaT7JObl15OohhRaHg7dmBvIpDedmwOiBMdj2A0f+dvx6LaL6/dedi4B0ZmDcszpxtyYrBmxcX4ijpDgjiul09LQbeioF5w4rlA72WSMvi/kWGAC54X3Hg18UColxdLAZcDPwC41tiy0ioUScAAAAASUVORK5CYII=" data-filename="image.png" style="width: 235.992px;"><br></p>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOwAAAAOCAYAAAAsX/CdAAADTUlEQVRoBe1aUW4jIQzljJF6oWiukkq5SHKQfuQYXmFjMDabeom7M9mlUhNNy/Dw83sYmEnX6xV+8ufxeYKUNrg9BbnBlhKcPh9PW3X/vG+Q0gkuX91f1cUDLh8J0vk5OoATfwdMH3+xcYZiujgD2APzdk6QPi7wB6pT+vr7l2kZNpO+DCult4d59sD8Lw2LQacECX83uKkZtSYC/87tdDUdGKa2p+pc+2FlMc79AqeKr6tpqzz9OHVlZvwbVeTan1oZ7IBZ4658EIf9aiQ2zlBMF2eiwkbE6cS0hiUdZC1vdxbasb5fqLBFJHK5W8luhqDkq6VHaddIYcOUxQn3I5ayVUTMH7eR+F9k3iZmHmM/QZB5pRlHiSr3yiXTDpg+/mLjDMV0ccaG/U4nzjidmL1hWQNSFyy243zPG7aQ0kxHQZEZtGHbdWml9qzCsEy2MGu+53eG7fFLQuu9A9PlzhBDjqkkq95HozwCJo1BjjWPTfCFQ42NMxRzqBOdJ85vUJxOzGbY9zBrTvW0YY2YSePFWI34cTttkCLA80bLW1nVun7F7GdMlxtq4VphYHcmodoABGqEuwOmj7/YOEMxXZyxYUV+MQVaJ844nZhk2A22fDD57QEmaWLvz2nDUiXVBNvq5Ut+SUzdO/ZL2EyS6ceVFGeCTcWitBBmm3xsZcaR0b63TjKxmCZuHNqkkJ1xhmK68jTI7ytxOjFJw+1c5R1OjKcNO04qE99EPm6nBUfXvPckIlsfaAv9eMiVlFjzLMPKQz0nt648sW50AdA6icWkClse6+A4baHAeeNAH9OGJfHa0zRtthnD8h5NPj81/biE4Eyws/Isw/7Dhs0nA/m5rDzEPJBReSjzhuX9ogywzFIyaGM0RNYzZ19hcxO6r00Ipp9lWPFCSOzEZLge5syJ6coT53vHCptjLE8ZZKHA0A/08YJhKQqalXgfwM9hG/G+5FvD1gOkchhg+nEJwSmqVWG7QxfDNaZaT7JObl15OohhRaHg7dmBvIpDedmwOiBMdj2A0f+dvx6LaL6/dedi4B0ZmDcszpxtyYrBmxcX4ijpDgjiul09LQbeioF5w4rlA72WSMvi/kWGAC54X3Hg18UColxdLAZcDPwC41tiy0ioUScAAAAASUVORK5CYII=" alt=""><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOwAAAAOCAYAAAAsX/CdAAADTUlEQVRoBe1aUW4jIQzljJF6oWiukkq5SHKQfuQYXmFjMDabeom7M9mlUhNNy/Dw83sYmEnX6xV+8ufxeYKUNrg9BbnBlhKcPh9PW3X/vG+Q0gkuX91f1cUDLh8J0vk5OoATfwdMH3+xcYZiujgD2APzdk6QPi7wB6pT+vr7l2kZNpO+DCult4d59sD8Lw2LQacECX83uKkZtSYC/87tdDUdGKa2p+pc+2FlMc79AqeKr6tpqzz9OHVlZvwbVeTan1oZ7IBZ4658EIf9aiQ2zlBMF2eiwkbE6cS0hiUdZC1vdxbasb5fqLBFJHK5W8luhqDkq6VHaddIYcOUxQn3I5ayVUTMH7eR+F9k3iZmHmM/QZB5pRlHiSr3yiXTDpg+/mLjDMV0ccaG/U4nzjidmL1hWQNSFyy243zPG7aQ0kxHQZEZtGHbdWml9qzCsEy2MGu+53eG7fFLQuu9A9PlzhBDjqkkq95HozwCJo1BjjWPTfCFQ42NMxRzqBOdJ85vUJxOzGbY9zBrTvW0YY2YSePFWI34cTttkCLA80bLW1nVun7F7GdMlxtq4VphYHcmodoABGqEuwOmj7/YOEMxXZyxYUV+MQVaJ844nZhk2A22fDD57QEmaWLvz2nDUiXVBNvq5Ut+SUzdO/ZL2EyS6ceVFGeCTcWitBBmm3xsZcaR0b63TjKxmCZuHNqkkJ1xhmK68jTI7ytxOjFJw+1c5R1OjKcNO04qE99EPm6nBUfXvPckIlsfaAv9eMiVlFjzLMPKQz0nt648sW50AdA6icWkClse6+A4baHAeeNAH9OGJfHa0zRtthnD8h5NPj81/biE4Eyws/Isw/7Dhs0nA/m5rDzEPJBReSjzhuX9ogywzFIyaGM0RNYzZ19hcxO6r00Ipp9lWPFCSOzEZLge5syJ6coT53vHCptjLE8ZZKHA0A/08YJhKQqalXgfwM9hG/G+5FvD1gOkchhg+nEJwSmqVWG7QxfDNaZaT7JObl15OohhRaHg7dmBvIpDedmwOiBMdj2A0f+dvx6LaL6/dedi4B0ZmDcszpxtyYrBmxcX4ijpDgjiul09LQbeioF5w4rlA72WSMvi/kWGAC54X3Hg18UColxdLAZcDPwC41tiy0ioUScAAAAASUVORK5CYII=" data-filename="image.png" style="width: 235.992px;"><br></p>
<span id="testwrite"></span>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
        });
    });

    function sub() {
        var summernote = $('#summernote').summernote('code');
        console.log(summernote);
        $.ajax({
            url:'${pageContext.request.contextPath}/user/createBlog',
            type:'post',
            data:{
                "blogText":summernote
            },
            datatype:'json',
            success:function (e) {
                console.log("success:"+e)
                document.getElementById('testwrite').innerHTML=e;
            }

        })
    }
</script>
</body>
</html>
