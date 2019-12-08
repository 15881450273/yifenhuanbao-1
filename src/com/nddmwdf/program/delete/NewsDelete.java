package com.nddmwdf.program.delete;

import com.nddmwdf.program.dao.NewsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/NewsDelete")
public class NewsDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.valueOf(request.getParameter("news_id"));
        NewsDao newsDao=new NewsDao();
        try
        {
            newsDao.deleteNews(id);
            request.getRequestDispatcher("jsp/news_list.jsp").forward(request,response);
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("error.jsp").forward(request,response);
            e.printStackTrace();
        }
    }
}
