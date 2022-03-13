package com.test.controller;


import com.test.domain.Users;
import com.test.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UsersController {
    @Resource
    private UserService service;

        //注册学生
        @RequestMapping("/addUser.do")
        public String addStudent(Model model, Users users){
            String tpis = "用户信息注册失败";
            String userName = users.getUserName();
            String userNames = service.account(userName);
            if (userName.equals(userNames)){
                tpis = "用户名重复，请重新输入用户名";
            } else {
                int result = service.userAdd(users);
                if (result >= 1){
                    tpis = users.getUserName() + "用户信息注册成功";
                }
            }
            model.addAttribute("tpis",tpis);
            return "info";
        }

        //查询所用用户的信息
        @RequestMapping("findUser.do")
        public String Student(Model model){
            List<Users> users = service.findAllUser();
            model.addAttribute("usersList", users);
            return "user_Find";
        }

        //用户登录
        @RequestMapping(value = "loginUser.do", method = RequestMethod.POST)
        public ModelAndView login(HttpSession session, String userName, String password, String identity){
            ModelAndView mv = new ModelAndView();
            if (userName != null || password != null){
                int result = service.login(userName,password,identity);
                session.setAttribute("userName", userName);
                if (result >= 1){
                    if ("管理".equals(identity)){
                        mv.setViewName("redirect:/index.html");
                    } else if ("用户".equals(identity)){
                        /*int userId = service.getIdUser(userName);
                        session.setAttribute("userId", userId);*/
                        mv.setViewName("redirect:/index1.html");
                    }
                }else{
                    mv.setViewName("redirect:/login_error.html");
                }
            }
            return mv;
        }


        //删除用户
        @RequestMapping("/deleteUser.do")
        public ModelAndView userDelete(String userId){
            ModelAndView mv = new ModelAndView();
            int result = service.deleteUser(userId);
            if (result >= 1){
                mv.setViewName("redirect:/user/findUser.do");
            }
            return mv;
        }

        //修改用户信息
        @RequestMapping(value = "/updateUser.do", method = RequestMethod.GET)
        public String updateUser(Model model, Users users){
            int result = service.upDateUser(users);
            String tpis = "修改失败";
            if (result >= 1){
                tpis = "修改成功";
            }
            model.addAttribute("tpis", tpis);
            return "info";
        }

        //查询用户详细信息
        @RequestMapping("/findByIdUser.do")
        public String findById(Model model, Integer userId){
            Users users =  service.findByIdUser(userId);
            model.addAttribute("users", users);
            return "user_update";
        }

        //查询用户信息
        @RequestMapping("infoUser.do")
        public String info(Model model, String userName){
            Users users = service.infoUser(userName);
            model.addAttribute("users", users);
            return "userinfo";
        }

        //搜索用户的信息
        @RequestMapping("/queryUser.do")
        @ResponseBody()
        public Users queryUsers(String userName){
            Users users = service.queryUser(userName);
            return users;
        }
}
