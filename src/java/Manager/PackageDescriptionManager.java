/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.PackageDescriptionInfo;
import Until.DBHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hiba Habli
 */
public class PackageDescriptionManager {
    DBHelper db;

    public PackageDescriptionManager() throws Exception {
        this.db = new DBHelper();
    }
    
    /**
     * list all the Packages
     *
     * @return list of Packages
     * @throws Exception
     */
     public List<PackageDescriptionInfo> listAll() throws Exception {
        List<PackageDescriptionInfo> lst = new ArrayList<PackageDescriptionInfo>();
        String sql = "select * from PackageDescription";
        ResultSet rs = this.db.getSQLResult(sql);
        while (rs.next()) {
            PackageDescriptionInfo info = new PackageDescriptionInfo();
            info.id= rs.getInt("Id");
            info.category = rs.getString("Category");
            info.price = rs.getFloat("Price");
            lst.add(info);
        }
        return lst;
    }
     public PackageDescriptionInfo getPackageById(int id)throws Exception {
        PackageDescriptionInfo info = null;
        String sql = "select * from PackageDescription WHERE Id = " + id;
        ResultSet rs = this.db.getSQLResult(sql);
        while (rs.next()) {
            info = new PackageDescriptionInfo();
            info.id= rs.getInt("Id");
            info.category = rs.getString("Category");
            info.price = rs.getFloat("Price");
            
        }
        return info;
     }
}
