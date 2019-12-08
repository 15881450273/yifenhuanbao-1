package com.nddmwdf.program.page;

import com.nddmwdf.program.dao.GarbageDao;
import com.nddmwdf.program.dao.NewsDao;
import com.nddmwdf.program.entity.Garbage;
import com.nddmwdf.program.entity.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/NewsPage")
public class NewsPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageno1 = request.getParameter("npageno");
        int newspageno = Integer.parseInt(pageno1);
        //System.out.println("JSP中传来的参数pageno="+pageno);
        NewsDao nd = new NewsDao();
        List<News> news = new ArrayList();
        try {
            news = nd.queryuserlimit(newspageno);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            //获取总页数的值
            int pagenum = nd.getPage()/5;
            //获取总记录条数的值
            int newsnum = nd.getPage();
            int tmp = nd.getPage()%5;
            if (tmp>0)
                pagenum++;
            request.setAttribute("npageno", newspageno);
            request.setAttribute("npagenum", pagenum);
            //传递usernum的值
            request.setAttribute("nnum", newsnum);
            //传递保存Garbage对象的集合gbg
            request.setAttribute("news", news);
            request.getRequestDispatcher("jsp/news_list.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
