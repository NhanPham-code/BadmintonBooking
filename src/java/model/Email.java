/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Admin
 */
public class Email {
    // Email: bookingsystem3105@gmail.com
    // Password: b t r h l i r b k o z f z u f s
    
    public void sendEmail(String recieveEmail, String verifyCode) {
        // mail gui ma xac thuc
        final String from = "bookingsystem3105@gmail.com";
        final String password = "b t r h l i r b k o z f z u f s";
        
        // mail cua khach hang se nhan ma truyen ma email cua khach hang
        final String to = recieveEmail;
        
        // Propertis: khai bao cac thuoc tinh
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP HOST
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
            
        };
        
        // Phien lam viec
        Session session = Session.getInstance(props, auth);
        
        // Gui email xac thuc
        
        // tao 1 tin nhan
        MimeMessage msg = new MimeMessage(session);
        
        try {
            // kieu noi dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            
            // nguoi gui
            msg.setFrom(from);
            
            // nguoi nhan
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            
            // Tieu de email
            msg.setSubject("Verify Forgot Password");
            
            // Quy dinh ngay gui
            msg.setSentDate(new Date());
            
            // Quy dinh email phan hoi
            // msg.setReplyTo(null);
            
            // Noi dung gui di la verify code cho nguoi dung nhap vao de xac thuc
            msg.setText("Your Verify Code: " + verifyCode);
            
            // Gui email
            Transport.send(msg);
            
        } catch (MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void main(String[] args) {
        Email e = new Email();
        RandomCode randomCode = new RandomCode();
        String code = randomCode.randomeVerifyCode();
        e.sendEmail("phamhiennhan3105@gmail.com", code);
    }
}
