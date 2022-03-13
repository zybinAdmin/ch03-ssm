<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/11/10
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        span{
            color: red;
            font-size: 12px;
        }
    </style>
    <%--<script type="text/javascript" src="js/form.js"  charset="UTF-8"></script>--%>
    <script type="text/javascript">
        window.onload = function(){
            //用户名
            var sp1 = document.getElementById("sp1");
            var userNameElt = document.getElementById("userName");
            userNameElt.onblur = function(){
                var userName = userNameElt.value;
                userName = userName.trim();
                if(userName == ''){
                    sp1.innerText = "用户名不能为空";
                }else{
                    if(userName.length < 4 || userName.length > 10){
                        sp1.innerText = "用户名需要在6-14位之间";
                    }else{
                        var regExp = /^[A-Za-z0-9]+$/;
                        var ok = regExp.test(userName);
                        if(ok){
                            //用户名合法

                        }else{
                            //用户名不合法
                            sp1.innerText = "用户名只能有数字和字母组成"
                        }
                    }
                }
            }
            //给username
            userNameElt.onfocus = function(){
                //清空非法的value
                if(sp1.innerText != ""){
                    userNameElt.value = "";
                }
                //清空span
                sp1.innerText = "";
            }
            //密码
            var sp2 = document.getElementById("sp2");
            var password1Elt = document.getElementById("password1");
            password1Elt.onblur = function(){
                var passwordElt = document.getElementById("password");
                var password = passwordElt.value;
                var password1 = password1Elt.value;
                if(password != password1){
                    //密码不同
                    sp2.innerText = "密码不同，请重新输入";
                }else{
                    //密码相同

                }
            }
            //绑定focus事件
            password1Elt.onfocus = function(){
                if(sp2.innerText != ""){
                    password1Elt.value = "";
                }
                //清空span
                sp2.innerText = "";
            }

            //邮箱
            var sp3 = document.getElementById("sp3");
            var emailElt = document.getElementById("email");
            emailElt.onblur = function(){
                var email = emailElt.value;
                var emlieRegExp = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                var ok = emlieRegExp.test(email);
                if(ok){
                    //合法

                }else{
                    //不合法
                    sp3.innerText = "邮箱格式错误";
                }
                emailElt.onfocus = function(){
                    if(sp3.innerText != ""){
                        emailElt.value = "";
                    }
                    sp3.innerText = "";
                }
            }
            //给鼠标按钮绑定鼠标单击事件
            var submitBtnElt = document.getElementById("submitBtn");
            submitBtn.onclick = function(){
                userNameElt.focus();
                userNameElt.blur();

                password1Elt.focus();
                password1Elt.blur();

                emailElt.focus();
                emailElt.blur();

                //当所有表单项都是合法的时候，提交表单
                if(sp1.innerText == "" && sp2.innerText == "" && sp3.innerText == ""){
                    //获取表单
                    var userFormElt = document.getElementById("userForm");
                    //提交表单
                    userFormElt.submit();
                }

            }
        }
    </script>
</head>
<body>
<center>
    <form id="userForm" action="user/addUser.do" method="get">
        <table>
            <tr>
                <td>用户名</td>
                <td><input type="text" name="userName" id="userName"/></td>
                <td><span id="sp1"></span></td>

            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="password" id="password"/></td>

            </tr>
            <tr>
                <td>确认密码</td>
                <td><input type="password" id="password1"/></td>
                <td><span id="sp2"></span></td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="sex" value="男" checked>男
                    <input type="radio" name="sex" value="女">女
                </td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="email" id="email"/></td>
                <td><span id="sp3"></span></td>
            </tr>
            <tr>
                <td>身份</td>
                <td>
                    <input type="radio" name="identity" value="用户" checked>用户
                    <input type="radio" name="identity" value="管理">管理
                </td>
            </tr>
            <tr>
                <td><input type="button"  id="submitBtn" value="提交" /></td>
                <td><input type="reset" value="重置"></td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
