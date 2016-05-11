/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.finder;

import com.apt.entity.Batch;

/**
 *
 * @author Miku
 */
public class StudentFinder extends AbstractFinder{
    private  Integer studentId;
    private String studentName;
    private String batch;

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public StudentFinder() {
    }

    
    
    @Override
    public String getFinderName() {
        return "student";
    }
    
    
}
