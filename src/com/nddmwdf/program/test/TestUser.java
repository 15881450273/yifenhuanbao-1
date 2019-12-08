package com.nddmwdf.program.test;
import com.nddmwdf.program.dao.UserDao;
import com.nddmwdf.program.entity.User;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
public class TestUser {

    //1.测试用户是否存在
    @Test
    public void testExist()
    {
        UserDao userDao=new UserDao();
        //测试存在的用户
        assertEquals(userDao.isExists("a123456"),1);
        //测试不存在的用户
        assertEquals(userDao.isExists("a123"),0);
    }

    //2.测试用户登录
    @Test
    public void testLogin()
    {
        UserDao userDao=new UserDao();
        User user=new User();
        User user1=new User();
        user.setLoginName("a123456");
        user.setLoginPass("123456");
        user1.setLoginName("123");
        user1.setLoginPass("123");
        //测试存在的用户
        assertEquals(userDao.validateUser(user),true);
        assertEquals(userDao.validateUser(user1),false);
    }

    //3.测试添加用户
    @Test
    public void testadd()
    {
        UserDao userDao=new UserDao();
        userDao.addUser("6543251","123456","mike","男");
    }

    //4.测试用户修改密码
    @Test
    public void testalter()
    {
        UserDao userDao=new UserDao();
        userDao.alterPass("6543251","6666");
    }

    //5.测试删除用户
    @Test
    public void testdelete()
    {
        UserDao userDao=new UserDao();
        userDao.addUser("34567","123456","mike","男");
        userDao.deleteUser("34567");
    }

}
