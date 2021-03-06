/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.ajax.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Miku
 */
public class ServletDownload extends HttpServlet {

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
        response.setContentType("application/octet-stream");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = request.getParameter("url");
            String filePath = request.getServletContext().getRealPath(File.separator) + "upload" +File.separator+url;
            File downloadFile = new File(filePath);
            Long length = downloadFile.length();
            OutputStream outputStream;
            try (FileInputStream inputStream = new FileInputStream(downloadFile)) {
                response.reset();
                response.setBufferSize(4096);
                String contentType=getServletContext().getMimeType(downloadFile.getName());               
                if(contentType==null){
                    response.setContentType("application/octet-stream");
                }
                response.setContentType(contentType);
                response.setContentLength((int)downloadFile.length());
                String headerKey = "Content-Disposition";
                String headerValue=String.format(("attachment; filename=\"%s\""), downloadFile.getName());
                response.setHeader(headerKey, headerValue);
                outputStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int byteRead;
                while((byteRead= inputStream.read(buffer))>0){
                    outputStream.write(buffer, 0, byteRead);
                }
            }
            outputStream.flush();
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
