package com.nddmwdf.program.dao;

import com.nddmwdf.program.entity.Message_port;
import com.nddmwdf.program.entity.User;
import com.nddmwdf.program.entity.invitation;
import com.nddmwdf.program.util.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    public void deleteUser(String name)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "DELETE FROM users where user_loginName = '"+name +"'" ;
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }

    public void addUser(String loginName,String loginPass,String name,String sex)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con=dbUtil.getConnection();
        String sql="INSERT INTO users (user_loginName,user_loginPass,user_Name,user_Sex) VALUES ('" + loginName +"','"+ loginPass+ "','"+name+"','"+sex+"')";
        try
        {
            Statement st=con.createStatement();
            st.executeUpdate(sql);
            st.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }

    public void alterUser(String username,String akaname, String sex) throws SQLException, ClassNotFoundException
    {
        DbUtil dbUtil = new DbUtil();
        Connection con=dbUtil.getConnection();
        String sql = "UPDATE users SET user_Name='"+akaname+"',user_Sex='"+sex+"' where user_loginName='"+username+"'";
        Statement st=con.createStatement();
        st.executeUpdate(sql);
        st.close();
        dbUtil.closeCon();
    }

    public boolean validateUser(User user)
    {
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        DbUtil dbUtil=new DbUtil();
        boolean valid=false;
        String sql="select * from users where user_loginName=? and user_loginPass=?";
        con =dbUtil.getConnection();
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1,user.getLoginName());
            pst.setString(2,user.getLoginPass());
            rs=pst.executeQuery();
            if(rs.next())
            {
                valid=true;
            }
            rs.close();
            pst.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return valid;
    }

    public int isExists(String uname)
    {
        String sql="SELECT * from users where user_loginName=?";
        DbUtil dbUtil=new DbUtil();
        Connection con=dbUtil.getConnection();
        PreparedStatement ps=null;
        ResultSet resultSet=null;
        User user=null;
        try
        {
            ps=(PreparedStatement)con.prepareStatement(sql);
            ps.setString(1,uname);
            resultSet=(ResultSet)ps.executeQuery();
            if(resultSet.next())
            {
                user=new User();
                user.setId(resultSet.getInt("user_id"));
                user.setLoginName(resultSet.getString("user_loginName"));
            }
            resultSet.close();
            ps.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        if(user!=null)
        {
            return 1;
        }
        dbUtil.closeCon();
        return 0;
    }

    public List<User> queryuserlimit(int pageno) throws ClassNotFoundException ,SQLException
    {
        String sql="select * from users limit ?,?";
        DbUtil dbUtil=new DbUtil();
        ResultSet rs;
        Connection connection=dbUtil.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1,(pageno*5)-5);
        ps.setInt(2,5);
        rs=ps.executeQuery();
        List<User> us = new ArrayList();
        while(rs.next()){
            User user = new User();
            user.setSex(rs.getString("user_Sex"));
            user.setLoginName(rs.getString("user_loginName"));
            user.setName(rs.getString("user_Name"));
            us.add(user);
        }
        rs.close();
        ps.close();
        dbUtil.closeCon();
        return us;
    }

    public int getPage() throws SQLException,ClassNotFoundException
    {
        String sql="SELECT count(*) from users";
        DbUtil dbUtil=new DbUtil();
        Connection con=dbUtil.getConnection();
        ResultSet resultSet;
        int totalnum;
        try
        {
            Statement st=con.createStatement();
            resultSet=st.executeQuery(sql);
            resultSet.next();
            totalnum=resultSet.getInt(1);
            resultSet.close();
            st.close();
            return totalnum;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        dbUtil.closeCon();
        return 0;
    }

    public void alterPass(String name,String newpass)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql = "UPDATE users SET user_loginPass='"+newpass+"' where user_loginName='"+name+"'";
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }

    public User getUser(String loginname) throws SQLException,ClassNotFoundException
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql="Select * from users where user_loginName ='"+loginname+"'";
        User user=new User();
        ResultSet rs;
        PreparedStatement ps = con.prepareStatement(sql);
        rs=ps.executeQuery();
        while(rs.next())
        {
            user.setId(Integer.parseInt(rs.getString("user_id")));
            user.setName(rs.getString("user_Name"));
            user.setLoginName(rs.getString("user_loginName"));
            user.setSex(rs.getString("user_Sex"));
        }
        rs.close();
        ps.close();
        dbUtil.closeCon();
        return user;
    }

    //取出帖子表，返回一个帖子数组集合
    public ArrayList<invitation> post_invitation(int user_id, int post_id) throws ClassNotFoundException
    {
        ArrayList<invitation> invitationArrayList = new ArrayList<>();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        DbUtil dbUtil = new DbUtil();
        try {
            //链接数据库
            con = dbUtil.getConnection();
            //MySQL语句
            String sql = "SELECT * FROM post_t  order by post_t.T_time desc  ";//论坛页面需要全部帖子的sql查询语句
            String sql1 = "SELECT * FROM post_t where user_id = ? and T_id = ? order by post_t.T_time desc  ";//回复页面查具体帖子需要的sql语句
            if (post_id < 0) {
                ps = con.prepareStatement(sql);//预编译
                rs = ps.executeQuery();//执行
            } else {
                ps = con.prepareStatement(sql1);//预编译
                ps.setObject(1, user_id);
                ps.setObject(2, post_id);
                rs = ps.executeQuery();
            }
            invitation inv;

            while (rs.next()) {
                inv = new invitation();
                inv.setUser_id(rs.getInt("user_id"));
                inv.setPost_topic(rs.getString("T_topic"));
                inv.setPost_content(rs.getString("T_content"));
                inv.setPost_time(rs.getString("T_time"));
                inv.setPost_id(rs.getInt("T_id"));
                invitationArrayList.add(inv);
            }
            if (rs.next()) {
                return null;
            }
            rs.close();
            ps.close();

        } catch (SQLException  e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return invitationArrayList;
    }
    //取出评论，返回一个评论的集合数组
    public ArrayList<Message_port> port_Message(int t_id, int u_id) {
        ArrayList<Message_port> message_list = new ArrayList<>();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        DbUtil dbUtil=new DbUtil();
        try {
            //链接数据库
            con = dbUtil.getConnection();
            //MySQL语句
            String sql = "SELECT * FROM message_port WHERE T_id = ? and U_id =? order by message_port.M_time  ";//论坛页面每个文章下的评论，查询语句
            String sql1 = "SELECT * FROM message_port WHERE B_id = ? GROUP BY U_id,T_id,M_id order by M_time desc ";//回复页面需要的查询语句
            if (t_id < 0) {
                ps = con.prepareStatement(sql1);//预编译
                ps.setObject(1, u_id);
                rs = ps.executeQuery();//执行语句

            } else {
                ps = con.prepareStatement(sql);//预编译
                ps.setObject(1, t_id);
                ps.setObject(2, u_id);
                rs = ps.executeQuery();//执行语句
            }
            Message_port msg;

            while (rs.next()) {
                msg = new Message_port();
                msg.setMessage_port_id(rs.getInt("M_id"));
                msg.setMessage_content(rs.getString("M_content"));
                msg.setMessage_time(rs.getString("M_time"));
                msg.setUser_id(rs.getInt("U_id"));
                msg.setPost_id(rs.getInt("T_id"));
                msg.setB_id(rs.getInt("B_id"));
                message_list.add(msg);
            }
            //DBUtil.closeCon(con,ps,rs);
            rs.close();
            ps.close();
        } catch (SQLException e)
        {
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return message_list;
    }
    //上面方法的特殊情况需要的方法，回复页面特定情况的评论集合获取以及返回
    public ArrayList<Message_port> port_Message1(int t_id, int u_id, int m_id) throws ClassNotFoundException
    {
        ArrayList<Message_port> message_list = new ArrayList<>();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        DbUtil dbUtil=new DbUtil();
        try {
            //链接数据库
            con =dbUtil.getConnection();
            //MySQL语句
            String sql = "SELECT * FROM message_port WHERE ( T_id = ? and U_id =? ) and (M_id = ?  or (B_id = ? and M_id = ?)) order by message_port.M_time  ";
            String sql1 = "SELECT * FROM message_port WHERE B_id = ? GROUP BY U_id,T_id,M_id order by M_time";
            if (t_id < 0) {
                ps = con.prepareStatement(sql1);//预编译
                ps.setObject(1, u_id);
                rs = ps.executeQuery();//执行语句
            } else {
                ps = con.prepareStatement(sql);//预编译
                ps.setObject(1, t_id);
                ps.setObject(2, u_id);
                ps.setObject(3, m_id);
                ps.setObject(4, m_id);
                ps.setObject(5,u_id);

                rs = ps.executeQuery();//执行语句
            }
            Message_port msg;

            while (rs.next()) {
                msg = new Message_port();
                msg.setMessage_port_id(rs.getInt("M_id"));
                msg.setMessage_content(rs.getString("M_content"));
                msg.setMessage_time(rs.getString("M_time"));
                msg.setUser_id(rs.getInt("U_id"));
                msg.setPost_id(rs.getInt("T_id"));
                msg.setB_id(rs.getInt("B_id"));
                message_list.add(msg);
            }
            //DBUtil.closeCon(con,ps,rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return message_list;
    }

    public User getUser(int id) throws SQLException
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql="Select * from users where user_id ='"+id+"'";
        User user=new User();
        ResultSet rs;
        PreparedStatement ps = con.prepareStatement(sql);
        rs=ps.executeQuery();
        while(rs.next())
        {
            //user.setId(Integer.parseInt(rs.getString("user_id")));
            user.setName(rs.getString("user_Name"));
            user.setLoginName(rs.getString("user_loginName"));
            user.setSex(rs.getString("user_Sex"));
        }
        rs.close();
        ps.close();
        dbUtil.closeCon();
        return user;
    }

}
