/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Court {
    private String court_ID;
    private int number;
    private String stadium_ID;
    private Boolean court_status;

    public Court(String court_ID, int number, String stadium_ID, Boolean court_status) {
        this.court_ID = court_ID;
        this.number = number;
        this.stadium_ID = stadium_ID;
        this.court_status = court_status;
    }

    public Court() {
    }

    public String getCourt_ID() {
        return court_ID;
    }

    public void setCourt_ID(String court_ID) {
        this.court_ID = court_ID;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getStadium_ID() {
        return stadium_ID;
    }

    public void setStadium_ID(String stadium_ID) {
        this.stadium_ID = stadium_ID;
    }

    public Boolean getCourt_status() {
        return court_status;
    }

    public void setCourt_status(Boolean court_status) {
        this.court_status = court_status;
    }
}
