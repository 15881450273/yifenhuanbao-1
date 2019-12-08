package com.nddmwdf.program.Alter;

import com.nddmwdf.program.dao.GarbageDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GabageAlter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        int id=Integer.parseInt(request.getParameter("gid"));
        GarbageDao garbageDao=new GarbageDao();
        String gname = new String(request.getParameter("gname").getBytes("iso-8859-1"),"utf-8");
        String gdesc = new String(request.getParameter("gdesc").getBytes("iso-8859-1"),"utf-8");
        //String gpic = new String(request.getParameter("gpic").getBytes("iso-8859-1"),"utf-8");
        String gtype = new String(request.getParameter("gtype").getBytes("iso-8859-1"),"utf-8");
        try
        {
            garbageDao.alterGarbage(id,gname,gdesc,gtype);
            request.getRequestDispatcher("jsp/garbage_list.jsp").forward(request,response);
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("error.jsp").forward(request,response);
            e.printStackTrace();
        }
    }
}
