package com.example.demo.repository;

import com.example.demo.entity.OrderDetailsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailsRepository extends JpaRepository<OrderDetailsEntity, Integer> {
    public List<OrderDetailsEntity> findByOrdersEntityId(int id);

    @Query("SELECT p FROM OrderDetailsEntity p WHERE CONCAT(p.id, p.quantity, p.sale, p.total,p.productsEntity.code,p.productsEntity.nameproduct,p.productsEntity.price,p.ordersEntity.transactionaddress,p.ordersEntity.payment,p.ordersEntity.transactionmail,p.ordersEntity.transactionphone,p.ordersEntity.transactionstatus,p.ordersEntity.transactionaddress) LIKE %?1%")
    public List<OrderDetailsEntity> search(String keyword);

    public OrderDetailsEntity findById(int id);

}
