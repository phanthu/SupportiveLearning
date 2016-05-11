/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.ajax.controller;

import com.apt.bean.MessageBean;
import com.apt.entity.Admin;
import com.apt.facade.AdminFacade;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Miku
 */
public class AdminAjaxController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private AdminFacade adminFacade = new AdminFacade();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        String action = request.getParameter("action");
        Gson gson = new Gson();
        try (PrintWriter out = response.getWriter()) {

            if (action != null) {
                MessageBean messagebean = new MessageBean();
//                messagebean.setStatus(0);
//                messagebean.setMessage("Not Success");

                if (action.equalsIgnoreCase("createadmin")) {
                    String adminname = request.getParameter("adminName");
                    String password = request.getParameter("password");
                    String status = request.getParameter("status");

                    Admin admin = new Admin();
                    admin.setAdminName(adminname);
                    admin.setPassword(password);
                    admin.setStatus(Byte.parseByte(status));

                    try {
                        adminFacade.create(admin);
                        messagebean.setStatus(0);
                        messagebean.setMessage("Create Admin Succeed");
                        gson.toJson(messagebean, out);
                    } catch (Exception ex) {
                        messagebean.setStatus(1);
                        if (ex.getMessage().contains("ConstrainViolation")) {
                            messagebean.setMessage("Dupplicate Admin Name");
                        } else {
                            messagebean.setMessage("An error ocurred, please try again!");
                        }
                        gson.toJson(messagebean, out);
                    }
                }
                if (action.equalsIgnoreCase("saveadmin")) {
                    String adminId = request.getParameter("adminId");
                    String adminname = request.getParameter("adminName");
                    String password = request.getParameter("password");
                    String status = request.getParameter("status");

                    Admin admin = new Admin();
                    admin.setAdminId(Integer.parseInt(adminId));
                    admin.setAdminName(adminname);
                    admin.setPassword(password);
                    admin.setStatus(Byte.parseByte(status));

                    try {
                        adminFacade.updateAdmin(admin);
                        messagebean.setStatus(0);
                        messagebean.setMessage("Save Admin Succeed");
                        gson.toJson(messagebean, out);
                    } catch (Exception ex) {
                        messagebean.setStatus(1);
                        if (ex.getMessage().contains("ConstrainViolation")) {
                            messagebean.setMessage("Dupplycate Admin Name");
                        } else {
                            messagebean.setMessage(ex.getMessage());
                        }
                        gson.toJson(messagebean, out);
                    }
                }
                if (action.equalsIgnoreCase("deleteadmin")) {
                    try {
                        String adminId = request.getParameter("adminId");
                        adminFacade.deleteAdmin(Integer.parseInt(adminId));
                        messagebean.setStatus(0);
                        messagebean.setMessage("Delete Admin Succeed");
                        gson.toJson(messagebean, out);
                    } catch (Exception ex) {
                        messagebean.setStatus(1);
                        if (ex.getMessage().contains("ConstrainViolation")) {
                            messagebean.setMessage("Dupplycate Admin Name");
                        } else {
                            messagebean.setMessage(ex.getMessage());
                        }
                        gson.toJson(messagebean, out);
                    }
                }
            } else {
                String target = request.getParameter("target");
                String adminid = request.getParameter("id");
                Admin admin = new AdminFacade().findAdmin(Integer.parseInt(adminid));

                request.setAttribute("admin", admin);
                if (target.equalsIgnoreCase("edit")) {
                    request.getRequestDispatcher("admin/partial/editAdmin.jsp").include(request, response);
                    BufferedReader br = request.getReader();
                    StringBuilder sb = new StringBuilder();
                    String str = "";
                    while ((str = br.readLine()) != null) {
                        sb.append(str);
                    }
                    gson.toJson(sb.toString(), out);
                }
                if (target.equalsIgnoreCase("delete")) {
                    request.getRequestDispatcher("admin/partial/deleteAdmin.jsp").include(request, response);
                    BufferedReader br = request.getReader();
                    StringBuilder sb = new StringBuilder();
                    String str = "";
                    while ((str = br.readLine()) != null) {
                        sb.append(str);
                    }
                    gson.toJson(sb.toString(), out);
                }
                if (target.equalsIgnoreCase("create")) {
                    request.getRequestDispatcher("admin/partial/createAdmin.jsp").include(request, response);
                    BufferedReader br = request.getReader();
                    StringBuilder sb = new StringBuilder();
                    String str = "";
                    while ((str = br.readLine()) != null) {
                        sb.append(str);
                    }
                    gson.toJson(sb.toString(), out);
                }

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
