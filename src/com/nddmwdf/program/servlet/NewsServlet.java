package com.nddmwdf.program.servlet;

import com.nddmwdf.program.dao.NewsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title=new String(request.getParameter("news_title").getBytes("iso-8859-1"),"utf-8");
        String text=new String(request.getParameter("news_text").getBytes("iso-8859-1"),"utf-8");
        String type=new String(request.getParameter("news_type").getBytes("iso-8859-1"),"utf-8");
        String time=new String(request.getParameter("news_time").getBytes("iso-8859-1"),"utf-8");
        String author=new String(request.getParameter("news_author").getBytes("iso-8859-1"),"utf-8");
        NewsDao newsDao=new NewsDao();
        try
        {
            newsDao.addNews(title,text,type,time,author);
            request.getRequestDispatcher("jsp/news_list.jsp").forward(request,response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
