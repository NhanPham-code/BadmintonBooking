/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Customer {
    private String customer_ID;
    private String customer_Name;
    private String customer_Phone;
    private String acc_ID;

    public String getCustomer_ID() {
        return customer_ID;
    }

    public void setCustomer_ID(String customer_ID) {
        this.customer_ID = customer_ID;
    }

    public String getCustomer_Name() {
        return customer_Name;
    }

    public void setCustomer_Name(String customer_Name) {
        this.customer_Name = customer_Name;
    }

    public String getCustomer_Phone() {
        return customer_Phone;
    }

    public void setCustomer_Phone(String customer_Phone) {
        this.customer_Phone = customer_Phone;
    }

    public String getAcc_ID() {
        return acc_ID;
    }

    public void setAcc_ID(String acc_ID) {
        this.acc_ID = acc_ID;
    }

    public Customer() {
    }

    public Customer(String customer_ID, String customer_Name, String customer_Phone, String acc_ID) {
        this.customer_ID = customer_ID;
        this.customer_Name = customer_Name;
        this.customer_Phone = customer_Phone;
        this.acc_ID = acc_ID;
    }

    
}
