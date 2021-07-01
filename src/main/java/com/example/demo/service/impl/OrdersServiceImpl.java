package com.example.demo.service.impl;


import com.example.demo.entity.OrdersEntity;
import com.example.demo.repository.OrdersRepository;
import com.example.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrderService {
    @Autowired
    OrdersRepository ordersRepository;

    @Override
    public OrdersEntity newTransaction(OrdersEntity ordersEntity) {
       return ordersRepository.save(ordersEntity);
    }

    @Override
    public OrdersEntity getfintbyTransaction(int id) {
        OrdersEntity ordersEntity = ordersRepository.findById(id);
        return ordersEntity;
    }

    @Override
    public OrdersEntity findByPayment(double payment) {
        OrdersEntity ordersEntity = ordersRepository.findByPayment(payment);
        return ordersEntity;
    }

@Override
    public List<OrdersEntity> transactionEntities(){
        return (List<OrdersEntity>) ordersRepository.findAll();
    }


    @Override
    public List<OrdersEntity> listAll(String keyword) {
        if (keyword != null) {
            return ordersRepository.search(keyword);
        }
        return (List<OrdersEntity>) ordersRepository.findAll();
    }

}
