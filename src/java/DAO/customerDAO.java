/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    /**
     * Author: NhiTCU
     *
     * @param customerID
     * @return
     */
    public Customer getCustomerByID(String customerID) {
        Customer customer = new Customer();
        String sql = "Select * from Customer where customer_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customerID);
            rs = ps.executeQuery();
            if (rs.next()) {
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

    /**
     * Author: NhiTCU
     *
     * @return
     */
    public Customer getCustomerByAcc_ID(String accID) {
        Customer customer = null;
        String sql = "Select * from Customer where acc_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, accID);
            rs = ps.executeQuery();
            if (rs.next()) {
                customer = new Customer();
                customer.setCustomer_ID(rs.getString(1));
                customer.setCustomer_Name(rs.getString(2));
                customer.setCustomer_Phone(rs.getString(3));
                customer.setAcc_ID(rs.getString(4));
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return customer;
    }

    /**
     * Author: NhiTCU
     *
     * @return
     */
    public List<Customer> getAllCustomer() {
        List<Customer> cusList = new ArrayList<>();
        String sql = "select * from Customer";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Customer ac = new Customer();
                ac.setCustomer_ID(rs.getString("customer_ID"));
                ac.setCustomer_Name(rs.getString("customer_name"));
                ac.setCustomer_Phone(rs.getString("customer_phone"));
                ac.setAcc_ID(rs.getString("acc_ID"));

                cusList.add(ac);
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return cusList;
    }

    /**
     * Author: NhiTCU //CHUA SUA
     *
     * @return
     */
    public int addNewCus(Customer cus) {
        int check = 0;
        String getMaxCusID = "SELECT MAX(customer_ID) FROM Customer";
        int maxNumber = 0;
        String newCustomerID = null;

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(getMaxCusID);
            rs = ps.executeQuery();

            if (rs.next()) {
                String maxCusID = rs.getString(1);
                // Extract the numeric part from the maximum account_ID
                maxNumber = Integer.parseInt(maxCusID.substring(4)); // Assuming "ACC" prefix
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (int i = 1; i <= maxNumber + 1; i++) {
            String proposedCusID = "CUST" + i;
            boolean cusIDExists = false;

            // Check if proposedCusID already exists in the database
            String checkAccountIDExists = "SELECT COUNT(*) FROM Customer WHERE customer_ID = ?";
            try {
                ps = conn.prepareStatement(checkAccountIDExists);
                ps.setString(1, proposedCusID);
                rs = ps.executeQuery();

                if (rs.next()) {
                    if (rs.getInt(1) > 0) {
                        cusIDExists = true;
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (!cusIDExists) {
                newCustomerID = proposedCusID;
                break;
            }
        }

        if (newCustomerID == null) {
            return check; //Không thể tạo mới Account_ID!
        }

        String sql = "INSERT INTO [dbo].[customer]\n"
                + "           ([customer_ID]\n"
                + "           ,[customer_name]\n"
                + "           ,[customer_phone]\n"
                + "           ,[acc_ID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newCustomerID);
            ps.setString(2, cus.getCustomer_Name());
            ps.setString(3, cus.getCustomer_Phone());
            ps.setString(4, cus.getAcc_ID());
            check = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(customerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return check;
    }
/**
     * Author: TienHN
     * @param CusID
     * @param name
     * @param phone
     */
    public void updateProfile(String CusID, String name, String phone) {
        String sql = "update customer set customer_name = ?, customer_phone = ? where customer_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, CusID);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Author: TienHN
     * @param customer_ID
     */
    public void deteleCustomer(String customer_ID) {
        String sql = "DELETE Customer WHERE customer_ID=?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer_ID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            System.out.println();
        }
    }

    public static void main(String[] args) {
        customerDAO cDAO = new customerDAO();
        Customer c = new Customer();
        c.setCustomer_ID("CUST3");
        c.setCustomer_Name("nhan5");
        c.setCustomer_Phone("0939740742");
        c.setAcc_ID("ACC81");

        int check = cDAO.addNewCus(c);

        System.out.println(check);
    }
}
