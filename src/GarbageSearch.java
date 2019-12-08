import com.nddmwdf.program.dao.GarbageDao;
import com.nddmwdf.program.entity.Garbage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/GarbageSearch")
public class GarbageSearch extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
        String garbage_name = new String(request.getParameter("garbage_name").getBytes("iso-8859-1"),"utf-8");
        //user.setAddr(user_addr);
        System.out.println(garbage_name);
        PrintWriter out=response.getWriter();
        GarbageDao dao = new GarbageDao();
        List<Garbage> user_list = dao.search(garbage_name);
        if(user_list.isEmpty())
        {
            out.print("<script>alert('未找到查询项');</script>");
            out.print("<script>window.location='/forjsp/garbage.jsp'; </script>");
            out.close();
        }
        else {
            request.setAttribute("user_list",user_list);
            int a = user_list.size();
            request.setAttribute("list_size",a);
            request.getRequestDispatcher("/forjsp/search_result.jsp").forward(request, response);
        }
    }
}
