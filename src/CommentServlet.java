import com.nddmwdf.program.util.methodmix;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().append("Served at: ").append(request.getContextPath());
        methodmix method=new methodmix();
        //获取评论相关信息，把评论写入数据库
        int M_id = (int)request.getSession().getAttribute("M_id");
        String Comment_message = request.getParameter("comment_message");
        Date date = new Date();
        int B_id = Integer.parseInt(request.getParameter("B_id"));
        int T_id=Integer.parseInt(request.getParameter("T_id"));
        int U_id =Integer.parseInt(request.getParameter("U_id"));
        //对象数组，后面传参给sql语句用
        List<Object> list = new ArrayList<>();
        list.add(M_id);
        list.add(Comment_message);
        list.add(date);
        list.add(B_id);
        list.add(T_id);
        list.add(U_id);
        PrintWriter out=response.getWriter();
        String sql = "INSERT INTO message_port VALUE(?,?,?,?,?,?)";
        boolean flag= false;
        try {
            flag = method.addUpdateDelete(sql,list.toArray());//函数，传参以及执行等步骤，返回一个布尔值
        } catch ( SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(flag)
        {
            //request.setAttribute("flag",true);
            out.print("<script>alert('发布成功');</script>");
            out.print("<script>window.location='/forjsp/message.jsp'; </script>");
            out.close();
            response.sendRedirect(request.getHeader("Referer"));
            //request.getRequestDispatcher("/jsp/invitation.jsp").forward(request, response);
        }
        else
        {
            //request.setAttribute("flag",false);
            response.setCharacterEncoding("UTF-8");
            response.sendRedirect(request.getHeader("Referer"));
        }
    }
}
