package com.example.productmanagement.service;
import com.example.productmanagement.model.Product;

import java.util.List;

public interface IProductService {


    List<Product> findAll();

    Product findById(int id);

    void save(Product newProduct);
    void update(int id, Product updatedProduct);
    void remove(int id);
    List<Product> searchProduct(String productInfo);

}
