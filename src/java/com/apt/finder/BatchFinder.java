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
public class BatchFinder extends AbstractFinder{

    public Integer getBatchId() {
        return batchId;
    }

    public void setBatchId(Integer batchId) {
        this.batchId = batchId;
    }

    public String getBatchName() {
        return batchName;
    }

    public void setBatchName(String batchName) {
        this.batchName = batchName;
    }

    private Integer batchId;
    private String batchName;

    public BatchFinder() {
    }
    
    
    
    @Override
    public String getFinderName() {
        return "batch";
    }
    
}
