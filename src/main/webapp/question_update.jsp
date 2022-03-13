<%@ page import="com.test.domain.Question" %><%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/8/17
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线考试系统</title>
</head>
<body>

    <center>
        <form action="/ch03_ssm/question/updateQuestion.do" method="get">
            <table border="2">
                <tr>
                    <td>题目编号</td>
                    <td><input type="text" name="questionId" value="${question.questionId}" readonly></td>
                </tr>
                <tr>
                    <td>题目</td>
                    <td><input type="text" name="title" value="${question.title}"></td>
                </tr>
                <tr>
                    <td>A</td>
                    <td><input type="text" name="optionA" value="${question.optionA}"></td>
                </tr>
                <tr>
                    <td>B</td>
                    <td><input type="text" name="optionB" value="${question.optionB}"></td>
                </tr>
                <tr>
                    <td>C</td>
                    <td><input type="text" name="optionC" value="${question.optionC}"></td>
                </tr>
                <tr>
                    <td>D</td>
                    <td><input type="text" name="optionD" value="${question.optionD}" ></td>
                </tr>
                <tr>
                    <td>正确答案</td>
                    <td>
                        <input type="radio" name="answer" value="A" ${"A" eq question.answer?"checked":""}>A
                        <input type="radio" name="answer" value="B" ${"B" eq question.answer?"checked":""}>B
                        <input type="radio" name="answer" value="C" ${"C" eq question.answer?"checked":""}>C
                        <input type="radio" name="answer" value="D" ${"D" eq question.answer?"checked":""}>D

                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="更新试题"></td>
                    <td><input type="reset"></td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
