import com.nddmwdf.program.dao.NewsDao;
import com.nddmwdf.program.entity.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/NewsInfo")
public class NewsInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newsname=request.getParameter("title");
        NewsDao newsDao=new NewsDao();
        try {
            News news = newsDao.newsFind(newsname);
            request.setAttribute("news",news);
            request.getRequestDispatcher("/forjsp/newinfo.jsp").forward(request,response);
        }
        catch (SQLException se)
        {
            se.printStackTrace();
        }
    }
}
