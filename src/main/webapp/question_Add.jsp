<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2020/11/16
  Time: 16:50
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
    <script type="text/javascript">
        window.onload = function(){
            //设置试题不能为空
            var sp1 = document.getElementById("sp1");
            var title = document.getElementById("title");
            title.onblur = function(){
                var titles = title.value;
                titles = titles.trim();
                if(titles == ''){
                    sp1.innerText = "试题信息不能为空";
                }
            }
            title.onfocus = function(){
                //清空span
                sp1.innerText = "";
            }

            //设置A选项不能为空
            var sp2 = document.getElementById("sp2");
            var optionA = document.getElementById("optionA");
            optionA.onblur = function(){
                var optionAs = optionA.value;
                optionAs = optionAs.trim();
                if(optionAs == ''){
                    sp2.innerText = "A选项不能为空";
                }
            }
            optionA.onfocus = function(){
                //清空span
                sp2.innerText = "";
            }

            //设置A选项不能为空
            var sp3= document.getElementById("sp3");
            var optionB = document.getElementById("optionB");
            optionB.onblur = function(){
                var optionBs = optionB.value;
                optionBs = optionBs.trim();
                if(optionBs == ''){
                    sp3.innerText = "B选项不能为空";
                }
            }
            optionB.onfocus = function(){
                //清空span
                sp3.innerText = "";
            }

            //设置C选项不能为空
            var sp4= document.getElementById("sp4");
            var optionC = document.getElementById("optionC");
            optionC.onblur = function(){
                var optionCs = optionC.value;
                optionCs = optionCs.trim();
                if(optionCs == ''){
                    sp4.innerText = "C选项不能为空";
                }
            }
            optionC.onfocus = function(){
                //清空span
                sp4.innerText = "";
            }

            //设置D选项不能为空
            var sp5= document.getElementById("sp5");
            var optionD = document.getElementById("optionD");
            optionD.onblur = function(){
                var optionDs = optionD.value;
                optionDs = optionDs.trim();
                if(optionDs == ''){
                    sp5.innerText = "D选项不能为空";
                }
            }
            optionD.onfocus = function(){
                //清空span
                sp5.innerText = "";
            }

            //给鼠标按钮绑定鼠标单击事件
            var submitBtnElt = document.getElementById("submitBtn");
            submitBtn.onclick = function(){
                title.focus();
                title.blur();

                optionA.focus();
                optionA.blur();

                optionB.focus();
                optionB.blur();

                optionC.focus();
                optionC.blur();

                optionD.focus();
                optionD.blur();
                //当所有表单项都是合法的时候，提交表单
                if(sp1.innerText == "" && sp2.innerText == "" && sp3.innerText == "" && sp4.innerText == "" && sp5.innerText == ""){
                    //获取表单
                    var questionFormElt = document.getElementById("questionForm");
                    //提交表单
                    questionFormElt.submit();
                }
            }
        }
    </script>
</head>
<body>
<center>
    <form id="questionForm" action="question/addQuestion.do" method="get">
        <table>
            <tr>
                <td>题目</td>
                <td><input id="title" type="text" name="title"></td>
                <td><span id="sp1"></span></td>
            </tr>
            <tr>
                <td>A</td>
                <td><input id="optionA" type="text" name="optionA"></td>
                <td><span id="sp2"></span></td>
            </tr>
            <tr>
                <td>B</td>
                <td><input id="optionB" type="text" name="optionB"></td>
                <td><span id="sp3"></span></td>
            </tr>
            <tr>
                <td>C</td>
                <td><input id="optionC" type="text" name="optionC"></td>
                <td><span id="sp4"></span></td>
            </tr>
            <tr>
                <td>D</td>
                <td><input id="optionD" type="text" name="optionD"></td>
                <td><span id="sp5"></span></td>
            </tr>
            <tr>
                <td>正确答案</td>
                <td>
                    <input type="radio" name="answer" value="A">A
                    <input type="radio" name="answer" value="B">B
                    <input type="radio" name="answer" value="C">C
                    <input type="radio" name="answer" value="D">D

                </td>
            </tr>
            <tr>
                <td><input type="button" id="submitBtn" value="新增试题"></td>
                <td><input type="reset"></td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
