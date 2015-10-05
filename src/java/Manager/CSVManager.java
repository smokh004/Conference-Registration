
/*
    Document   : exportCSV.jsp
    Created on : Nov 20, 2013, 1:27:54 AM
    Author     : Chris
*/
package Manager;


import Until.DBHelper;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class CSVManager {
     DBHelper db;
     String table;
    public CSVManager(String tb) throws Exception {
        this.db = new DBHelper();
        table = tb;
        query();
    }

      public final void query() throws FileNotFoundException
      {
         String sql = "select * from " + table;
         try{
         ResultSet rs = this.db.getSQLResult(sql);
         String userHome = System.getProperty("user.home");  
         System.out.println(userHome);
         String file = (userHome+"//"+table+".txt");
         PrintStream output = new PrintStream(file);
         System.out.println(rs.toString());
         ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
        for(int x = 0; x < columnCount; x++)
        {
            output.printf("%s", rsmd.getColumnLabel(x+1));
            output.printf(" | ");
            if(x+1 == columnCount)
                        output.println();
        }
        while(rs.next()){
        for(int i = 0; i < columnCount; i++){
            output.printf("%s,", rs.getObject( i+1 ));
                if(i+1 == columnCount)
                        output.println();
            }
        }
         output.close();
         }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
       
      }
      
}


