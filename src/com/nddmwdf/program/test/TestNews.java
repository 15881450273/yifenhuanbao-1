package com.nddmwdf.program.test;

import com.nddmwdf.program.dao.NewsDao;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.Assert.assertEquals;

public class TestNews {





    //3.测试删除新闻
    @Test
    public void testdelete()
    {
        NewsDao newsDao=new NewsDao();
        newsDao.deleteNews(7);
    }

    //4.测试获取新闻总数
    @Test
    public void testnumber() throws ClassNotFoundException,SQLException
    {
        NewsDao newsDao=new NewsDao();
        assertEquals(newsDao.getPage(),3);
    }

}
