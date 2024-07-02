/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhanPH
 */
public class Admin {

    private String admin_ID;
    private String admin_name;
    private String admin_phone;
    private String acc_ID;

    public Admin() {
    }

    
    public Admin(String admin_ID, String admin_name, String admin_phone, String acc_ID) {
        this.admin_ID = admin_ID;
        this.admin_name = admin_name;
        this.admin_phone = admin_phone;
        this.acc_ID = acc_ID;
    }

    public String getAdmin_ID() {
        return admin_ID;
    }

    public void setAdmin_ID(String admin_ID) {
        this.admin_ID = admin_ID;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_phone() {
        return admin_phone;
    }

    public void setAdmin_phone(String admin_phone) {
        this.admin_phone = admin_phone;
    }

    public String getAcc_ID() {
        return acc_ID;
    }

    public void setAcc_ID(String acc_ID) {
        this.acc_ID = acc_ID;
    }

}
