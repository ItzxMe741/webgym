package Servlet;

import Servlet.MySQLConn;
import Servlet.UserAccount;
import Servlet.dangnhapServlet;
import Servlet.lenhDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/dangkiServlet"})
public class dangkiServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet dangkiServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dangkiServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null; //connect SQL
        
        try {
           conn = MySQLConn.getMySQLConnection();
           //xử lý tham số từ form
           String username=request.getParameter("username");
           String email=request.getParameter("email");
           String password=request.getParameter("password"); ; 
           String repassword=request.getParameter("repassword");  
           
           if(!password.equals(repassword)){
               
               request.setAttribute("mess1", ". Password do Not match!");
               request.getRequestDispatcher("/DangKi1.jsp").forward(request, response);
               
           }else{
               
               if (!((username.length() >= 8) && (username.length() <= 30))){
                    request.setAttribute("mess3", ". Username must be at least 8 characters and at most 30 characters!");
                    request.getRequestDispatcher("/DangKi1.jsp").forward(request, response);
               }else{
               if (!((password.length() >= 8) && (password.length() <= 24))){
                    request.setAttribute("mess2", ". Password must be at least 8 characters and at most 24 characters!");
                    request.getRequestDispatcher("/DangKi1.jsp").forward(request, response);
               }else{
               UserAccount u = lenhDB.findUser(conn, username);
                   if (u == null) {
                   UserAccount usr=new UserAccount(username, email, password); //tạo đối tượng user
                   lenhDB.insertUserAccount(conn, usr);
                   request.setAttribute("username", username);
                   request.setAttribute("mess4", ". Congratulations, your account has been created!");
                   request.getRequestDispatcher("/DangNhap1.jsp").forward(request, response);
               }else{
                   request.setAttribute("mess3", ". User Name already exist. Please try another one!");
                   request.getRequestDispatcher("/DangKi1.jsp").forward(request, response);
               }
               }
            //thêm đối tượng vào CSDL
               
           }
           }
            
        } 
        
        catch (ClassNotFoundException ex) {
            Logger.getLogger(dangnhapServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (SQLException ex) {
            Logger.getLogger(dangnhapServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(conn != null){
        try {
            conn.close();
        } 
        catch (SQLException ex) {
            Logger.getLogger(dangnhapServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
 
    } 
 }

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
