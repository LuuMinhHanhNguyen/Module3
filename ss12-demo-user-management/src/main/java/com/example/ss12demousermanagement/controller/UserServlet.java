package com.example.ss12demousermanagement.controller;

import com.example.ss12demousermanagement.dao.UserDAO;
import com.example.ss12demousermanagement.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;

    public void init (){
    userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        if(action == null) action = "";

        switch (action){
            case "create": showCreateForm(request,response);break;
            case "edit": showEditForm(request,response); break;
            case "sortedByName": sortedByName(request,response); break;
            case "searchByCountry": searchByCountry(request,response); break;
            default: listAllUsers(request,response); break;
        }
    }

    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        String searchInfo = request.getParameter("searchInfo");
        List<User> searchedUsers = userDAO.searchByCountry(searchInfo);
        System.out.println(searchedUsers);
        if (searchedUsers.size() == 0) {
            request.setAttribute("users", userDAO.selectAllUsers());
            request.setAttribute("message", "There is no user for your search!");
        } else {
            request.setAttribute("users", searchedUsers);
        }
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
           e.printStackTrace();
        }

    }

    private void sortedByName(HttpServletRequest request, HttpServletResponse response) {
        List<User> sortedUsers = userDAO.sortedByName();
        request.setAttribute("users", sortedUsers);
        System.out.println(sortedUsers);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
           e.printStackTrace();
        }
    }

    private void listAllUsers(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = userDAO.selectAllUsers();
        request.setAttribute("users", users);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User editedUser = userDAO.selectUser(id);
        System.out.println(id);
        request.setAttribute("user", editedUser);
        try {
            request.getRequestDispatcher("/view/edit.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
           e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/create.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) action = "";

        switch (action){
            case "create" : createUser(request,response);break;
            case "edit" : editUser(request,response);break;
            case "delete": deleteUser(request, response); break;
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User editedUser = new User(id, name,email,country);
        try {
            userDAO.updateUser(editedUser);
            System.out.println("hihi");
            response.sendRedirect("/users");
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        System.out.println("hihi");

        try {
            userDAO.insertUser(new User(name,email,country));
            response.sendRedirect("/users");
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        String cf = request.getParameter("cf");
        System.out.println(cf);
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        if(cf.equals("yes")) {
            try {
                userDAO.deleteUser(id);
                List<User> users = userDAO.selectAllUsers();
                request.setAttribute("users", users);
                request.getRequestDispatcher("/view/list.jsp").forward(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.sendRedirect("/users");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
