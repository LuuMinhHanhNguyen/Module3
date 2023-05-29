package com.example.ss9productdiscountcalculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscountCalculatorServlet", value = "/discount")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double discountAmount = price * discount * 0.01;
        double discountedPrice = price - discountAmount;
        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");
        printWriter.println("<h2>Product Name: " + name + "</h2>");
        printWriter.println("<h2>Product Price: " + price + "</h2>");
        printWriter.println("<h2>Discount Percent: " + discount + "%" + "</h2>");
        printWriter.println("<h2>Discount Amount: " + discountAmount + "</h2>");
        printWriter.println("<h2>Price After Discount: " + discountedPrice + "</h2>");
        printWriter.println("</html>");
    }
}
