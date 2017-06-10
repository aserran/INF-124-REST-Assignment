/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author arca
 */
public class Confirmation extends HttpServlet {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://sylvester-mccoy-v3.ics.uci.edu/inf124-db-002";
    static final String USER = "inf124-db-002";
    static final String PASS = "K5GLfG5ho!!t";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
        try{
            HttpSession session = request.getSession(true);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement stmt = conn.createStatement();
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phone = request.getParameter("phone");
            String email= request.getParameter("email");
            String street = request.getParameter("street");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String cardname = request.getParameter("owner");
            String cardnum = request.getParameter("card");
            String cvv = request.getParameter("cvv");
            String date = request.getParameter("expMonth")+request.getParameter("expYear");
            String total = request.getParameter("total");
            String quant = request.getParameter("quant");
            String userinfoquery = "INSERT INTO orders (firstname,lastname,phonenumber,email,shippingaddress,city,state,zipcode,shippingmethod,creditname,cardnumber,cvv,expirationdate,totalprice,quantity) VALUES ('"+fname+"','"+lname+"','"+phone+"','"+email+"','"+street+"','"+city+"','"+state+"','"+zip+"', 'No shipping','"+cardname+"','"+cardnum+"','"+cvv+"','"+date+"','"+total+"',1)";
            stmt.execute(userinfoquery);   
            String selectlastorderIDquery = "SELECT idorders FROM orders order by idorders DESC LIMIT 1";
            ResultSet rs = stmt.executeQuery(selectlastorderIDquery);
            rs.next();
            String ide = rs.getString("idorders");
            PreparedStatement pstatement = null;
            for (String order : (ArrayList<String>)session.getAttribute("orders")){
                String[] brokendown = order.split("_");
                String orderitemsquery = "INSERT INTO order_item(orderid,itemname) VALUES ('"+ide+"', '"+brokendown[0]+"')";
                boolean updatequery = stmt.execute(orderitemsquery);
            }
            session.setAttribute("orders", new ArrayList<String>());
            session.setAttribute("total", (double)0);
            session.setAttribute("quant", 0);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/confirmation.jsp");
            rd.forward(request, response);
            conn.close();  
        }catch(SQLException se){
            se.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Confirmation.class.getName()).log(Level.SEVERE, null, ex);
        }
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
