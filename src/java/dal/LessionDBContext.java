/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Lession;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lecturer;
import model.Room;
import model.StudentGroup;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author VietAnh
 */
public class LessionDBContext extends DBContext<Lession> {

    public ArrayList<Lession> getLessionBy(int leid, Date from, Date to) {
        ArrayList<Lession> lessions = new ArrayList<>();
        try {
            String sql = "select le.leid, le.date, le.isAttended,\n"
                    + "g.gid, g.gname, su.subid, su.suname,\n"
                    + "t.tid, t.tname,\n"
                    + "r.rid, r.rname,\n"
                    + "l.lid, l.lname\n"
                    + "from Lession le inner join StudentGroup g on le.gid = g.gid\n"
                    + "inner join TimeSlot t on le.tid = t.tid\n"
                    + "inner join Room r on le.rid = r.rid\n"
                    + "inner join Lecturer l on le.lid = l.lid\n"
                    + "inner join [Subject] su on su.subid = g.subid \n"
                    + "where l.lid = ? and le.date >= ? and le.date <= ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            stm.setDate(2, (Date) from);
            stm.setDate(3, to);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lession le = new Lession();
                le.setId(rs.getInt("leid"));
                le.setDate(rs.getDate("date"));
                le.setAttended(rs.getBoolean("isAttended"));

                StudentGroup g = new StudentGroup();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                
                le.setGroup(g);
                
                Subject s = new Subject();
                s.setId(rs.getInt("subid"));
                s.setName(rs.getString("suname"));
                
                g.setSubject(s);
                
                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("tid"));
                t.setName(rs.getString("tname"));
                
                le.setSlot(t);
                
                Room r = new Room();
                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                
                le.setRoom(r);
                
                Lecturer l = new Lecturer();
                l.setId(rs.getInt("lid"));
                l.setName(rs.getString("lname"));
                
                le.setLecturer(l);
                
                lessions.add(le);

            }

        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessions;
    }
}
