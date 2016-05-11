/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.bean;

import java.io.Serializable;

/**
 *
 * @author Miku
 */
public class MessageBean implements Serializable{
    private int status;
    private String message;

    public MessageBean(int status, String message) {
        this.status = status;
        this.message = message;
    }

    public MessageBean() {
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
