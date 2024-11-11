package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.DoctorLogin;
import com.example.demo.model.PharmacyLogin;
import com.example.demo.repository.PharmacyLoginRepository;

@Service
public class PharmacyLoginService {

    @Autowired
    private PharmacyLoginRepository pharmacyLoginRepository;

    public boolean authenticate(String username, String password) {
        PharmacyLogin pharmacy = pharmacyLoginRepository.findById(username).orElse(null);
        return pharmacy != null && pharmacy.getPassword().equals(password);
    }
    public PharmacyLogin addPharmacy(PharmacyLogin pharmacy) {
        return pharmacyLoginRepository.save(pharmacy);
    }
}
