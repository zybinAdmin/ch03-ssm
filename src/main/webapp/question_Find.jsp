<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.domain.Question" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/8/17
  Time: 9:17
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
                query();
            })
        })

        $(window).keydown(function (event) {
            if (event.keyCode == 13){
                query();
            }
        })
        function query() {
            var questionId =  $(":text").val();
            $.ajax({
                url:"/ch03_ssm/question/queryQuestion.do",
                data:{"questionId":questionId},
                dataType:"json",
                success:function(resp) {
                    $("#info").html("");
                    $("#info").append("<tr>")
                        .append("<td>"+resp.questionId+"</td>")
                        .append("<td>"+resp.title+"</td>")
                        .append("<td>"+resp.optionA+"</td>")
                        .append("<td>"+resp.optionB+"</td>")
                        .append("<td>"+resp.optionC+"</td>")
                        .append("<td>"+resp.optionD+"</td>")
                        .append("<td>"+resp.answer+"</td>")
                        .append("<td>"+"<a href='/ch03_ssm/question/findByIdQuestion.do?questionId="+resp.questionId+"'>" +
                            "<img src='/ch03_ssm/img/read.png' alt='查看' title='查看'/>"+"</a>"+
                            "<a href='/ch03_ssm/question/deleteQuestion.do?questionId="+resp.questionId+"' class='removeUser'>"+
                            "<img src='/ch03_ssm/img/schu.png' alt='删除' title='删除'/>"+"</a>"+"</td>")
                        .append("</tr>")
                }
            })
        }
    </script>
</head>
<body>
    <section class="publicMian">
        <div class="right">
            <div class="search">
                <span>试题编号：</span>
                <input type="text" placeholder="请输入试题编号"/>
                <input type="button" value="查询"/>
            </div>
            <table class="providerTable" style="margin: 0px auto">
                <tr class="firstTr">
                    <th width="10%">试题编号</th>
                    <th width="30%">试题信息</th>
                    <th width="10%">A选项</th>
                    <th width="10%">B选项</th>
                    <th width="10%">C选项</th>
                    <th width="10%">D选项</th>
                    <th width="10%">正确答案</th>
                    <th width="20%">操作</th>
                </tr>

                <tbody id="info" style="text-align: center">
                <c:forEach var="question" items="${questionList}">
                <tr>
                    <td>${question.questionId}</td>
                    <td>${question.title}</td>
                    <td>${question.optionA}</td>
                    <td>${question.optionB}</td>
                    <td>${question.optionC}</td>
                    <td>${question.optionD}</td>
                    <td>${question.answer}</td>
                    <td>
                        <a href="/ch03_ssm/question/findByIdQuestion.do?questionId=${question.questionId}">
                            <img src="/ch03_ssm/img/read.png" alt="查看" title="查看"/>
                        </a>
                        <a href="/ch03_ssm/question/deleteQuestion.do?questionId=${question.questionId}" class="removeUser">
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
    <div class="remove" id="removeUse">
        <div class="removerChid">
            <h2>提示</h2>
            <div class="removeMain">
                <p>你确定要删除该试题吗？</p>
                <a href="" id="yes">确定</a>
                <a href="#" id="no">取消</a>
            </div>
        </div>
    </div>
    <footer class="footer">
    </footer>
</body>
</html>
