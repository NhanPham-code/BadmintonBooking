/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Customer;


/**
 *
 * @author PC
 */
public class customerDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();
    
    public Customer getCustomerNyID(String customerID){
        Customer customer = new Customer();
        String sql = "Select * from Customer where customer_ID=?";
         try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                customer.setCustomer_ID(customerID);
                customer.setCustomer_Name(rs.getString(2));
                customer.setCustomer_Phone(rs.getString(3));
                customer.setAcc_ID(rs.getString(4));
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return customer;
    }
    
    public static void main(String[] args) {
        customerDAO cDAO= new customerDAO();
        Customer c = new Customer();
        c= cDAO.getCustomerNyID("CUST001");
        System.out.println(c.getCustomer_Name());
    }
}
