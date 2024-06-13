package com.johncarlo.ecomcart.service;

import com.johncarlo.ecomcart.model.Product;
import com.johncarlo.ecomcart.model.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class ProductService {

    private final ProductRepository productRepository;

    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    public Product getProduct(Long productId) {
        return productRepository.findById(productId).orElse(null);
    }
}
