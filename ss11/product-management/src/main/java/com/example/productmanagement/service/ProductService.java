package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;

import java.util.*;

public class ProductService implements IProductService{
    private static Map<Integer, Product> products = new LinkedHashMap<>();
    static {
        Product product1 = new Product(1,"Mac", 2000, "Macbook Pro", "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSiuXzG9FyWnn5_sgmNRe6Iun7ApnLRhUawqUo_RAAaBJGpKvFIvm3MK8SQVh6nlHruYiF6_S0Lm_nUbHazO8hLfe9IUi3qdD8sxdgfdAvdvE33Sy4CNbh6I8mYdKXdCFonSA&usqp=CAc");
        Product product2 = new Product(2, "iPhone", 1000, "iPhone 14", "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT7a8x6K8Gpfa4EVu-W7L1ZW_HIu948gTT6ITRmJs1FdKzQtsE03IgheS-8YwgXJWKNW6J6Lb-Jv4Gi2CHIiW_ibJ1LMydJa_UkWwTZM1EoEq99Ize_dzu5vnGisrCC_aSssA&usqp=CAc");
        Product product3 = new Product(3, "AirPods", 300, "Apple AirPods", "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSPbLK8Wgaf9IotO34iTLqV-S48vdlEh_Fp_G-i4e0w0Zb7m4JUmSYnE1LiUxct1x08yp4cPEx4c46hWLLq9Ir0v_Xsua9jgvRGx205HOhhIuZSvYYkNAkrP1NZZwV5tEdPQg&usqp=CAc");
        products.put(1, product1);
        products.put(2, product2);
        products.put(3, product3);
    }



    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public Product findById(int id) {
       return products.get(id);
    }

    @Override
    public void save(Product newProduct) {
        products.put(newProduct.getId(),newProduct);
    }

    @Override
    public void update(int id,Product updatedProduct) {
        products.put(id, updatedProduct);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> searchProduct(String productInfo) {
        List<Product> products = findAll();
        List<Product> foundProducts = new ArrayList<>();
        for (int i = 0; i < products.size(); i++) {
            if(products.get(i).getName().toLowerCase().contains(productInfo)){
                foundProducts.add(products.get(i));
            }
        }
        return foundProducts;
    }
}
