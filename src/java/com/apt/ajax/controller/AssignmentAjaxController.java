/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.ajax.controller;

import com.apt.bean.MessageBean;
import com.apt.entity.Assignment;
import com.apt.entity.Batch;
import com.apt.entity.Subject;
import com.apt.facade.AssignmentFacade;
import com.apt.facade.BatchFacade;
import com.apt.facade.SubjectFacade;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 50802
 */
public class AssignmentAjaxController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        Gson gson = new Gson();
        AssignmentFacade assignmentFacade = new AssignmentFacade();
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            if (action != null && !action.equals("")) {
                MessageBean messageBean = new MessageBean();
                if (action.equalsIgnoreCase("createasm")) {
                    String assignmentName = request.getParameter("assignmentName");
                    String batch = request.getParameter("batch");
                    String subject = request.getParameter("subject");
                    String status = request.getParameter("status");
                    String startDate = request.getParameter("startdate");
                    String endDate = request.getParameter("enddate");
                    Assignment assignment = new Assignment();
                    assignment.setAssignmentName(assignmentName);
                    assignment.setBatch(new BatchFacade().findBatch(Integer.parseInt(batch)));
                    assignment.setSubject(new SubjectFacade().findSubject(Integer.parseInt(subject)));
                    assignment.setStatus(Byte.parseByte(status));
                    Date start = new Date(Long.parseLong(startDate));
                    Date end = new Date(Long.parseLong(endDate)+1000);
                    assignment.setStartTime(start);
                    assignment.setEndTime(end);
                    try{
                            assignmentFacade.create(assignment);
                            messageBean.setStatus(0);
                            messageBean.setMessage("Create Assignment successfully");
                            gson.toJson(messageBean,out);
                    } catch(Exception ex){
                        messageBean.setStatus(1);
                        messageBean.setMessage(ex.getMessage());
                        gson.toJson(messageBean,out);
                    }
                                       
                }
                if (action.equalsIgnoreCase("editasm")) {

                }
                if (action.equalsIgnoreCase("deleteasm")) {
                    String id = request.getParameter("assignmentId");
                    try{
                        assignmentFacade.deleteAssignment(Integer.parseInt(id));
                        messageBean.setStatus(0);
                        messageBean.setMessage("delete successful");
                        gson.toJson(messageBean,out);
                    }catch(NumberFormatException | JsonIOException ex){
                        messageBean.setStatus(1);
                        messageBean.setMessage(ex.getMessage());
                        gson.toJson(messageBean,out);
                    }
                    
                }
            } else {
                String target = request.getParameter("target");
                String asm = request.getParameter("id");
                List<Batch> batch = new BatchFacade().getAll();
                request.setAttribute("lstb", batch);
                List<Subject> subject = new SubjectFacade().getAll();
                request.setAttribute("lsts", subject);
                Assignment assignment = new AssignmentFacade().findAssignment(Integer.parseInt(asm));
                request.setAttribute("assignment", assignment);
                if (target != null && !target.equals("")) {
                    if (target.equalsIgnoreCase("edit")) {
                        request.getRequestDispatcher("admin/partial/editAssignment.jsp").include(request, response);
                        BufferedReader br = request.getReader();
                        StringBuilder sb = new StringBuilder();
                        String str = "";
                        while ((str = br.readLine()) != null) {
                            sb.append(str);
                        }
                        gson.toJson(sb.toString(), out);
                    }
                    if (target.equalsIgnoreCase("delete")) {
                        request.getRequestDispatcher("admin/partial/deleteAssignment.jsp").include(request, response);
                        BufferedReader br = request.getReader();
                        StringBuilder sb = new StringBuilder();
                        String str = "";
                        while ((str = br.readLine()) != null) {
                            sb.append(str);
                        }
                        gson.toJson(sb.toString(), out);
                    }
                    if (target.equalsIgnoreCase("create")) {
                        request.getRequestDispatcher("admin/partial/createAssignment.jsp").include(request, response);
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
