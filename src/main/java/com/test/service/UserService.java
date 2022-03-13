package com.test.service;

import com.test.domain.Users;

import java.util.List;

public interface UserService {

    //判断用户名是否重复
    String account(String userName);

    //用户注册
    int userAdd(Users users);

    //查询所有用户信息
    List findAllUser();

    //删除用户
    int deleteUser(String userId);

    //用户登录
    int login(String userName, String password, String identity);

    //ajax搜索用户信息
    Users queryUser(String userName);

    //查询用户的详细信息
    Users findByIdUser(Integer userId);

    //修改用户信息
    int upDateUser(Users users);

    //根据ID查询用户的信息
    Users infoUser(String userName);

    /*//通过当前登录用户的用户名获取用户的id
    int getIdUser(String userName);*/
}
