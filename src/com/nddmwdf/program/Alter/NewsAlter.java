package com.nddmwdf.program.Alter;

import com.nddmwdf.program.dao.NewsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/NewsAlter")
public class NewsAlter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.valueOf(request.getParameter("news_id"));
        String title=new String(request.getParameter("news_title").getBytes("iso-8859-1"),"utf-8");
        String text=new String(request.getParameter("news_text").getBytes("iso-8859-1"),"utf-8");
        String type=new String(request.getParameter("news_type").getBytes("iso-8859-1"),"utf-8");
        String time=new String(request.getParameter("news_time").getBytes("iso-8859-1"),"utf-8");
        String author=new String(request.getParameter("news_author").getBytes("iso-8859-1"),"utf-8");
        NewsDao newsDao=new NewsDao();
        try
        {
            newsDao.alterNews(id,title,text,type,time,author);
            request.getRequestDispatcher("jsp/news_list.jsp").forward(request,response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
