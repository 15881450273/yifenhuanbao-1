package com.nddmwdf.program.page;

import com.nddmwdf.program.dao.GarbageDao;
import com.nddmwdf.program.dao.UserDao;
import com.nddmwdf.program.entity.Garbage;
import com.nddmwdf.program.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/GarbagePage")
public class GarbagePage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageno1 = request.getParameter("gpageno");
        int garbagepageno = Integer.parseInt(pageno1);
        //System.out.println("JSP中传来的参数pageno="+pageno);
        GarbageDao gb = new GarbageDao();
        List<Garbage> gbg = new ArrayList();
        try {
            gbg = gb.queryuserlimit(garbagepageno);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            //获取总页数的值
            int pagenum = gb.getPage()/5;
            //获取总记录条数的值
            int garbagenum = gb.getPage();
            int tmp = gb.getPage()%5;
            if (tmp>0)
                pagenum++;
            request.setAttribute("gpageno", garbagepageno);
            request.setAttribute("gpagenum", pagenum);
            //传递usernum的值
            request.setAttribute("gnum", garbagenum);
            //传递保存Garbage对象的集合gbg
            request.setAttribute("gbg", gbg);
            request.getRequestDispatcher("jsp/garbage_list.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
