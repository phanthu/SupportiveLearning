/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.finder;

/**
 *
 * @author Miku
 */
public class SubjectFinder extends AbstractFinder {

    private Integer SubjectId;
    private String SubjectName;

    public Integer getSubjectId() {
        return SubjectId;
    }

    public SubjectFinder() {
    }

    public void setSubjectId(int SubjectId) {
        this.SubjectId = SubjectId;
    }

    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String SubjectName) {
        this.SubjectName = SubjectName;
    }

    @Override    
    public String getFinderName() {
        return "subject";
    }

}
