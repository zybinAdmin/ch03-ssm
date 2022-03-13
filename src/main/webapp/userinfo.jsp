<%@ page import="com.test.domain.Users" %><%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/9/13
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/ch03_ssm/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="/ch03_ssm/css/style.css"/>
</head>
<body>
<h1 style="color:#d8e9fd;text-align: center">个人信息</h1>
<section class="publicMian ">
    <div class="right">
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">用户编号</th>
                <th width="20%">用户名</th>
                <th width="10%">用户密码</th>
                <th width="10%">用户性别</th>
                <th width="20%">用户邮箱</th>
                <th width="10%">身份</th>
                <th width="30%">操作</th>
            </tr>
            <tr>
                <td>${users.userId}</td>
                <td>${users.userName}</td>
                <td>${users.password}</td>
                <td>${users.sex}</td>
                <td>${users.email}</td>
                <td>${users.identity}</td>
                <td>
                    <a href="/ch03_ssm/user/findByIdUser.do?userId=${users.userId}">
                        <img src="/ch03_ssm/img/read.png" alt="查看" title="查看"/>
                    </a>
                </td>
            </tr>
        </table>
    </div>
</section>
<footer class="footer">
</footer>
</body>
</html>
