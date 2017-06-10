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
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tony
 */
public class arrivalServlet extends HttpServlet {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://sylvester-mccoy-v3.ics.uci.edu/inf124-db-002";
    static final String USER = "inf124-db-002";
    static final String PASS = "K5GLfG5ho!!t";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement stmt = conn.createStatement();
            String query;
            //query = "SELECT imagepath,imagename FROM images WHERE imagename LIKE '%ap1%' AND idimages > 47";
            query = "SELECT images.imagepath, images.imagename, details.title, details.price FROM images INNER JOIN details ON images.imagename=details.imagename AND images.idimages < 36";
            ResultSet rs = stmt.executeQuery(query);
            ArrayList<ArrayList<String>> results = new ArrayList<ArrayList<String>>();
            ArrayList<String> row1 = new ArrayList<String>();
            ArrayList<String> row2 = new ArrayList<String>();
            ArrayList<String> row3 = new ArrayList<String>();
            ArrayList<String> row4 = new ArrayList<String>();
            // Image detail information
            ArrayList<String> names = new ArrayList<String>();
            ArrayList<String> dets = new ArrayList<String>();
            int counter = 0;
            while (rs.next()){
                if(counter == 4){
                    results.add(row1);
                }else if(counter == 8){
                    results.add(row2);
                }else if(counter == 12){
                    results.add(row3);
                }else if(counter == 16){
                    results.add(row4);
                }
                String path = rs.getString("imagepath");
                String name = rs.getString("imagename");
                int len = name.length();
                name = name.substring(0,len);
                String title = rs.getString("title");
                String price = rs.getString("price");
                if (counter < 4){
                    row1.add(path);
                    row1.add(name);
                    row1.add(title);
                    row1.add(price);
                }else if (counter < 8 && counter >= 4){
                    row2.add(path);
                    row2.add(name);
                    row2.add(title);
                    row2.add(price);
                }else if (counter < 12 && counter >=8){
                    row3.add(path);
                    row3.add(name);
                    row3.add(title);
                    row3.add(price);
                }else if (counter < 16 && counter >= 12){
                    row4.add(path);
                    row4.add(name);
                    row4.add(title);
                    row4.add(price);
                }
                names.add(name);
                counter++;
            }
            //results.add(row2);
            results.add(row3);
            Queue q;
            HttpSession session = request.getSession(true);
            q = (LinkedList)session.getAttribute("hatqueue");
            request.setAttribute("hatqueue", q);
            request.setAttribute("imagelist", results);
            request.getRequestDispatcher("/newarr.jsp").forward(request, response);
        }catch(SQLException se){
            se.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
