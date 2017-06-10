/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author arca
 */
public class cart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        HttpSession session = request.getSession();
        //ArrayList<String> ordertemp = new ArrayList<String>((Collection<? extends String>) session.getAttribute("orders"));
        ArrayList<String> ordertemp = (ArrayList)session.getAttribute("orders");
        if(ordertemp == null){
            ordertemp = new ArrayList();
        }
        String model = request.getParameter("model");
        String quant = request.getParameter("quant");
        String price = request.getParameter("price");
        ordertemp.add(model+"_"+quant+"_"+price);
        price = price.substring(1);
        double tot;
        Object nulltemp = session.getAttribute("total");
        if(nulltemp==null){
            tot = 0.0;
        }else{
            tot = (double)session.getAttribute("total");
        }
        int q = Integer.parseInt(quant);
        //double total = (Double.parseDouble(price.substring(1))*Integer.parseInt(quant))+(double)session.getAttribute("total");
        double total = (Double.parseDouble(price))*q+tot;
        total = (double) Math.round(total * 100) / 100;
        Float.parseFloat(price.substring(1));
        session.setAttribute("total", total);
        session.setAttribute("orders",ordertemp);
        session.setAttribute("quant", session.getAttribute("quant")+quant);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/cart.jsp");
        rd.forward(request, response);
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
