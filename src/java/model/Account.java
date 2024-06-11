/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class Account {
    private String acc_ID;
    private String email;
    private String password;
    private String role;

    public Account() {
    }

    public Account(String acc_ID, String email, String password, String role) {
        this.acc_ID = acc_ID;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public String getAcc_ID() {
        return acc_ID;
    }

    public void setAcc_ID(String acc_ID) {
        this.acc_ID = acc_ID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
}
