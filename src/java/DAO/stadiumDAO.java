/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Stadium;
import model.StadiumOwner;

/**
 *
 * @author nhanPH
 */
public class stadiumDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public List<Stadium> getAllStadium() {
        stadiumOwnerDAO stoDAO = new stadiumOwnerDAO();
        List<Stadium> stadiumList = new ArrayList<>();
        String sql = "select * from Stadium";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Stadium st = new Stadium();
                st.setStadium_ID(rs.getString("stadium_ID"));
                st.setStadium_name(rs.getString("stadium_name"));
                st.setStadium_address(rs.getString("stadium_address"));
                st.setStadium_phone(rs.getString("stadium_phone"));
                st.setOpentime(rs.getString("opentime"));
                st.setStadium_image(rs.getString("stadium_image"));
                st.setAvg_ratingScore(rs.getDouble("avg_ratingScore"));
                st.setPricePerHour(rs.getInt("pricePerHour"));
                st.setQRcode(rs.getString("QRCode"));
                // get stadium owner of stadium
                StadiumOwner sto = stoDAO.getStadiumOwnerById(rs.getString("owner_ID"));
                st.setOwner(sto);

                stadiumList.add(st);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return stadiumList;
    }

    public static void main(String[] args) {
        stadiumDAO stDAO = new stadiumDAO();

        List<Stadium> stList = new ArrayList<>();
        stList = stDAO.getAllStadium();

        for (int i = 0; i < stList.size(); i++) {
            Stadium st = stList.get(i);
            System.out.println(st.getStadium_name());
            System.out.println(st.getAvg_ratingScore());
        }
    }
}
