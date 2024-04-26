/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Grade;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assessment;
import model.Exam;
import model.Student;
import model.Subject;

/**
 *
 * @author VietAnh
 */
public class GradeDBContext extends DBContext<Grade> {

    public ArrayList<Grade> getListSubjectBySid(String sid, int subid) {
        ArrayList<Grade> grade = new ArrayList<>();
        try {
            String sql = "select a.name, (a.weight * 100) as weight, g.score, g.comment, e.examid ,s.sid, s.sname\n"
                    + "                    from Assessment a \n"
                    + "                    join Exam e on a.asseid = e.asseid\n"
                    + "                    join Grade g on e.examid = g.examid\n"
                    + "                    join Student s on s.sid = g.sid\n"
                    + "                    where s.sid = ? and a.subid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setInt(2, subid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Assessment a = new Assessment();
                a.setName(rs.getString("name"));
                a.setWeight(rs.getFloat("weight"));

                Exam e = new Exam();
                e.setId(rs.getString("examid"));
                e.setAsseid(a);

                Student stu = new Student();
                stu.setId(rs.getString("sid"));
                stu.setName(rs.getString("sname"));

                Grade g = new Grade();
                g.setScore(rs.getFloat("score"));
                g.setComment(rs.getString("comment"));
                g.setExamid(e);
                g.setSid(stu);

                grade.add(g);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(GradeDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return grade;
    }

    public ArrayList<Grade> getListSubject(String sid) {
        ArrayList<Grade> grade = new ArrayList<>();
        try {
            String sql = "select distinct sub.suname, sub.fullname\n"
                    + "from Assessment a join Subject sub on a.subid = sub.subid\n"
                    + "join Exam e on a.asseid = e.asseid\n"
                    + "join Grade g on e.examid = g.examid\n"
                    + "join Student s on s.sid = g.sid\n"
                    + "where s.sid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Subject s = new Subject();
                s.setFullname(rs.getString("fullname"));
                s.setName(rs.getString("suname"));

                Assessment a = new Assessment();
                a.setSubid(s);

                Exam e = new Exam();
                e.setAsseid(a);

                Grade g = new Grade();
                g.setExamid(e);

                grade.add(g);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(GradeDBContext.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return grade;
    }

    public float getAverage(String sid, int subid) {
        float avg = 0;
        try {
            String sql = "select  s.sid, s.sname, sub.subid , sub.fullname, a.name,   SUM(a.weight * g.score)  AS average_score\n"
                    + "from grade g join exam e on g.examid = e.examid\n"
                    + "join Assessment a on a.asseid = e.asseid\n"
                    + "join Subject sub on a.subid = sub.subid\n"
                    + "join Student s on s.sid = g.sid\n"
                    + "where s.sid = ? and sub.subid = ?\n"
                    + "group by s.sid, s.sname, sub.subid , sub.fullname, a.name;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sid);
            stm.setInt(2, subid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                avg += rs.getFloat("average_score");
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return avg;
    }

}
