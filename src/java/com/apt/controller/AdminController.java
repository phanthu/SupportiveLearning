/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.controller;

import com.apt.entity.Admin;
import com.apt.facade.AdminFacade;
import com.apt.finder.AdminFinder;
import com.apt.utils.MyUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 50802
 */
public class AdminController extends HttpServlet {

    private final AdminFacade adminFacade = new AdminFacade();

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            MyUtils myUtils = new MyUtils();

            if (action.equalsIgnoreCase("add")) {
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String status = request.getParameter("status");

                Admin admin = new Admin(name, password, Byte.parseByte(status));
                adminFacade.create(admin);

                request.setAttribute("success", "Them admin thanh cong");

                request.getRequestDispatcher("index.jsp").forward(request, response);

            } else if (action.equalsIgnoreCase("show")) {
                List<Admin> lst = adminFacade.getAll();

                request.setAttribute("lst", lst);

                request.getRequestDispatcher("index.jsp").forward(request, response);

            } else if (action.equalsIgnoreCase("login")) {
                String name = request.getParameter("adminLoginName");
                String pass = request.getParameter("adminLoginPassword");
                Admin admin = adminFacade.findAdminByName(name);
                if (admin != null) {
                    if (admin.getPassword().equals(pass)) {
                        if(request.getSession().getAttribute("studentId")!=null){
                            request.getSession().removeAttribute("StudentId");
                        }
                        if(request.getSession().getAttribute("studentNa")!=null){
                            request.getSession().removeAttribute("studentNa");
                        }
                        request.getSession().setAttribute("adminid", admin.getAdminId());
                        request.getSession().setAttribute("adminname", name);
                        request.getSession().setAttribute("adminrole", admin.getStatus());
                        request.getRequestDispatcher("AdminController?action=tableadmin").forward(request, response);
                    } else {
                        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                    }
                }

            } else if (request.getParameter("action").equals("logout")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                request.getRequestDispatcher("admin/index.jsp").forward(request, response);

            } else if (action.equalsIgnoreCase("tableadmin")) {

                request.getSession().removeAttribute("finder");
                int page = 1;
                int recordsPerPage = 5;
                int noOfPages;
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }

                List<Admin> lst = adminFacade.getAdminList(page, recordsPerPage);
                int size = adminFacade.getNumberAdmin();

                noOfPages = myUtils.roundup(size, recordsPerPage);

                request.setAttribute("lst", lst);
                request.setAttribute("noOfPages", noOfPages);
                request.setAttribute("page", page);

                request.getRequestDispatcher("admin/admin.jsp").forward(request, response);

            } else if (action.equalsIgnoreCase("search")) {
                String name = request.getParameter("adminname");
                String id = request.getParameter("adminid");
                String status = request.getParameter("status");

                AdminFinder finder = new AdminFinder();
                if (request.getSession().getAttribute("finder") != null) {
                    finder = (AdminFinder) request.getSession().getAttribute("finder");
                }
                if (name != null && !name.equals("")) {
                    finder.setAdminName(name);

                }
                if (id != null && !id.equals("")) {
                    finder.setAdminID(Integer.parseInt(id));
                }
                if (status != null && !status.equals("0")) {
                    Byte st = Byte.parseByte(status);
                    finder.setStatus(st);
                }

                request.getSession().setAttribute("finder", finder);
                int page = 1;
                int recordsPerPage = 5;
                int noOfPages;
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }

                List<Admin> lst = adminFacade.getAdminList(finder, page, recordsPerPage);
                int size = adminFacade.getNumberAdmin(finder);

                noOfPages = myUtils.roundup(size, recordsPerPage);

                request.setAttribute("lst", lst);
                request.setAttribute("noOfPages", noOfPages);
                request.setAttribute("page", page);

                request.getRequestDispatcher("admin/admin.jsp").forward(request, response);

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
