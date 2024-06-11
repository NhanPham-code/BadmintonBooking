/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhanPH
 */
public class StadiumOwner {
    
    private String owner_ID;
    private String owner_name;
    private String owner_phone;
    private Account account;

    public StadiumOwner() {
    }
    
    public StadiumOwner(String owner_ID, String owner_name, String owner_phone, Account account) {
        this.owner_ID = owner_ID;
        this.owner_name = owner_name;
        this.owner_phone = owner_phone;
        this.account = account;
    }

    public String getOwner_ID() {
        return owner_ID;
    }

    public void setOwner_ID(String owner_ID) {
        this.owner_ID = owner_ID;
    }

    public String getOwner_name() {
        return owner_name;
    }

    public void setOwner_name(String owner_name) {
        this.owner_name = owner_name;
    }

    public String getOwner_phone() {
        return owner_phone;
    }

    public void setOwner_phone(String owner_phone) {
        this.owner_phone = owner_phone;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    
}
