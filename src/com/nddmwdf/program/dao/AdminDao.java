package com.nddmwdf.program.dao;

import com.nddmwdf.program.entity.Admin;
import com.nddmwdf.program.util.DbUtil;

import java.sql.*;

public class AdminDao {

    public int isExists(String uname)
    {
        String sql="SELECT * from admins where loginName=?";
        DbUtil dbUtil=new DbUtil();
        Connection con=dbUtil.getConnection();
        PreparedStatement ps=null;
        ResultSet resultSet=null;
        Admin admin=null;
        try
        {
            ps=(PreparedStatement)con.prepareStatement(sql);
            ps.setString(1,uname);
            resultSet=(ResultSet)ps.executeQuery();
            if(resultSet.next())
            {
                admin=new Admin();
                admin.setUserid(resultSet.getInt("userid"));
                admin.setLoginName(resultSet.getString("loginName"));
            }
            resultSet.close();
            ps.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        if(admin!=null)
        {
            return 1;
        }
        dbUtil.closeCon();
        return 0;
    }

    public void addUser(String username,String pass)
    {
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        String sql="INSERT INTO admins(loginName,loginPass) VALUES('"  + username + "','" + pass + "')";
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbUtil.closeCon();
    }

    public boolean validate(Admin admin)
    {
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        DbUtil dbUtil=new DbUtil();
        boolean valid=false;
        String sql="select * from admins where loginName=? and loginPass=?";
        con =dbUtil.getConnection();
        try{
            pst=con.prepareStatement(sql);
            pst.setString(1,admin.getLoginName());
            pst.setString(2,admin.getLoginPass());
            rs=pst.executeQuery();
            if(rs.next())
            {
                valid=true;
            }
            pst.close();
            rs.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        dbUtil.closeCon();
        return valid;
    }
}
