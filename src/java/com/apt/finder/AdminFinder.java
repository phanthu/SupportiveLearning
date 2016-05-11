/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.finder;

/**
 *
 * @author Miku
 */
public class AdminFinder extends AbstractFinder {

    private Integer adminID;
    private String adminName;
    private Byte status;

    public AdminFinder(Integer adminID, String adminName, Byte status) {
        this.adminID = adminID;
        this.adminName = adminName;
        this.status = status;
    }

    public AdminFinder() {
    }

    public Integer getAdminID() {
        return adminID;
    }

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }


    @Override
    public String getFinderName() {
        return "admin";
    }
    
}
