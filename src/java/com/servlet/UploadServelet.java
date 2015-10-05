package com.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import Entity.PaperInfo;
import Manager.PaperManager;
import Manager.CartManager;
import Entity.CartInfo;

/**
 * Servlet implementation class UploadServlet
 */
public class UploadServelet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DATA_DIRECTORY = "data";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request

            PaperInfo PI = new PaperInfo();
            PaperManager PM = new PaperManager();

            CartManager cartMngr = new CartManager();
            int cartID = 0;
            // int cartID = Integer.parseInt(request.getParameter("cart_id"));
            int user_id = 16;
            List items = upload.parseRequest(request);

            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (item.isFormField()) {
                    if (item.getFieldName().equals("title")) {
                        PI.title = item.getString();

                    } else if (item.getFieldName().equals("description")) {
                        PI.description = item.getString();
                    } else if (item.getFieldName().equals("cartID")) {
                        cartID = Integer.parseInt(item.getString());
                        List<CartInfo> lst = cartMngr.listAllById(cartID);
                        Iterator<CartInfo> itr = lst.iterator();

                        while (itr.hasNext()) {
                            CartInfo info = itr.next();

                           PI.UserId = info.userId;
                        }
                    }


                }
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filePath);
                    System.out.println(filePath);
                    //PI.UserId = user_id;
                    PI.path = filePath;
                    System.out.println("!!!!!!");
                    //      PM.Addpaper(PI);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }

            }

            // displays done.jsp page after upload finished

            List<PaperInfo> Newlst = PM.listAll();
            Iterator<PaperInfo> Newitr = Newlst.iterator();
            boolean con = true;
            while (con && Newitr.hasNext()) {
                PaperInfo Newinfo = Newitr.next();
                if (Newinfo.title.equals(PI.title)) {
                    con = false;
                    response.sendRedirect("duplicatepaper.jsp?cart_id=" + cartID);
                }

            }

            if (con && PM.Addpaper(PI) != -1) {
                // getServletContext().getRequestDispatcher("/done.jsp?cart_id= " + cartID ).forward(
                //       request, response);
                CartInfo CI = new CartInfo();
                CI.Id = cartID;
                List<PaperInfo> Newlst2 = PM.listAll();
                Iterator<PaperInfo> Newitr2 = Newlst2.iterator();
                boolean con2= true;
                while (con2 && Newitr2.hasNext()) {
                    PaperInfo Newinfo2 = Newitr2.next();
                    
                    if (con2 && Newinfo2.title.equals(PI.title)) {
                        con2= false;
                               PI.PaperId = Newinfo2.PaperId;
                    }

                }
                
                CI.paperId = PI.PaperId;
                float paperFee = Float.parseFloat("50");
                CI.total = CI.total + paperFee;
                int checkPaper = 5;
                checkPaper = cartMngr.updateCartPaperID(CI);
                // out.print ("</br> paper checking " + checkPaper);
                if (checkPaper == 0) {

                    response.sendRedirect("done.jsp?cart_id=" + cartID);
                }
            }

        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
}