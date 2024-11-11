package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.PharmacyLogin;

@Repository
public interface PharmacyLoginRepository extends JpaRepository<PharmacyLogin, String> {
}

