import com.nddmwdf.program.entity.Garbage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/GabageInfo")
public class GarbageInfo extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Garbage garbage=new Garbage();
        //String name=new String(request.getParameter("garbagename").getBytes("iso-8859-1"),"utf-8");
        //String type=new String(request.getParameter("garbagetype").getBytes("iso-8859-1"),"utf-8");
        //String des=new String(request.getParameter("garbagedes").getBytes("iso-8859-1"),"utf-8");
        String name=request.getParameter("garbagename");
        String type=request.getParameter("garbagetype");
        String des=request.getParameter("garbagedes");
        garbage.setType(type);
        garbage.setName(name);
        garbage.setContent(des);
        try {
            request.setAttribute("garbage", garbage);
            request.getRequestDispatcher("forjsp/garbageinfo.jsp").forward(request, response);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }


}
