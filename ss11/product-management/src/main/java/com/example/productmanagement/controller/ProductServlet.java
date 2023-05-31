package com.example.productmanagement.controller;

import com.example.productmanagement.model.Product;
import com.example.productmanagement.service.IProductService;
import com.example.productmanagement.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "view":
                showProductDetail(request, response);
                break;
            case "search":
                showSearchProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    private void showSearchProduct(HttpServletRequest request, HttpServletResponse response) {
        String searchInfo = request.getParameter("searchInfo");
        System.out.println(searchInfo);
        List<Product> foundProducts = iProductService.searchProduct(searchInfo.toLowerCase());
        System.out.println(foundProducts.size());
        request.setAttribute("products", iProductService.findAll());
        if (foundProducts.size() == 0) {
            request.setAttribute("message", "There is no product for your search!");
        }
        request.setAttribute("foundProducts", foundProducts);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showProductDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("/view/view-product.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("/view/update.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = iProductService.findAll();
        request.setAttribute("products", products);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "create":
                createNewProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String newName = request.getParameter("newName");
        double newPrice = Double.parseDouble(request.getParameter("newPrice"));
        String newDescription = request.getParameter("newDescription");
        Product product = iProductService.findById(id);

        if (product == null) {
            try {
                request.getRequestDispatcher("/view/error.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            product.setName(newName);
            product.setPrice(newPrice);
            product.setDescription(newDescription);
            iProductService.update(id, product);
            request.setAttribute("message", "Product's info has been updated!");
            try {
                request.getRequestDispatcher("/view/update.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        String cf = request.getParameter("cf");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        System.out.println(cf);
        if(cf.equals("Yes")){
            Product product = iProductService.findById(id);
            if (product == null) {
                try {
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                iProductService.remove(id);
                try {
                    response.sendRedirect("/products");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
                try {
                    response.sendRedirect("/products");
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }

    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        int id = (int) (Math.random() * 1000);
        Product newProduct = new Product(id, name, price, description, image);
        iProductService.save(newProduct);
        request.setAttribute("message", "New product added!");
        try {
            request.getRequestDispatcher("/view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }
}
