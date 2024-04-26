/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Attendence;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lession;
import model.Student;


/**
 *
 * @author VietAnh
 */
public class AttendenceDBContext extends DBContext<Attendence> {

    public ArrayList<Attendence> getAttendenceByLession(int leid) {
        ArrayList<Attendence> atts = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "                    s.sid,s.sname,\n"
                    + "                    a.aid,a.isPresent,a.description,a.capturedtime\n"
                    + "                    FROM Student s INNER JOIN Enrollment e ON s.sid = e.sid\n"
                    + "                  					INNER JOIN StudentGroup g ON g.gid = e.gid\n"
                    + "              						INNER JOIN Lession les ON les.gid = g.gid\n"
                    + "                   					LEFT JOIN Attendence a ON les.leid = a.leid\n"
                    + "                    				AND a.sid = s.sid WHERE les.leid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence att = new Attendence();
                Student s = new Student();
                Lession les = new Lession();

                s.setId(rs.getString("sid"));
                s.setName(rs.getString("sname"));

                att.setStudent(s);

                att.setId(rs.getInt("aid"));

                if (att.getId() != 0) {
                    att.setPresent(rs.getBoolean("isPresent"));
                    att.setDescription(rs.getString("description"));
                    att.setTime(rs.getTimestamp("capturedtime"));
                }
                atts.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendenceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public void takeAttendance(int leid, ArrayList<Attendence> atts) {

        try {
            connection.setAutoCommit(true);
            String sql_remove_atts = "DELETE FROM [dbo].[Attendence]\n"
                    + "      WHERE leid = ? ";

            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setInt(1, leid);
            stm_remove_atts.executeUpdate();

            String sql_insert_atts = "INSERT INTO [Attendence]\n"
                    + "           ([leid]\n"
                    + "           ,[sid]\n"
                    + "           ,[description]\n"
                    + "           ,[isPresent]\n"
                    + "           ,[capturedtime])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE())";
            
            for (Attendence att : atts) {
                PreparedStatement stm_insert_atts = connection.prepareStatement(sql_insert_atts);
                stm_insert_atts.setInt(1, leid);
                stm_insert_atts.setString(2, att.getStudent().getId());
                stm_insert_atts.setString(3, att.getDescription());
                stm_insert_atts.setBoolean(4, att.isPresent());
                stm_insert_atts.executeUpdate();
            }
            
            String sql_update_lession = "UPDATE Lession SET isAttended = 1 WHERE leid = ?";
            PreparedStatement stm_update_lession = connection.prepareStatement(sql_update_lession);
            stm_update_lession.setInt(1, leid);
            stm_update_lession.executeUpdate();
            connection.commit();

        } catch (SQLException ex) {
            try {
                Logger.getLogger(AttendenceDBContext.class.getName()).log(Level.SEVERE, null, ex);
                
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendenceDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        finally{
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendenceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
