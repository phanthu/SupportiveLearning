/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.controller;

import com.apt.entity.Assignment;
import com.apt.entity.Batch;
import com.apt.entity.Student;
import com.apt.entity.Subject;
import com.apt.entity.Submit;
import com.apt.facade.AssignmentFacade;
import com.apt.facade.BatchFacade;
import com.apt.facade.StudentFacade;
import com.apt.facade.SubjectFacade;
import com.apt.facade.SubmitFacade;
import com.apt.finder.StudentFinder;
import com.apt.utils.MyUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Miku
 */
public class StudentController extends HttpServlet {

    private final StudentFacade studentFacade = new StudentFacade();
    private final BatchFacade batchFacade = new BatchFacade();
    private final AssignmentFacade assignmentFacade = new AssignmentFacade();
    private final SubjectFacade subjectFacade = new SubjectFacade();
    private final SubmitFacade submitFacade = new SubmitFacade();
    private final MyUtils myUtils = new MyUtils();

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
            if (action != null) {
                if (action.equalsIgnoreCase("login")) {
                    String name = request.getParameter("loginName");
                    String pass = request.getParameter("loginPassword");
                    if (myUtils.tryParseInt(name) != 0) {
                        Student student = (Student) studentFacade.findStudent(Integer.parseInt(name));
                        if (student != null) {
                            if (student.getPassword().equals(pass)) {
                                if(request.getSession().getAttribute("adminname")!=null){
                                    request.getSession().removeAttribute("adminname");
                                }
                                if(request.getSession().getAttribute("adminid")!=null){
                                    request.getSession().removeAttribute("adminid");
                                }
                                if(request.getSession().getAttribute("adminrole")!=null){
                                    request.getSession().removeAttribute("adminrole");
                                }
                                request.getSession().setAttribute("studentId", student.getStudentId());
                                request.getSession().setAttribute("studentNa", student.getStudentName());
                                request.getRequestDispatcher("StudentController?action=client").forward(request, response);
                            } else {
                                request.getRequestDispatcher("login.jsp").forward(request, response);
                            }
                        }
                    } else {
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }

                }

                if (action.equalsIgnoreCase("logout")) {
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.invalidate();
                    }
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

                if (action.equalsIgnoreCase("student")) {
                    show(request, myUtils, response);
                } else if (action.equalsIgnoreCase("ClearFinder")) {
                    request.getSession().removeAttribute("stuFinder");
                    show(request, myUtils, response);
                }

                if (action.equalsIgnoreCase("client")) {
                    Integer stuid = (Integer) request.getSession().getAttribute("studentId");
                    if (stuid != 0) {
                        String subname = "";
                        Student stu = studentFacade.findStudent(stuid);
                        Batch batch = stu.getBatch();
                        List<Assignment> list = assignmentFacade.findAssignment(batch, Byte.parseByte("1"));
                        List<Subject> listSubject = new ArrayList<>();
                        list.stream().forEach((assignment) -> {
                            listSubject.add(assignment.getSubject());
                        });
                        List<Subject> listsub = new ArrayList<>(new LinkedHashSet<>(listSubject));
                        request.setAttribute("lstSubject", listsub);

                        String subId = request.getParameter("subject");
                        if (subId != null && !subId.equals("")) {
                            Subject subject = subjectFacade.findSubject(Integer.parseInt(subId));
                            subname = subject.getSubjectName();
                            request.setAttribute("subname", subname);
                            List<Assignment> listAssignments = assignmentFacade.findAssignment(batch, subject, Byte.parseByte("1"));
                            request.setAttribute("lstAssignment", listAssignments);
                            List<Submit> listSubmits = new ArrayList<>();
                            listAssignments.stream().forEach((assignment) -> {
                                listSubmits.add(submitFacade.findSubmit(assignment, stu));
                            });
                            request.setAttribute("lstSubmit", listSubmits);
                        }
                        request.getRequestDispatcher("client.jsp").forward(request, response);
                    }

                }

            }

        }
    }

    private void show(HttpServletRequest request, MyUtils myUtils, HttpServletResponse response) throws ServletException, NumberFormatException, IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String batch = request.getParameter("batch");
        StudentFinder finder = new StudentFinder();
        if (request.getSession().getAttribute("stuFinder") != null) {
            finder = (StudentFinder) request.getSession().getAttribute("stuFinder");
        }
        if (name != null && !name.equals("")) {
            finder.setStudentName(name);
        }
        if (id != null && !id.equals("")) {
            finder.setStudentId(Integer.parseInt(id));
        }
        if (batch != null && !batch.equals("0") && !batch.equals("")) {
            Batch b = new BatchFacade().findBatch(Integer.parseInt(batch));
            finder.setBatch(b);
        }
        request.getSession().setAttribute("stuFinder", finder);

        int page = 1;
        int recordPerPage = 5;
        int noOfPage;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<Student> lst = studentFacade.getStudentList(finder, page, recordPerPage);
        int size = studentFacade.getNumberStudent(finder);
        noOfPage = myUtils.roundup(size, recordPerPage);
        List<Batch> lstBatch = batchFacade.getAll();
        request.setAttribute("lstb", lstBatch);
        request.setAttribute("lst", lst);
        request.setAttribute("noOfPages", noOfPage);
        request.setAttribute("page", page);

        request.getRequestDispatcher("admin/student.jsp").forward(request, response);
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
