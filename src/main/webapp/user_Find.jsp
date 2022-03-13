<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.test.domain.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/8/18
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线考试系统</title>
    <link rel="stylesheet" type="text/css" href="/ch03_ssm/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="/ch03_ssm/css/style.css"/>
    <script type="text/javascript" src="/ch03_ssm/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/ch03_ssm/js/js.js" charset="UTF-8"></script>
    <script type="text/javascript">

    $(function () {
        $(":button").click(function () {
            find();
        })
    })

    $(window).keydown(function (event) {
        if (event.keyCode == 13){
            find();
        }
    })

    function find() {
        var userName =  $(":text").val();
        $.ajax({
            url:"/ch03_ssm/user/queryUser.do",
            data:{"userName":userName},
            dataType:"json",
            success:function(resp) {
                /*alert("用户编号:"+resp.userId+"; 用户名:"+resp.userName+"" +
                    "; 用户密码:"+resp.password+"; 性别:"+resp.sex+"; 用户邮箱:"+resp.email);*/
                $("#info").html("");
                $("#info").append("<tr>")
                    .append("<td>"+resp.userId+"</td>")
                    .append("<td>"+resp.userName+"</td>")
                    .append("<td>"+"******"+"</td>")
                    .append("<td>"+resp.sex+"</td>")
                    .append("<td>"+resp.email+"</td>")
                    .append("<td>"+resp.identity+"</td>")
                    .append("<td>"+"<a href='/ch03_ssm/user/findByIdUser.do?userId="+resp.userId+"'>" +
                          "<img src='/ch03_ssm/img/read.png' alt='查看' title='查看'/>"+"</a>"+
                          "<a href='/ch03_ssm/user/deleteUser.do?userId="+resp.userId+"' class='removeUser'>"+
                          "<img src='/ch03_ssm/img/schu.png' alt='删除' title='删除'/>"+"</a>"+"</td>")
                    .append("</tr>")
            }
        })
    }
</script>
</head>
<body>
    <section class="publicMian ">
        <div class="right">
                <div class="search">
                    <span>用户名：</span>
                    <input type="text"  placeholder="请输入用户名"/>
                    <input type="button" value="查询"/>
                </div>
                <table class="providerTable" style="margin: 0px auto">
                    <thead>
                    <tr class="firstTr">
                        <th width="10%">用户编号</th>
                        <th width="20%">用户名</th>
                        <th width="10%">用户密码</th>
                        <th width="10%">用户性别</th>
                        <th width="20%">用户邮箱</th>
                        <th width="10%">身份</th>
                        <th width="30%">操作</th>
                    </tr>
                    </thead>
                    <tbody id="info" style="text-align: center">
                    <c:forEach var="users" items="${usersList}">
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
                                <a href="/ch03_ssm/user/deleteUser.do?userId=${users.userId}" class="removeUser">
                                    <img src="/ch03_ssm/img/schu.png" alt="删除" title="删除"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
        </div>
    </section>
    <div class="zhezhao"></div>
    <div class="remove" id="removeUser">
        <div class="removerChid">
            <h2>提示</h2>
            <div class="removeMain">
                <p>你确定要删除该用户吗？</p>
                <a href="" id="yes">确定</a>
                <a href="#" id="no">取消</a>
            </div>
        </div>
    </div>
    <footer class="footer">
    </footer>
</body>
</html>
