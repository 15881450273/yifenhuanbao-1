package com.nddmwdf.program.test;
import com.nddmwdf.program.dao.GarbageDao;
import com.nddmwdf.program.entity.Garbage;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.Assert.assertEquals;
public class TestGarbage {

    //1.测试添加垃圾
    @Test
    public void testadd()
    {
        GarbageDao garbageDao=new GarbageDao();
        garbageDao.addGarbage("雪碧瓶","轻投轻放；清洁干燥，避免污染；立体包装物清空内容物，清洁后压扁投放；有尖锐边角的，应包裹后投放。","可回收物");
        garbageDao.addGarbage("test","test","test");
        garbageDao.addGarbage("test1","test1","test1");
        garbageDao.addGarbage("test2","test2","test2");
    }

    //2.测试修改垃圾
    @Test
    public void testalter()
    {
        GarbageDao garbageDao=new GarbageDao();
        garbageDao.alterGarbage(1494,"修改啦","修改啦","修改啦");
    }

    //3.测试删除垃圾
    @Test
    public void testdelete()
    {
        GarbageDao garbageDao=new GarbageDao();
        garbageDao.deleteGarbage(1495);
    }

    //4.测试获取垃圾数
    @Test
    public void testnumber() throws SQLException,ClassNotFoundException
    {
        GarbageDao garbageDao=new GarbageDao();
        assertEquals(garbageDao.getPage(),1488);
    }
}
