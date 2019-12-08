package com.nddmwdf.program.dao;

import com.nddmwdf.program.entity.News;
import com.nddmwdf.program.entity.Type;
import com.nddmwdf.program.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TypeDao {

    public Type getType(String name) throws SQLException
    {
        String sql="select * from type where type_name = '" + name +"'";
        DbUtil dbUtil = new DbUtil();
        Connection con = dbUtil.getConnection();
        ResultSet resultSet = null;
        PreparedStatement ps = con.prepareStatement(sql);
        resultSet = ps.executeQuery();
        Type type=new Type();
        while (resultSet.next()) {
            type.setType_name(resultSet.getString("type_name"));
            type.setType_content(resultSet.getString("type_content"));
            type.setType_clude(resultSet.getString("type_clude"));
        }
        resultSet.close();
        ps.close();
        dbUtil.closeCon();
        return type;
    }
}
