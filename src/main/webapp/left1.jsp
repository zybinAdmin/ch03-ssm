<%@ page import="com.test.domain.Users" %><%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/9/13
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <title>在线考试系统</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>

<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li>用户信息管理</li>
                <ol>
                    <li><a href="user/infoUser.do?userName=${sessionScope.userName}" target="right">个人信息查询</a></li>
                </ol>
                <li>考试管理</li>
                <ol>
                    <li><a href="question/randQuestion.do" target="right">开始考试</a></li>
                    <li><a href="question/recordQuestion1.do?userName=${sessionScope.userName}" target="right">考试记录</a></li>
                </ol>
                <li>系统管理</li>
                <ol>
                    <li><a href="login.jsp" target="_parent">退出系统</a></li>

                </ol>
            </ul>
        </nav>
    </div>
</section>
<footer class="footer">
</footer>
</body>
</html>