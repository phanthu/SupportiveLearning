/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.controller;

import com.apt.entity.Assignment;
import com.apt.entity.Batch;
import com.apt.entity.Subject;
import com.apt.facade.AssignmentFacade;
import com.apt.facade.BatchFacade;
import com.apt.facade.SubjectFacade;
import com.apt.finder.AssignmentFinder;
import com.apt.utils.MyUtils;
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
 * @author Miku
 */
public class AssignmentController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final AssignmentFacade assignmentFacade = new AssignmentFacade();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            MyUtils myUtils = new MyUtils();

            if (action.equalsIgnoreCase("Assignment")) {
                show(request, myUtils, response);
            } else if (action.equalsIgnoreCase("ClearFinder")) {
                request.getSession().removeAttribute("assignmentFinder");
                show(request, myUtils, response);
            }
        }
    }

    private void show(HttpServletRequest request, MyUtils myUtils, HttpServletResponse response) throws ServletException, NumberFormatException, IOException {
        AssignmentFinder finder = new AssignmentFinder();
        if (request.getSession().getAttribute("assignmentFinder") != null) {
            finder = (AssignmentFinder) request.getSession().getAttribute("assignmentFinder");
        }
        String id = request.getParameter("assignmentid");
        String batchid = request.getParameter("batchid");
        String subjectid = request.getParameter("subjectid");
        String status = request.getParameter("status");
        String name = request.getParameter("assignmentname");
        String startDate = request.getParameter("startdate");
        String endDate = request.getParameter("enddate");
        if (batchid != null && !batchid.equals("")) {
            Batch batch = new BatchFacade().findBatch(Integer.parseInt(batchid));
            finder.setBatch(batch);
        }
        if (subjectid != null && !subjectid.equals("")) {
            Subject subject = new SubjectFacade().findSubject(Integer.parseInt(subjectid));
            finder.setSubject(subject);
        }

        if (name != null && !name.equals("")) {
            finder.setAssignmentName(name);
        }
        if (id != null && !id.equals("")) {
            finder.setAssignmentId(Integer.parseInt(id));
        }
        if (status != null && !status.equals("") && !status.equals("0")) {
            finder.setStatus(Byte.parseByte(status));
        }
        if (startDate != null && !startDate.equals("")) {
            Date start = new Date(Long.parseLong(startDate));
            finder.setStarttime(start);
        }
        if (endDate != null && !endDate.equals("")) {
            Date end = new Date(Long.parseLong(endDate));
            finder.setEndtime(end);
        }

        request.getSession().setAttribute("assignmentFinder", finder);

        int page = 1;
        int recordPerPage = 5;
        int noOfPage;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<Assignment> lst = assignmentFacade.getAssignmentList(finder, page, recordPerPage);
        int size = assignmentFacade.getNumberAssignment(finder);
        noOfPage = myUtils.roundup(size, recordPerPage);
        List<Batch> lstb = new BatchFacade().getAll();
        List<Subject> lsts = new SubjectFacade().getAll();
        request.setAttribute("lsts", lsts);
        request.setAttribute("lstb", lstb);
        request.setAttribute("lst", lst);
        request.setAttribute("noOfPages", noOfPage);
        request.setAttribute("page", page);

        request.getRequestDispatcher("admin/assignment.jsp").forward(request, response);
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
