package com.nddmwdf.program.servlet;

import com.nddmwdf.program.dao.GarbageDao;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

public class GarbageServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        GarbageDao garbageDao=new GarbageDao();
        String gname = new String(request.getParameter("gname").getBytes("iso-8859-1"),"utf-8");
        String gdesc = new String(request.getParameter("gdesc").getBytes("iso-8859-1"),"utf-8");
        //String gpic=new String(request.getParameter("gpic").getBytes("iso-8859-1"),"utf-8");
        String gtype=new String(request.getParameter("gtype").getBytes("iso-8859-1"),"utf-8");
        String method=new String(request.getParameter("method").getBytes("iso-8859-1"),"utf-8");
        PrintWriter out=response.getWriter();
        try {
            if(method.equals("addgarbage")) {
                if (garbageDao.isExists(gname)==0) {
                    garbageDao.addGarbage(gname, gdesc, gtype);
                    out.print("<script>alert('添加成功');</script>");
                    out.print("<script>window.location='/jsp/garbage_list.jsp'; </script>");
                    out.close();
                }
                else
                {
                    out.print("<script>alert('已存在相同名称的垃圾');</script>");
                    out.print("<script>window.location='/jsp/garbage_list.jsp'; </script>");
                    out.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
