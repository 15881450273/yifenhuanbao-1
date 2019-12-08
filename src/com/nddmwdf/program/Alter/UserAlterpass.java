package com.nddmwdf.program.Alter;

import com.nddmwdf.program.dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/userAlterpass")
public class UserAlterpass extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginname=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
        String newpass=new String(request.getParameter("newpassword").getBytes("iso-8859-1"),"utf-8");
        UserDao userDao=new UserDao();
        response.setCharacterEncoding("GBK");
        PrintWriter out=response.getWriter();
        try
        {
            userDao.alterPass(loginname,newpass);
            request.setAttribute("username",loginname);
            out.print("<script>alert('修改成功');</script>");
            out.print("<script>window.location='/forjsp/user_center.jsp'; </script>");
            out.close();
            //request.getRequestDispatcher("forjsp/user_center.jsp").forward(request,response);
        }
        catch (Exception e)
        {
            out.print("<script>alert('修改失败');</script>");
            e.printStackTrace();
        }
    }
}
