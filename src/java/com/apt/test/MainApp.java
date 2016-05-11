/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.test;

import com.apt.entity.Admin;
import com.apt.facade.AdminFacade;
import java.util.List;

/**
 *
 * @author 50802
 */
public class MainApp {
    public static void main(String[] args) {
        AdminFacade af = new AdminFacade();
        List<Admin> lst = af.getAll();
        for (Admin admin : lst) {
            System.out.println("Name: "+admin.getAdminName() );
        }
    }
}
