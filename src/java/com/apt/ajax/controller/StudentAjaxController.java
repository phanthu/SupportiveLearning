/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.ajax.controller;

import com.apt.bean.MessageBean;
import com.apt.entity.Batch;
import com.apt.entity.Student;
import com.apt.facade.BatchFacade;
import com.apt.facade.StudentFacade;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Miku
 */
public class StudentAjaxController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final StudentFacade studentFacade = new StudentFacade();
    private final BatchFacade batchFacade = new BatchFacade();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        String action = request.getParameter("action");
        Gson gson = new Gson();
        try (PrintWriter out = response.getWriter()) {
            if (action != null) {
                MessageBean messagebean = new MessageBean();

                if (action.equalsIgnoreCase("createstudent")) {
                    String studentname = request.getParameter("studentname");
                    String studentpass = request.getParameter("studentpass");
                    String batch = request.getParameter("batch");

                    Student student = new Student();
                    student.setStudentName(studentname);
                    student.setPassword(studentpass);
                    if (batch != null && !batch.equals("")) {
                        Batch b = batchFacade.findBatch(Integer.parseInt(batch));
                        student.setBatch(b);
                    }

                    try {
                        studentFacade.create(student);
                        messagebean.setStatus(0);
                        messagebean.setMessage("Create Student Succeed");
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

                if (action.equalsIgnoreCase("savestudent")) {
                    String studentId = request.getParameter("studentId");
                    String studentName = request.getParameter("studentName");
                    String password = request.getParameter("password");
                    String batch = request.getParameter("batch");

                    Student student = new Student();
                    student.setStudentId(Integer.parseInt(studentId));
                    student.setStudentName(studentName);
                    student.setPassword(password);
                    if (!batch.equals("0")) {
                        Batch b = batchFacade.findBatch(Integer.parseInt(batch));
                        student.setBatch(b);
                    }

                    try {
                        studentFacade.updateStudent(student);
                        messagebean.setStatus(0);
                        messagebean.setMessage("Save Student Succeed");
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

                if (action.equalsIgnoreCase("deletestudent")) {
                    try {
                        String studentId = request.getParameter("studentId");
                        studentFacade.deleteStudent(Integer.parseInt(studentId));
                        messagebean.setStatus(0);
                        messagebean.setMessage("Delete Student Succeed");
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
                String studentid = request.getParameter("id");
                Student student = new StudentFacade().findStudent(Integer.parseInt(studentid));
                List<Batch> b = batchFacade.getAll();
                request.setAttribute("lstb", b);
                request.setAttribute("student", student);
                if (target.equalsIgnoreCase("edit")) {

                    request.getRequestDispatcher("admin/partial/editStudent.jsp").include(request, response);
                    BufferedReader br = request.getReader();
                    StringBuilder sb = new StringBuilder();
                    String str = "";
                    while ((str = br.readLine()) != null) {
                        sb.append(str);
                    }
                    gson.toJson(sb.toString(), out);
                }
                if (target.equalsIgnoreCase("delete")) {
                    request.getRequestDispatcher("admin/partial/deleteStudent.jsp").include(request, response);
                    BufferedReader br = request.getReader();
                    StringBuilder sb = new StringBuilder();
                    String str = "";
                    while ((str = br.readLine()) != null) {
                        sb.append(str);
                    }
                    gson.toJson(sb.toString(), out);
                }
                if (target.equalsIgnoreCase("create")) {
                    request.getRequestDispatcher("admin/partial/createStudent.jsp").include(request, response);
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
