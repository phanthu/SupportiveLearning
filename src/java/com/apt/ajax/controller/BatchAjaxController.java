/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.ajax.controller;

import com.apt.bean.MessageBean;
import com.apt.entity.Batch;
import com.apt.facade.BatchFacade;
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
public class BatchAjaxController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private final BatchFacade batchFacade = new BatchFacade();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        String action = request.getParameter("action");
        Gson gson = new Gson();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            if(action !=null){
                MessageBean messagebean = new MessageBean();
                
                if(action.equalsIgnoreCase("createbatch")){
                    String batchname = request.getParameter("batchname");
                    
                    Batch batch = new Batch();
                    batch.setBatchName(batchname);
                    
                    try {
                        batchFacade.create(batch);
                        messagebean.setStatus(0);
                        messagebean.setMessage("Create Batch Succeed");
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
                
                if(action.equalsIgnoreCase("savebatch")){
                    String batchId = request.getParameter("batchId");
                    String batchName = request.getParameter("batchName");
                    
                    Batch batch = new Batch();
                    batch.setBatchId(Integer.parseInt(batchId));
                    batch.setBatchName(batchName);
                    
                    try {
                        batchFacade.updateBatch(batch);
                        messagebean.setStatus(0);
                        messagebean.setMessage("Save Batch Succeed");
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
                
                if(action.equalsIgnoreCase("deletebatch")){
                    try {
                        String batchId = request.getParameter("batchId");
                        batchFacade.deleteBatch(Integer.parseInt(batchId));
                        messagebean.setStatus(0);
                        messagebean.setMessage("Delete Batch Succeed");
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
            }else{
                String target = request.getParameter("target");
                String batchid = request.getParameter("id");
                Batch batch = new BatchFacade().findBatch(Integer.parseInt(batchid));

                request.setAttribute("batch", batch);
                if (target.equalsIgnoreCase("edit")) {
                    request.getRequestDispatcher("admin/partial/editBatch.jsp").include(request, response);
                    BufferedReader br = request.getReader();
                    StringBuilder sb = new StringBuilder();
                    String str = "";
                    while ((str = br.readLine()) != null) {
                        sb.append(str);
                    }
                    gson.toJson(sb.toString(), out);
                }
                if (target.equalsIgnoreCase("delete")) {
                    request.getRequestDispatcher("admin/partial/deleteBatch.jsp").include(request, response);
                    BufferedReader br = request.getReader();
                    StringBuilder sb = new StringBuilder();
                    String str = "";
                    while ((str = br.readLine()) != null) {
                        sb.append(str);
                    }
                    gson.toJson(sb.toString(), out);
                }
                if (target.equalsIgnoreCase("create")) {
                    request.getRequestDispatcher("admin/partial/createBatch.jsp").include(request, response);
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
