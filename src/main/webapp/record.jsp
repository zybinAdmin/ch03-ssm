<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/11/20
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/ch03_ssm/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="/ch03_ssm/css/style.css"/>
    <script type="text/javascript" src="/ch03_ssm/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/ch03_ssm/js/js.js" charset="UTF-8"></script>
</head>
<body>
<section class="publicMian ">
    <div class="right">
        <table class="providerTable" style="margin: 0px auto">
            <tr class="firstTr">
                <th width="10%">考试时间</th>
                <th width="20%">用户名</th>
                <th width="10%">所得分数</th>
            </tr>
            <c:forEach var="records" items="${records}">
                <tr>
                    <td>${records.date}</td>
                    <td>${records.userName}</td>
                    <td>${records.score}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>
