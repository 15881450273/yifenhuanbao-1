import com.nddmwdf.program.dao.UserDao;
import com.nddmwdf.program.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        User user=new User();
        UserDao userDao=new UserDao();
        String name=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
        String pwd=new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
        System.out.println(name);
        user.setLoginName(name);
        user.setLoginPass(pwd);
        String userName=user.getLoginName();
        PrintWriter out=response.getWriter();
        try
        {
            if(userDao.validateUser(user))
            {
                request.getSession().setAttribute("username",userName);
                out.print("<script>alert('登录成功');</script>");
                out.print("<script>window.location='/forjsp/index.jsp'; </script>");
                out.close();
            }
            else
            {
                out.print("<script>alert('登录失败了，看看是不是密码输错了。');</script>");
                out.print("<script>window.location='/forjsp/login.jsp'; </script>");
                out.close();
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
