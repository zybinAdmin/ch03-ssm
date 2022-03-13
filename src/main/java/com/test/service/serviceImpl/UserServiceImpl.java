package com.test.service.serviceImpl;

import com.test.dao.UserDao;
import com.test.domain.Users;
import com.test.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public String account(String userName) {
        String userNames = userDao.account(userName);
        return userNames;
    }

    @Override
    public int userAdd(Users users) {
        int result = 0;
        if (users.getUserName() != null || users.getPassword() != null
                || users.getSex() != null || users.getEmail() != null
                || users.getIdentity() != null){
            result = userDao.userAdd(users);
        }
        return result;
    }

    @Override
    public List findAllUser() {
        List<Users> users = userDao.findAllUser();
        return users;
    }

    @Override
    public int deleteUser(String userId) {
        int result = userDao.deleteUser(userId);
        return result;
    }

    @Override
    public int login(String userName, String password, String identity) {
        int result = userDao.login(userName,password,identity);
        return result;
    }

    @Override
    public Users queryUser(String userName) {
        Users users = userDao.queryUser(userName);
        return users;
    }

    @Override
    public Users findByIdUser(Integer userId) {
        Users users = userDao.findByIdUser(userId);
        return users;
    }

    @Override
    public int upDateUser(Users users) {
        int result = userDao.upDateUser(users);
        return result;
    }

    @Override
    public Users infoUser(String userName) {
        Users users = userDao.infoUser(userName);
        return users;
    }


    /*@Override
    public int getIdUser(String userName) {
        int result = userDao.getIdUser(userName);
        return result;
    }*/
}
