package com.nddmwdf.program.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class methodmix {
    public static boolean addUpdateDelete(String sql,Object[] arr) throws ClassNotFoundException, SQLException{
        Connection con;
        PreparedStatement ps;
        DbUtil dbUtil=new DbUtil();
        try {
            con=dbUtil.getConnection();//第一步 ：连接数据库的操作

            ps=con.prepareStatement(sql);//第二步：预编译
            //第三步：设置值
            if(arr!=null && arr.length!=0){
                for(int i=0;i<arr.length;i++){
                    ps.setObject(i+1, arr[i]);
                }
            }
            int count=ps.executeUpdate();//第四步：执行sql语句
            if(count>0){
                return true;
            }else{
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
}
