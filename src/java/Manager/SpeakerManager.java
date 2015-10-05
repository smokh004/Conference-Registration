/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;


import Entity.SpeakerInfo;
import Until.DBHelper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author mac
 */
public class SpeakerManager {
    
    DBHelper db;

    public SpeakerManager() throws Exception {
        this.db = new DBHelper();
    }
    
    /**
     * list all the speakers
     *
     * @return list of speakers
     * @throws Exception
     */
     public List<SpeakerInfo> listAll() throws Exception {
        List<SpeakerInfo> lst = new ArrayList<SpeakerInfo>();
        String sql = "select * from Speakers";
        ResultSet rs = this.db.getSQLResult(sql);
        while (rs.next()) {
            SpeakerInfo info = new SpeakerInfo();
            info.id = rs.getInt("SpeakerID");
            info.firstname = rs.getString("FirstName");
            info.lastname = rs.getString("LastName");
            info.title = rs.getString("Title");
            info.company = rs.getString("CompanyName");
            info.description = rs.getString("Description");
            info.picture = rs.getString("Picture");
            lst.add(info);
        }
        return lst;
    }
      public SpeakerInfo getSpeakerById(int id)throws Exception {
        SpeakerInfo info = null;
        String sql = "select * from Speakers WHERE SpeakerID = " + id;
        ResultSet rs = this.db.getSQLResult(sql);
        while (rs.next()) {
            info = new SpeakerInfo();
            info.firstname = rs.getString("FirstName");
            info.lastname = rs.getString("LastName");
            info.title = rs.getString("Title");
            info.company = rs.getString("CompanyName");
            info.description = rs.getString("Description");
            
        }
        return info;
     }
}
