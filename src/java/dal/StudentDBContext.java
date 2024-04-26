/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Student;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VietAnh
 */
public class StudentDBContext extends DBContext<Student> {

    public ArrayList<Student> getStudentByLessionID(int leid) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select s.sid, s.sname\n"
                    + "from Student s join Enrollment e on s.sid = e.sid\n"
                    + "join StudentGroup g on e.gid = g.gid\n"
                    + "join Lession les on g.gid = les.gid\n"
                    + "where les.leid = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, leid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Student s = new Student();
                s.setId(rs.getString("sid"));
                s.setName(rs.getString("sname"));
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

}
