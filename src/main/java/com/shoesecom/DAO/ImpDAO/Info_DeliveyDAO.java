package com.shoesecom.DAO.ImpDAO;

import com.shoesecom.DAO.IInfo_DeliveyDAO;
import com.shoesecom.DbConnect.DBConnect;
import com.shoesecom.Model.Info_delivery;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Info_DeliveyDAO implements IInfo_DeliveyDAO {
    Statement statement = null;
    PreparedStatement ps = null;
    ResultSet rs = null;



    @Override
    public Info_delivery getInfoByOrderID(int order_id) {
        String sql ="SELECT * FROM info_delivery where order_id = ?";

        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(sql);
            ps.setInt(1,order_id);
            rs = ps.executeQuery();
            while (rs.next()){
                return new Info_delivery(rs.getInt("info_id"),
                        order_id,
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("note"));
            }
        } catch (SQLException e) {
            return null;
        }
        return null;

    }

    @Override
    public void addInfoDelivery(Info_delivery infoDelivery) {
        String sql = "insert into info_delivery(order_id, name, phone, address, note) values(?,?,?,?,?)";
        try{
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(sql);
            ps.setInt(1, infoDelivery.getOrder_id());
            ps.setString(2, infoDelivery.getName());
            ps.setString(3, infoDelivery.getPhone());
            ps.setString(4, infoDelivery.getAddress());
            ps.setString(5, infoDelivery.getNote());
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
