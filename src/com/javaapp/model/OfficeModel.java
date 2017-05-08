/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaapp.model;

import com.javaapp.beans.OfficeBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mahesh Nair
 */
public class OfficeModel {

    /*Url for connection*/
    String url = "jdbc:mysql://localhost:3306/master_data";
    Connection conn = null;

    public void createOffice(OfficeBean office) {
        String sql = "INSERT INTO offices "
                + "(officeCode, city, phone,addressLine1,addressLine2,state,country,postalCode,territory)"
                + " VALUES (?,?,?,?,?,?,?,?,?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, "root", "root");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, office.getCode());
            ps.setString(2, office.getCity());
            ps.setString(3, "1234");
            ps.setString(4, office.getAddr1());
            ps.setString(5, office.getAddr2());
            ps.setString(6, office.getState());
            ps.setString(7, office.getCountry());
            ps.setString(8, office.getPostal());
            ps.setString(9, office.getTerritory());
            ps.executeUpdate();
            ps.close();

        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }

    }

    public List<OfficeBean> getOffices() {
        String sql = "select * from offices";
        List<OfficeBean> officeList = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, "root", "root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            OfficeBean offBean;
            while (rs.next()) {
                offBean = new OfficeBean();
                offBean.setCode(rs.getString("officeCode"));
                offBean.setCity(rs.getString("city"));
                offBean.setPostal(rs.getString("postalCode"));
                offBean.setAddr1(rs.getString("addressLine1"));
                offBean.setAddr2(rs.getString("addressLine2"));
                offBean.setState(rs.getString("state"));
                offBean.setCountry(rs.getString("country"));
                offBean.setTerritory(rs.getString("territory"));
                officeList.add(offBean);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }
        return officeList;
    }

    public OfficeBean getOffice(String code) {
        String sql = "select * from offices where officeCode= " + code;
        List<OfficeBean> officeList = new ArrayList<>();
        OfficeBean offBean = new OfficeBean();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, "root", "root");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                offBean.setCode(rs.getString("officeCode"));
                offBean.setCity(rs.getString("city"));
                offBean.setPostal(rs.getString("postalCode"));
                offBean.setAddr1(rs.getString("addressLine1"));
                offBean.setAddr2(rs.getString("addressLine2"));
                offBean.setState(rs.getString("state"));
                offBean.setCountry(rs.getString("country"));
                offBean.setTerritory(rs.getString("territory"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }
        return offBean;

    }

    public void update(OfficeBean office) {

//         String sql = "select * from offices set city='"+off.getCity()+"'addressLine1="+off.getAddr1()
//                 + " where officeCode= " + off.getCode();
        String sql = "update offices set city=? ,addressLine1=?,addressLine2=?,state=?,country=?,postalCode=?,territory=? where officeCode =?";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, "root", "root");
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, office.getCity());
            ps.setString(2, office.getAddr1());
            ps.setString(3, office.getAddr2());
            ps.setString(4, office.getState());
            ps.setString(5, office.getCountry());
            ps.setString(6, office.getPostal());
            ps.setString(7, office.getTerritory());
            ps.setString(8, office.getCode());
            ps.executeUpdate();
            ps.close();

        } catch (Exception e) {
            throw new RuntimeException(e);

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                }
            }
        }

    }
}
