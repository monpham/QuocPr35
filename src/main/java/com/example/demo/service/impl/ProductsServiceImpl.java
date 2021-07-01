package com.example.demo.service.impl;


import com.example.demo.entity.ProductsEntity;
import com.example.demo.repository.ProductsRepository;
import com.example.demo.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductsServiceImpl implements ProductsService {
    @Autowired
    ProductsRepository productsRepository;

    @Override
    public List<ProductsEntity> getProductsEntities() {
        return (List<ProductsEntity>) productsRepository.findAll();
    }

    @Override
    public ProductsEntity getfindById(int id) {
        ProductsEntity productsEntity = productsRepository.findById(id);
        return productsEntity;
    }


    public void deleteProducts(ProductsEntity productsEntity) {
        productsRepository.delete(productsEntity);
    }

    @Override
    public List<ProductsEntity> getIdProductsPortfolio(int id) {
        return (List<ProductsEntity>) productsRepository.findByProductPortfolioEntityId(id);
    }


    @Override
    public ProductsEntity editProducts(int id) {
        return productsRepository.findById(id);
    }


    @Override
    public void newProducts(ProductsEntity productsEntity) {
        productsRepository.save(productsEntity);
    }

    @Override
    public List<ProductsEntity> listAll(String keyword) {
        if (keyword != null) {
            return productsRepository.search(keyword);
        }
        return (List<ProductsEntity>) productsRepository.findAll();
    }


    @Override
    public Page<ProductsEntity> getAll(int pageNumber) {

        Pageable pageable = PageRequest.of(pageNumber - 1, 5);
        return productsRepository.findAll(pageable);
    }

    @Override
    public Page<ProductsEntity> find(String name, Pageable pageable) {
        // TODO Auto-generated method stub
        return null;
    }
    @Override
    public Page<ProductsEntity> getPaginatedArticles(Pageable pageable) {
        return productsRepository.findAll(pageable);
    }

    @Override
    public Page<ProductsEntity> getAll(int pageNumber, String sortField, String sortDir) {
        // TODO Auto-generated method stub
        return null;
    }

}
