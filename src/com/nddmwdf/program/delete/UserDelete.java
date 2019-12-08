package com.nddmwdf.program.delete;

import com.nddmwdf.program.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserDelete")
public class UserDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
        UserDao userDao=new UserDao();
        try {
            userDao.deleteUser(username);
            request.getRequestDispatcher("jsp/member_list.jsp").forward(request,response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request,response);
        }
    }
}
