package com.nddmwdf.program.test;

import com.nddmwdf.program.dao.AdminDao;
import com.nddmwdf.program.entity.Admin;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class TestAdmin {

    //1.测试管理员是否存在
    @Test
    public void testExist()
    {
        AdminDao adminDao=new AdminDao();
        //测试存在的用户
        assertEquals(adminDao.isExists("admin"),1);
        //测试不存在的用户
        assertEquals(adminDao.isExists("a123"),0);
    }

    //2.测试管理员是否登录
    @Test
    public void testlogin()
    {
        Admin admin=new Admin();
        AdminDao adminDao=new AdminDao();
        admin.setLoginPass("admin");
        admin.setLoginName("admin");
        assertEquals(adminDao.validate(admin),true);
    }

    //3.测试管理员添加
    @Test
    public void testadd()
    {
        AdminDao adminDao=new AdminDao();
        adminDao.addUser("666","666");
    }
}
