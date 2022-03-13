<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.domain.Question" %><%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/8/20
  Time: 15:55
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
</head>
<body>
    <section class="publicMian">
        <div class="right">
            <form action="examQuestion.do">
                <table class="providerTable" cellpadding="0" cellspacing="0">
                    <tr class="firstTr">
                        <th width="10%">试题编号</th>
                        <th width="30%">试题信息</th>
                        <th width="10%">A选项</th>
                        <th width="10%">B选项</th>
                        <th width="10%">C选项</th>
                        <th width="10%">D选项</th>
                        <th width="30%">答案</th>

                    </tr>
                    <c:forEach var="question" items="${questionList}">

                    <tr>
                        <td>${question.questionId}</td>
                        <td>${question.title}</td>
                        <td>${question.optionA}</td>
                        <td>${question.optionB}</td>
                        <td>${question.optionC}</td>
                        <td>${question.optionD}</td>
                        <td>
                            <input type="radio" name="answer_${question.questionId}" value="A">A
                            <input type="radio" name="answer_${question.questionId}" value="B">B
                            <input type="radio" name="answer_${question.questionId}" value="C">C
                            <input type="radio" name="answer_${question.questionId}" value="D">D
                        </td>
                    </tr>

                    </c:forEach>
                    <tr align="center">
                        <td colspan="3"><input type="submit" value="交卷"></td>
                        <td colspan="4"><input type="reset" value="重写"></td>
                    </tr>
                </table>
            </form>
        </div>
    </section>
</body>
</html>
