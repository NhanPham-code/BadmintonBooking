/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhanPH
 */
import java.text.DecimalFormat;
import model.StadiumOwner;

public class Stadium {
    private String stadium_ID;
    private String stadium_name;
    private String stadium_address;
    private String stadium_phone;
    private String opentime;
    private String stadium_image;
    private double avg_ratingScore;
    private int pricePerHour;
    private String QRcode;
    private StadiumOwner owner;

    public Stadium() {
    }

    public Stadium(String stadium_ID, String stadium_name, String stadium_address, String stadium_phone, String opentime, String stadium_image, double avg_ratingScore, int pricePerHour, String QRcode, StadiumOwner owner) {
        this.stadium_ID = stadium_ID;
        this.stadium_name = stadium_name;
        this.stadium_address = stadium_address;
        this.stadium_phone = stadium_phone;
        this.opentime = opentime;
        this.stadium_image = stadium_image;
        this.avg_ratingScore = avg_ratingScore;
        this.pricePerHour = pricePerHour;
        this.QRcode = QRcode;
        this.owner = owner;
    }

    public String getStadium_ID() {
        return stadium_ID;
    }

    public void setStadium_ID(String stadium_ID) {
        this.stadium_ID = stadium_ID;
    }

    public String getStadium_name() {
        return stadium_name;
    }

    public void setStadium_name(String stadium_name) {
        this.stadium_name = stadium_name;
    }

    public String getStadium_address() {
        return stadium_address;
    }

    public void setStadium_address(String stadium_address) {
        this.stadium_address = stadium_address;
    }

    public String getStadium_phone() {
        return stadium_phone;
    }

    public void setStadium_phone(String stadium_phone) {
        this.stadium_phone = stadium_phone;
    }

    public String getOpentime() {
        return opentime;
    }

    public void setOpentime(String opentime) {
        this.opentime = opentime;
    }

    public String getStadium_image() {
        return stadium_image;
    }

    public void setStadium_image(String stadium_image) {
        this.stadium_image = stadium_image;
    }

    public double getAvg_ratingScore() {
        DecimalFormat df = new DecimalFormat("#.#");
        return Double.parseDouble(df.format(avg_ratingScore));
    }

    public void setAvg_ratingScore(double avg_ratingScore) {
        this.avg_ratingScore = avg_ratingScore;
    }

    public int getPricePerHour() {
        return pricePerHour;
    }

    public void setPricePerHour(int pricePerHour) {
        this.pricePerHour = pricePerHour;
    }

    public String getQRcode() {
        return QRcode;
    }

    public void setQRcode(String QRcode) {
        this.QRcode = QRcode;
    }

    public StadiumOwner getOwner() {
        return owner;
    }

    public void setOwner(StadiumOwner owner) {
        this.owner = owner;
    }
}

