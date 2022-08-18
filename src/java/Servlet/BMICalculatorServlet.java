package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "BMICalculatorServlet", urlPatterns = {"/BMICalculatorServlet"})
public class BMICalculatorServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        
        request.setAttribute("height",height);
        request.setAttribute("weight",weight);
        
        double h=0,w=0;
        
        boolean check = true;
        try {
            h = Double.parseDouble(height);
            if(h<=0){
                check = false;
                request.setAttribute("h_error","Height value must be positive!");
                }
        } catch (Exception e) {
            check=false;
            request.setAttribute("h_error","Height value is invalid!");
        }
        
        try {
            w = Double.parseDouble(weight);
            if(h<=0){
                check = false;
                request.setAttribute("w_error","Weight value must be positive!");
                }
        } catch (Exception e) {
            check=false;
            request.setAttribute("w_error","Weight value is invalid!");
        }
        
        if (check){
            double bmi = w / (h * h);
            if (bmi < 18.5){
                request.setAttribute("result","Underweight");
            }else if(bmi >= 18.5 && bmi < 25){
                request.setAttribute("result","Normal Weight");
            }else if(bmi >= 25 && bmi < 30){
                request.setAttribute("result","Overweight");
            }else if(bmi >= 30 && bmi < 35){
                request.setAttribute("result","Obesity (Class 1)");
            }else if(bmi >= 35 && bmi < 40){
                request.setAttribute("result","Obesity (Class 2)");
            }else if(bmi >= 40){
                request.setAttribute("result","Morbid Obesity");
            }else {
                request.setAttribute("result","Unknown");
            } 
        }
        request.getRequestDispatcher("BMICalculator.jsp").forward(request, response);
        }
    


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
