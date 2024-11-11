package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.HospitalLogin;
import com.example.demo.repository.HospitalLoginRepository;

@Service
public class HospitalLoginService {

    @Autowired
    private HospitalLoginRepository hospitalLoginRepository;

    public boolean authenticate(String username, String password) {
        HospitalLogin hospital = hospitalLoginRepository.findById(username).orElse(null);
        return hospital != null && hospital.getPassword().equals(password);
    }
}
