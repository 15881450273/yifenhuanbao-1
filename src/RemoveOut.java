import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RemoveOut")
public class RemoveOut extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName=null;
        request.getSession().setAttribute("username",userName);
        PrintWriter out=response.getWriter();
        out.print("<script>alert('break link');</script>");
        out.print("<script>window.location='/forjsp/index.jsp'; </script>");
        out.close();
    }
}
