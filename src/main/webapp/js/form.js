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