/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package heps.db.magnet.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import heps.db.magnet.jpa.DesignAPI;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author qiaoys
 */
public class NewDesign extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String type, family, allrequire;
    private double length, aperture, gap, usefulfield, intensity_b, intensity_q, intensity_h, intensity_o, syscompo, non_syscompo;
    private ArrayList designall;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewDesign</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewDesign at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        designall = new ArrayList();
        DesignAPI a = new DesignAPI();

        type = request.getParameter("magtype");
        family = request.getParameter("magfamily");
        designall.add(type);
        designall.add(family);
        allrequire = request.getParameter("hd1");
        
        JSONObject require_jsonobj = JSONObject.fromObject(allrequire);
        JSONArray require_jsonarray = require_jsonobj.getJSONArray("rows");
        if (require_jsonarray.size() > 0) {
             designall.add(require_jsonarray.getJSONObject(0).getInt("value"));
            for (int i = 1; i < require_jsonarray.size(); i++) {
                JSONObject job = require_jsonarray.getJSONObject(i);  // 遍历 jsonarray 数组，把每一个对象转成 json 对象
                if (job.get("value").toString().length() == 0) {
                    designall.add(job.get("value"));
                   // out.println("hh");
                } else {
                    designall.add(job.getDouble("value"));
                    //out.println(job.getDouble("value"));  // 得到 每个对象中的属性值
                }
            }
        }

        //out.println(designall.get(0)+"+"+designall.get(1));
        out.println(designall);
        a.insertDesign(designall);
       
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
