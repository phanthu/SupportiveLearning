/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HiepNguyen
 */
public class MyUtils {
    public static Date convertStringToDate(String input){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date=null;
        try {
            date = sdf.parse(input);
        } catch (ParseException ex) {
            Logger.getLogger(MyUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return  date;
    }
    public static String convertDateToyyyyMMdd(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String str = "";
        if(date != null){
            str = sdf.format(date);
        }
        
        return str;
    }
    public int roundup(int a,int b){
        return (a+b-1)/b;
    }
    
    public int tryParseInt(String a){
        try{
            Integer i=Integer.parseInt(a);
            return i;
        }catch(NumberFormatException e){
            return 0;
        }
    }
}
