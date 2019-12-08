package com.nddmwdf.program.page;

import com.nddmwdf.program.dao.UserDao;
import com.nddmwdf.program.entity.User;
import com.nddmwdf.program.util.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UserPage")
public class UserPage extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String pageno1 = request.getParameter("pageno");
            int userpageno = Integer.parseInt(pageno1);
            //System.out.println("JSP中传来的参数pageno="+pageno);
            UserDao ul = new UserDao();
            List<User> us = new ArrayList();
            try {
                us = ul.queryuserlimit(userpageno);
            } catch (ClassNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            try {
                //获取总页数的值
                int pagenum = ul.getPage()/5;
                //获取总记录条数的值
                int usernum = ul.getPage();
                int tmp = ul.getPage()%5;
                if (tmp>0)
                    pagenum++;
                request.setAttribute("pageno", userpageno);
                request.setAttribute("pagenum", pagenum);
                //传递usernum的值
                request.setAttribute("usernum", usernum);
                //传递保存User对象的集合us
                request.setAttribute("us", us);
                request.getRequestDispatcher("jsp/member_list.jsp").forward(request, response);
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
    }
}
