/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.controller;

import com.apt.entity.Batch;
import com.apt.facade.BatchFacade;
import com.apt.finder.BatchFinder;
import com.apt.utils.MyUtils;
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
public class BatchController extends HttpServlet {
private final BatchFacade batchFacade = new BatchFacade();
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
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            MyUtils myUtils = new MyUtils();

            if (action.equalsIgnoreCase("Batch")) {
                show(request, myUtils, response);
            } else if (action.equalsIgnoreCase("ClearFinder")) {
                request.getSession().removeAttribute("bFinder");
                show(request, myUtils, response);
            }
        }
    }

    private void show(HttpServletRequest request, MyUtils myUtils, HttpServletResponse response) throws ServletException, NumberFormatException, IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        BatchFinder finder = new BatchFinder();
        if (request.getSession().getAttribute("bFinder") != null) {
            finder = (BatchFinder) request.getSession().getAttribute("bFinder");
        }
        if (name != null && !name.equals("")) {
            finder.setBatchName(name);
        }
        if (id != null && !id.equals("")) {
            finder.setBatchId(Integer.parseInt(id));
        }
        request.getSession().setAttribute("bFinder", finder);

        int page = 1;
        int recordPerPage = 5;
        int noOfPage;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<Batch> lst = batchFacade.getBatchList(finder, page, recordPerPage);
        int size = batchFacade.getNumberBatch(finder);
        noOfPage = myUtils.roundup(size, recordPerPage);

        request.setAttribute("lst", lst);
        request.setAttribute("noOfPages", noOfPage);
        request.setAttribute("page", page);

        request.getRequestDispatcher("admin/batch.jsp").forward(request, response);
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
