package com.example.demo.service.impl;


import com.example.demo.entity.OrderDetailsEntity;
import com.example.demo.repository.OrderDetailsRepository;
import com.example.demo.service.OrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {
    @Autowired
    OrderDetailsRepository orderDetailsRepository;


    @Override
    public void newOrders(OrderDetailsEntity orderDetailsEntity) {
        orderDetailsRepository.save(orderDetailsEntity);
    }


    @Override
    public OrderDetailsEntity getFindbyViewdetails(int id) {
        OrderDetailsEntity orderDetailsEntity = orderDetailsRepository.findById(id);
        return orderDetailsEntity;
    }


    @Override
    public List<OrderDetailsEntity> getIDTransaction(int id) {
        return (List<OrderDetailsEntity>) orderDetailsRepository.findByOrdersEntityId(id);
    }
    @Override
    public List<OrderDetailsEntity> getOrderEntities(){
        return (List<OrderDetailsEntity>) orderDetailsRepository.findAll();
    }

    @Override
    public List<OrderDetailsEntity> listAll(String keyword) {
        if (keyword != null) {
            return orderDetailsRepository.search(keyword);
        }
        return (List<OrderDetailsEntity>) orderDetailsRepository.findAll();
    }

}
