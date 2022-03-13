<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/11/16
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线考试系统</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <%--<script type="text/javascript">
        $(function () {
            //页面加载完毕后自动获取焦点
            $("#user").focus();

            $("#submitBtn").click(function () {
                login();
            })

            $(window).keydown(function (event) {
                if (event.keyCode == 13){
                    login();
                }
            })
        })
        function login() {
            var userName = $.trim($("#user").val());
            var password = $.trim($("#mima").val());
            var identity = $(":radio").val();
            if (userName == "" || password == ""){
                $("#span").html("账号密码不能为空");
                return false;
            }
            $.ajax({
                url : "user/loginUser.do",
                data :{
                    "userName" : userName,
                    "password" : password,
                    "identity" : identity
                },
                type : "post",
                dataType : "json",
                success : function (data) {
                    if (data.success){
                        window.location.href = "/ch03/index.html";
                    } else {
                        $("#span").html("用户身份有误");
                    }
                    if (data.success){
                        window.location.href = "/ch03/index1.html";
                    } else {
                        $("#span").html("用户身份有误");
                    }
                }
            })
        }
    </script>--%>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>在线考试系统</h1>
    </header>
    <section class="loginCont">
        <form class="loginForm" action="user/loginUser.do" method="post">
            <div class="inputbox">

                <label for="user">用户名：</label>
                <input id="user" type="text" name="userName" placeholder="请输入用户名" required/>
            </div>
            <div class="inputbox">
                <label for="mima">密码：</label>
                <input id="mima" type="password" name="password" placeholder="请输入密码" required/>
            </div>
            <div class="identity">
                <label for="mima">身份：</label>
                <input type="radio" name="identity" value="用户" checked>用户
                <input type="radio" name="identity" value="管理">管理
                <span id="span" style="color:red; font-size:15px"></span><br>
            </div>
            <div class="subBtn">
                <input type="submit" id="submit" value="登录" />
                <a href="user_Add.jsp"><input type="button" value="注册"/></a>
            </div>
        </form>
    </section>
</section>
</body>
</html>
