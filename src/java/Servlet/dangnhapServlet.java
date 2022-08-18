package Servlet;

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
import javax.servlet.http.HttpSession;


@WebServlet("/dangnhapServlet")
public class dangnhapServlet extends HttpServlet {


    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet dangnhapServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dangnhapServlet at " + request.getContextPath() + "</h1>");
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
        Connection conn;
       try 
       {
           conn = MySQLConn.getMySQLConnection();
           String username=request.getParameter("username");
           String password=request.getParameter("password");
           
           UserAccount usr=new UserAccount(username,password);
           
           UserAccount u=lenhDB.timUser(conn, usr.getUsername(),usr.getPassword());
           
           if(u != null)
           {
               HttpSession session = request.getSession();
               session.setAttribute("acc", u);
               session.setMaxInactiveInterval(30);
               response.sendRedirect("index.jsp");
           }
           else
           {
               request.setAttribute("mess", ". Wrong user or password!");
               request.getRequestDispatcher("/DangNhap1.jsp").forward(request, response);
            }
        } 
          catch(ClassNotFoundException ex)
            {
             Logger.getLogger(dangnhapServlet.class.getName()).log(Level.SEVERE, null, ex);
            } 
          catch (SQLException ex) {
            Logger.getLogger(dangnhapServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
