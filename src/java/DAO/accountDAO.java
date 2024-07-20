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
import model.Account;
import model.Stadium;

/**
 *
 * @author nhanPH
 */
public class accountDAO {

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    DBContext db = new DBContext();

    public Account getAccountById(String id) {
        Account ac = new Account();

        String sql = "select * from Account where acc_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                ac.setAcc_ID(rs.getString("acc_ID"));
                ac.setEmail(rs.getString("email"));
                ac.setPassword(rs.getString("password"));
                ac.setRole(rs.getString("role"));
            }
        } catch (Exception ex) {
            System.out.println();
        }

        return ac;
    }

    /**
     * Author: TienHN
     *
     * @param accID
     * @param customerID
     * @param ownerID
     */
    public void deleteAccount(String accID, String customerID, String ownerID) {
        String sql = "Delete Account where acc_ID = ?";
        if (customerID.equals("")) {

            stadiumDAO sDAO = new stadiumDAO();

            List<Stadium> stadiumList = new ArrayList<>();
            stadiumList = sDAO.getStadiumByStadiumOwnerID(ownerID);
            for (Stadium s : stadiumList) {
                sDAO.deleteStadium(s.getStadium_ID());

            }
            stadiumOwnerDAO soDAO = new stadiumOwnerDAO();
            soDAO.deleteStadiumOwner(accID);
        } else if (ownerID.equals("")) {

            bookingDetailDAO bdDAO = new bookingDetailDAO();
            bdDAO.deleteBookingDetailCustomer(customerID);

            bookingDAO bDAO = new bookingDAO();
            bDAO.deleteBookingOfCustomer(customerID);

            feedbackDAO fDAO = new feedbackDAO();
            fDAO.deleteFeedbackCustomer(customerID);

            customerDAO cDAO = new customerDAO();
            cDAO.deteleCustomer(customerID);
        }
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, accID);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
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

    public boolean checkLogin(String email, String password) {
        String sql = "select * from Account where Email = ? and Password = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            return rs.next(); // Trả về true nếu có kết quả, ngược lại trả về false
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
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
        return false;
    }

    public Account getAccountByEmail(String email) {
        Account ac = null;
        String sql = "select * from Account where Email = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                ac = new Account();
                ac.setAcc_ID(rs.getString("acc_ID"));
                ac.setEmail(rs.getString("email"));
                ac.setPassword(rs.getString("password"));
                ac.setRole(rs.getString("role"));
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
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

        return ac;
    }

    /**
     * Author: nhanPH
     *
     * @param role from user
     * @return list account by role
     */
    public List<Account> getAccountByRole(String role) {
        List<Account> accList = new ArrayList<>();
        String sql = "select * from Account where role = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, role);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account ac = new Account();
                ac.setAcc_ID(rs.getString("acc_ID"));
                ac.setEmail(rs.getString("email"));
                ac.setPassword(rs.getString("password"));
                ac.setRole(rs.getString("role"));
                accList.add(ac);
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các resource ở đây nếu cần thiết
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

        return accList;
    }

    /**
     * Author: nhanPH
     *
     * @return account list in DB
     */
    public List<Account> getAllAccount() {
        List<Account> accountList = new ArrayList<>();
        String sql = "select * from account";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account ac = new Account();
                ac.setAcc_ID(rs.getString("acc_ID"));
                ac.setEmail(rs.getString("email"));
                ac.setPassword(rs.getString("password"));
                ac.setRole(rs.getString("role"));
                accountList.add(ac);
            }
        } catch (Exception ex) {
            System.out.println();
        } finally {
            // Đóng các resource ở đây nếu cần thiết
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
        return accountList;
    }

    /**
     * Author: NhiTCU
     *
     * @param accNew
     * @return
     */
    public int addNewAcc(Account accNew) {
        int check = 0;
        // COALESCE câu lệnh trên sẽ trả về 0 thay vì NULL
        // SUBSTRING(acc_ID, 4, LEN(acc_ID) - 3) cắt chuỗi từ vị trí thứ 4 (cắt 3 vì ACC có 3 kí tự)
        // CAST() AS INT sẽ chuyển đổi chuỗi thành số nguyên
        // MAX để chọn số lớn nhất
        String getMaxAccountID = "SELECT COALESCE(MAX(CAST(SUBSTRING(acc_ID, 4, LEN(acc_ID) - 3) AS INT)), 0) FROM Account";
        int maxNumber = 0;
        String newAccountID = null;

        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(getMaxAccountID);
            rs = ps.executeQuery();

            if (rs.next()) {
                String maxAccountID = rs.getString(1);
                // Extract the numeric part from the maximum account_ID
                maxNumber = Integer.parseInt(maxAccountID); // Assuming "ACC" prefix
            }
        } catch (Exception ex) {
            Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (int i = 1; i <= maxNumber + 1; i++) {
            String proposedAccountID = "ACC" + i;
            boolean accountIDExists = false;

            // Check if proposedAccountID already exists in the database
            String checkAccountIDExists = "SELECT COUNT(*) FROM Account WHERE acc_ID = ?";
            try {
                ps = conn.prepareStatement(checkAccountIDExists);
                ps.setString(1, proposedAccountID);
                rs = ps.executeQuery();

                if (rs.next()) {
                    if (rs.getInt(1) > 0) {
                        accountIDExists = true;
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(accountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (!accountIDExists) {
                newAccountID = proposedAccountID;
                break;
            }
        }

        if (newAccountID == null) {
            return check; //Không thể tạo mới Account_ID!
        }

        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([Acc_ID]\n"
                + "           ,[Email]\n"
                + "           ,[Password]\n"
                + "           ,[Role])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newAccountID);
            ps.setString(2, accNew.getEmail());
            ps.setString(3, accNew.getPassword());
            ps.setString(4, accNew.getRole());
            check = ps.executeUpdate();
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
        return check;
    }

    public void updateEmail(String newEmail, String accID) {
        String sql = "update account set email = ? where acc_ID = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newEmail);
            ps.setString(2, accID);
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

    public void updatePassword(String email, String newPassword) {

        String sql = "update account set password = ? where email = ?";
        try {
            conn = db.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
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

    public static void main(String[] args) {
        accountDAO dao = new accountDAO();

        List<Account> accList = dao.getAccountByRole("admin");

        for (Account ac : accList) {
            System.out.println(ac.getEmail());
        }

    }
}
