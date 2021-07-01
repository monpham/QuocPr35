package com.example.demo.repository;


import com.example.demo.entity.OrdersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersRepository extends JpaRepository<OrdersEntity, Integer> {
    public OrdersEntity findById(int id);

    OrdersEntity findByPayment(double payment);

    @Query("SELECT p FROM OrdersEntity p WHERE CONCAT(p.id, p.transactionaddress, p.payment, p.transactiondate,p.transactionmail,p.transactionname,p.transactionphone,p.transactionstatus) LIKE %?1%")
    public List<OrdersEntity> search(String keyword);
}
