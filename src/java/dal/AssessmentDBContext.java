    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Assessment;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Subject;

/**
 *
 * @author VietAnh
 */
public class AssessmentDBContext extends DBContext<Assessment> {

    public ArrayList<Assessment> getListAssessBySubName(int subid) {
        ArrayList<Assessment> ass = new ArrayList<>();
        try {
            String sql = "select a.asseid, a.name, a.weight, s.subid, s.suname, s.credit, s.fullname\n"
                    + "from Assessment a join Subject s on a.subid = s.subid\n"
                    + "where s.subid = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Assessment a = new Assessment();
                a.setId(rs.getInt("asseid"));
                a.setName(rs.getString("name"));
                a.setWeight(rs.getFloat("weight"));
                
                Subject s = new Subject();
                s.setId(rs.getInt("subid"));
                s.setName(rs.getString("suname"));
                s.setCredit(rs.getInt("credit"));
                s.setFullname(rs.getString("fullname"));
                
                a.setSubid(s);
                ass.add(a);
                
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ass;
    }

}
