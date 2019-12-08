package com.nddmwdf.program.dao;

import com.nddmwdf.program.entity.Garbage;
import com.nddmwdf.program.entity.News;
import com.nddmwdf.program.util.DbUtil;

import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDao {
    public void addNews(String title,String text,String type,String time,String author)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "INSERT INTO news(news_title,news_text,news_type,news_time,news_author) VALUES('"  + title + "','" + text +"','" + type +"','"+ time +"','" + author + "')";
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }

    public void deleteNews(int id)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "DELETE FROM news where news_id = '"+ id+"'" ;
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }

    public void alterNews(int nid,String title,String text,String type,String time,String author)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "UPDATE news SET news_title='"+title+"',news_text='"+text+"',news_type='"+type+"',news_time='"+time+"',news_author='"+author+"' where news_id='"+nid+"'";
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }

    public List<News> queryuserlimit(int pageno) throws ClassNotFoundException ,SQLException
    {
        String sql="select * from news limit ?,?";
        DbUtil dbUtil=new DbUtil();
        ResultSet rs;
        Connection connection=dbUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,(pageno*5)-5);
        ps.setInt(2,5);
        rs=ps.executeQuery();
        List<News> gb = new ArrayList();
        while(rs.next()){
            News news = new News();
            news.setId(rs.getInt("news_id"));
            news.setTitle(rs.getString("news_title"));
            news.setText(rs.getString("news_text"));
            news.setTime(rs.getString("news_time"));
            news.setAuthor(rs.getString("news_author"));
            gb.add(news);
        }
        rs.close();
        ps.close();
        dbUtil.closeCon();
        return gb;
    }

    public int getPage() throws SQLException,ClassNotFoundException
    {
        String sql="SELECT count(*) from news";
        DbUtil dbUtil=new DbUtil();
        Connection con=dbUtil.getConnection();
        ResultSet resultSet;
        int totalnews;
        try
        {
            Statement st=con.createStatement();
            resultSet=st.executeQuery(sql);
            resultSet.next();
            totalnews=resultSet.getInt(1);
            resultSet.close();
            return totalnews;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return 0;
    }

    public List<News> typenews(String type) throws ClassNotFoundException ,SQLException
    {
        String sql="SELECT * FROM news where news_type ='"+type +"'";
        DbUtil dbUtil=new DbUtil();
        Connection connection=dbUtil.getConnection();
        ResultSet resultSet;
        PreparedStatement ps = connection.prepareStatement(sql);
        resultSet=ps.executeQuery();
        List<News> nw = new ArrayList();
        while (resultSet.next())
        {
            News news = new News();
            //news.setId(resultSet.getInt("news_id"));
            news.setTitle(resultSet.getString("news_title"));
            news.setText(resultSet.getString("news_text"));
            news.setTime(resultSet.getString("news_time"));
            news.setAuthor(resultSet.getString("news_author"));
            nw.add(news);
        }
        resultSet.close();
        ps.close();
        dbUtil.closeCon();
        return nw;
    }

    public News newsFind(String title) throws SQLException {
        String sql="select * from news where news_title = '" + title +"'";
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        ResultSet resultSet = null;
        PreparedStatement ps = con.prepareStatement(sql);
        resultSet = ps.executeQuery();
        News news = new News();
        while (resultSet.next()) {
            news.setId(resultSet.getInt("news_id"));
            news.setTitle(resultSet.getString("news_title"));
            news.setText(resultSet.getString("news_text"));
            news.setTime(resultSet.getString("news_time"));
            news.setAuthor(resultSet.getString("news_author"));
        }
        resultSet.close();
        ps.close();
        dbUtil.closeCon();
        return news;
    }
}
