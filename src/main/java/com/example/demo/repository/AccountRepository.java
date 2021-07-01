package com.example.demo.repository;

import com.example.demo.entity.AccountEntity;
import com.example.demo.entity.ProductsEntity;
import com.example.demo.entity.UserEntity;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository<AccountEntity, Integer> {
    public List<AccountEntity> findAllByOrderByIdDesc();


    @Query("SELECT p FROM AccountEntity p WHERE CONCAT(p.phonenumber, p.id, p.email, p.date,p.userEntity.username,p.userEntity.id,p.userEntity.password) LIKE %?1%")
    public List<AccountEntity> search(String keyword);
}
