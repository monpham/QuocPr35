package com.example.demo.service;

import com.example.demo.entity.OrderDetailsEntity;

import java.util.List;

public interface OrderDetailsService {
    public void newOrders(OrderDetailsEntity orderDetailsEntity);
    public List<OrderDetailsEntity> getOrderEntities();
    public List<OrderDetailsEntity> getIDTransaction(int id);
    public OrderDetailsEntity getFindbyViewdetails(int id);
    public List<OrderDetailsEntity> listAll(String keyword);
}
