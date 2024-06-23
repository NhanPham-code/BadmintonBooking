/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;
import java.util.List;
import java.util.Date;

/**
 *
 * @author nhanPH
 */
public class Booking {

    private String booking_ID;
    private int courtQuantity;
    private Time startTime;
    private Time endTime;
    private Date date;
    private int total;
    private String bankingImage;
    private String bookingAccepted;
    private Customer customer;
    private Stadium stadium;
    private List<Court> courtList;

    public Booking() {
    }

    /*
    public Booking(String booking_ID, int courtQuantity, Time startTime, Time endTime, java.sql.Date date, int total, boolean bookingAccepted, Customer customer, Stadium stadium, List<Court> courtList) {
        this.booking_ID = booking_ID;
        this.courtQuantity = courtQuantity;
        this.startTime = startTime;
        this.endTime = endTime;
        this.date = date;
        this.total = total;
        this.bookingAccepted = bookingAccepted;
        this.customer = customer;
        this.stadium = stadium;
        this.courtList = courtList;
    }
     */
    public Booking(String booking_ID, int courtQuantity, Time startTime, Time endTime, Date date, int total, String bankingImage, String bookingAccepted, Customer customer, Stadium stadium, List<Court> courtList) {
        this.booking_ID = booking_ID;
        this.courtQuantity = courtQuantity;
        this.startTime = startTime;
        this.endTime = endTime;
        this.date = date;
        this.total = total;
        this.bankingImage = bankingImage;
        this.bookingAccepted = bookingAccepted;
        this.customer = customer;
        this.stadium = stadium;
        this.courtList = courtList;
    }

    public String getBooking_ID() {
        return booking_ID;
    }

    public void setBooking_ID(String booking_ID) {
        this.booking_ID = booking_ID;
    }

    public int getCourtQuantity() {
        return courtQuantity;
    }

    public void setCourtQuantity(int courtQuantity) {
        this.courtQuantity = courtQuantity;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getBookingAccepted() {
        return bookingAccepted;
    }

    public void setBookingAccepted(String bookingAccepted) {
        this.bookingAccepted = bookingAccepted;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Stadium getStadium() {
        return stadium;
    }

    public void setStadium(Stadium stadium) {
        this.stadium = stadium;
    }

    public List<Court> getCourtList() {
        return courtList;
    }

    public void setCourtList(List<Court> courtList) {
        this.courtList = courtList;
    }

    public String getBankingImage() {
        return bankingImage;
    }

    public void setBankingImage(String bankingImage) {
        this.bankingImage = bankingImage;
    }

}
