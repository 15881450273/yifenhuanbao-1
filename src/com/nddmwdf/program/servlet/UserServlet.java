package com.nddmwdf.program.servlet;

import com.nddmwdf.program.dao.UserDao;
import com.nddmwdf.program.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String name = new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
        String pass = new String(request.getParameter("passwd").getBytes("iso-8859-1"),"utf-8");
        //String akaname = new String(request.getParameter("akaname").getBytes("iso-8859-1"),"utf-8");
        //String sex= new String(request.getParameter("usex").getBytes("iso-8859-1"),"utf-8");
        String akaname = "aka";
        String sex="男";
        UserDao userDao=new UserDao();
        User user=new User();
        user.setLoginName(name);
        user.setLoginPass(pass);
        PrintWriter out=response.getWriter();
        try {
            if(userDao.isExists(name)==0) {
                userDao.addUser(name, pass, akaname, sex);
                out.print("<script>alert('注册成功');</script>");
                out.print("<script>window.location='/forjsp/login.jsp'; </script>");
                out.close();
//                request.getRequestDispatcher("forjsp/login.jsp").forward(request, response);
            }
            else
            {
                out.print("<script>alert('注册失败');</script>");
                out.print("<script>window.location='/forjsp/register.jsp'; </script>");
                out.close();
//                request.getRequestDispatcher("forjsp/register.jsp").forward(request,response);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();

        }
    }
}
