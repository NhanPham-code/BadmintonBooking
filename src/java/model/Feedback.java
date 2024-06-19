/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Feedback {
    private String stadium_ID;
    private Customer customer;
    private int ratingScore;
    private String description;

    public String getStadium_ID() {
        return stadium_ID;
    }

    public void setStadium_ID(String stadium_ID) {
        this.stadium_ID = stadium_ID;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getRatingScore() {
        return ratingScore;
    }

    public void setRatingScore(int ratingScore) {
        this.ratingScore = ratingScore;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Feedback() {
    }

    public Feedback(String stadiumID, Customer customer, int ratingScore, String description) {
        this.stadium_ID = stadium_ID;
        this.customer = customer;
        this.ratingScore = ratingScore;
        this.description = description;
    }
    
}
