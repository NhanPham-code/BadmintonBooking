/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Random;

/**
 *
 * @author Admin
 */
public class RandomCode {

    public String randomeVerifyCode() {
        // Define the characters that can be included in the code 
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder code = new StringBuilder();
        Random random = new Random();

        // Generate the code by selecting random characters from the defined set
        for (int i = 0; i < 6; i++) {
            int index = random.nextInt(characters.length());
            code.append(characters.charAt(index));
        }

        return code.toString();
    }

    public static void main(String[] args) {
        RandomCode randomCode = new RandomCode();
        System.out.println("Random Verification Code: " + randomCode.randomeVerifyCode());
    }
}
