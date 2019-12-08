package com.nddmwdf.program.delete;

import com.nddmwdf.program.dao.GarbageDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GarbageDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GarbageDao garbageDao=new GarbageDao();
        int garbageid=Integer.parseInt(request.getParameter("garbageid"));
        try
        {
            garbageDao.deleteGarbage(garbageid);
            request.getRequestDispatcher("jsp/garbage_list.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            request.getRequestDispatcher("error.jsp").forward(request, response);
            e.printStackTrace();
        }
    }
}
