/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Timestamp;
/**
 *
 * @author VietAnh
 */
public class Exam {
    private String id;
    private Assessment asseid;
    private Timestamp begin;
    private Timestamp end;
    private Room rid;
    private int proctorlecture;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Assessment getAsseid() {
        return asseid;
    }

    public void setAsseid(Assessment asseid) {
        this.asseid = asseid;
    }

    public Timestamp getBegin() {
        return begin;
    }

    public void setBegin(Timestamp begin) {
        this.begin = begin;
    }

    public Timestamp getEnd() {
        return end;
    }

    public void setEnd(Timestamp end) {
        this.end = end;
    }

    public Room getRid() {
        return rid;
    }

    public void setRid(Room rid) {
        this.rid = rid;
    }

    public int getProctorlecture() {
        return proctorlecture;
    }

    public void setProctorlecture(int proctorlecture) {
        this.proctorlecture = proctorlecture;
    }
    
    
    
}
