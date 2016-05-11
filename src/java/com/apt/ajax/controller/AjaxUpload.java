/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.ajax.controller;

import com.apt.bean.MessageBean;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

@MultipartConfig
/**
 *
 * @author Miku
 */
public class AjaxUpload extends HttpServlet {

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

        String uploadDir = request.getServletContext().getRealPath(File.separator) + "upload";
        Gson gson = new Gson();
        MessageBean messageBean = new MessageBean();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            File x = new File(uploadDir);
            if (!x.exists()) {
                x.mkdir();
            }
            boolean isMultiplePart = ServletFileUpload.isMultipartContent(request);

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            if (!isMultiplePart) {

            } else {
                List items = null;

                try {
                    items = upload.parseRequest(request);
                } catch (Exception ex) {
                }
                if (items != null) {
                    Iterator iterator = items.iterator();
                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();
                        if (item.isFormField()) {
                            String fieldName = item.getFieldName();
                            if (fieldName.equals("assignmentid")) {
                                String assignmentId = item.getString();
                                File c = new File(uploadDir + File.separator + assignmentId);
                                if (!c.exists()) {
                                    c.mkdir();
                                }
                                uploadDir = c.getPath();
                                String stuid = request.getSession().getAttribute("studentId").toString();
                                if (stuid != null && !stuid.equals("")) {
                                    File stuDir = new File(uploadDir+File.separator+stuid);
                                    if(!stuDir.exists()){
                                        stuDir.mkdir();
                                    }
                                    uploadDir = stuDir.getPath();
                                }
                            }
                        } else {
                            String itemname = item.getName();
                            if (itemname == null || itemname.equals("")) {
                            } else {
                                String filename = FilenameUtils.getName(itemname);
                                String aid = request.getParameter("assignmentid");
                                File f = new File(uploadDir + File.separator + filename);
                                item.write(f);
                                messageBean.setStatus(0);
                                messageBean.setMessage("File " + f.getName() + " sucessfuly uploaded");
                            }
                        }
                    }
                }

                gson.toJson(messageBean, out);
            }
        } catch (Exception ex) {
            Logger.getLogger(AjaxUpload.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private File checkExist(String filename, String uploadDir) {
        File file = new File(uploadDir + File.separator + filename);
        if (file.exists()) {
            StringBuilder sb = new StringBuilder(filename);
            sb.insert(sb.lastIndexOf("."), new Date().getTime());
            file = new File(uploadDir + File.separator + sb.toString());
        }
        return file;
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
