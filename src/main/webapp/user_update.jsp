<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/8/26
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/ch03_ssm/js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function () {
            var value="";
            var radio=document.getElementsByName("identity");
            for(var i=0;i<radio.length;i++){
                if(radio[i].checked==true){
                    value=radio[i].value;
                    break;
                }
            }
            $("#identity").val(value);
        })
    </script>
</head>

<body>
<center>
    <form id="userForm" action="/ch03_ssm/user/updateUser.do" method="get">
        <table>
            <tr>
                <td>用户编号</td>
                <td><input type="text" name="userId" id="userId" value="${users.userId}" readonly/></td>
            </tr>
            <tr>
                <td>用户名</td>
                <td><input type="text" name="userName" id="userName" value="${users.userName}"/></td>
                <td><span id="sp1"></span></td>

            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="password" id="password" value="${users.password}"/></td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="sex" value="男" ${"男" eq users.sex?"checked":""}>男
                    <input type="radio" name="sex" value="女" ${"女" eq users.sex?"checked":""}>女
                </td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="email" id="email" value="${users.email}"/></td>
                <td><span id="sp3"></span></td>
            </tr>
            <tr>
                <td>身份</td>
                <td>
                    <input type="radio" id="identity1" name="identity" disabled value="用户" ${"用户" eq users.identity?"checked":""}>用户
                    <input type="radio" id="identity2" name="identity" disabled value="管理" ${"管理" eq users.identity?"checked":""}>管理
                    <input type="hidden" id="identity" name="identity">
                </td>
            </tr>
            <tr>
                <td><input type="submit"  id="submitBtn" value="修改" /></td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
