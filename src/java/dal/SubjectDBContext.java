                                        /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Subject;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VietAnh
 */
public class SubjectDBContext extends DBContext<Subject> {

    public ArrayList<Subject> getSubjects() {
        ArrayList<Subject> subs = new ArrayList<>();
        try {
            String sql = "SELECT [subid]\n"
                    + "      ,[suname]\n"
                    + "      ,[credit]\n"
                    + "      ,[fullname]\n"
                    + "  FROM [Subject]";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setId(rs.getInt("subid"));
                s.setName(rs.getString("suname"));
                s.setCredit(rs.getInt("credit"));
                s.setFullname(rs.getString("fullname"));
                subs.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subs;
    }

}
