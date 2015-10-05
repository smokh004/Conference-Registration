/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.SessionInfo;
import Until.DBHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hiba Habli
 */
public class SessionManager {
     DBHelper db;

    public SessionManager() throws Exception {
        this.db = new DBHelper();
    }
    
    /**
     * list all the speakers
     *
     * @return list of speakers
     * @throws Exception
     */
     public List<SessionInfo> listAll() throws Exception {
        List<SessionInfo> lst = new ArrayList<SessionInfo>();
        String sql = "select * from Session ORDER BY Type, Date, StartTime ASC";
        ResultSet rs = this.db.getSQLResult(sql);
        while (rs.next()) {
            SessionInfo info = new SessionInfo();
            info.Id= rs.getInt("SessionId");
            info.title = rs.getString("Title");
            info.type = rs.getString("Type");
            info.fee = rs.getInt("Fee");
            info.date = rs.getString("Date");
            info.starttime = rs.getString("StartTime");
            info.endtime = rs.getString("EndTime");
            info.Id= rs.getInt("SessionId");
            lst.add(info);
        }
        return lst;
    }
     
      public List<SessionInfo> listAllConference() throws Exception {
        List<SessionInfo> lst = new ArrayList<SessionInfo>();
        String sql = "select * from Session WHERE Type like 'Session' ORDER BY Type, Date, StartTime ASC";
        ResultSet rs = this.db.getSQLResult(sql);
        while (rs.next()) {
            SessionInfo info = new SessionInfo();
            info.Id= rs.getInt("SessionId");
            info.title = rs.getString("Title");
            info.type = rs.getString("Type");
            info.fee = rs.getInt("Fee");
            info.date = rs.getString("Date");
            info.starttime = rs.getString("StartTime");
            info.endtime = rs.getString("EndTime");
            info.Id= rs.getInt("SessionId");
            lst.add(info);
        }
        return lst;
    }
      
         public List<SessionInfo> listAllTutorial() throws Exception {
        List<SessionInfo> lst = new ArrayList<SessionInfo>();
        String sql = "select * from Session WHERE Type like 'Tutorial' ORDER BY Type, Date, StartTime ASC ";
        ResultSet rs = this.db.getSQLResult(sql);
        while (rs.next()) {
            SessionInfo info = new SessionInfo();
            info.Id= rs.getInt("SessionId");
            info.title = rs.getString("Title");
            info.type = rs.getString("Type");
            info.fee = rs.getInt("Fee");
            info.date = rs.getString("Date");
            info.starttime = rs.getString("StartTime");
            info.endtime = rs.getString("EndTime");
            info.Id= rs.getInt("SessionId");
            lst.add(info);
        }
        return lst;
    }
}
