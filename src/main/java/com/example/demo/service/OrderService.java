package com.example.demo.service;

import com.example.demo.entity.OrdersEntity;

import java.util.List;

public interface OrderService {
    public OrdersEntity newTransaction(OrdersEntity ordersEntity);
    public List<OrdersEntity> transactionEntities();
    public OrdersEntity getfintbyTransaction(int id);
    public List<OrdersEntity> listAll(String keyword);
   public OrdersEntity findByPayment(double payment);
}
