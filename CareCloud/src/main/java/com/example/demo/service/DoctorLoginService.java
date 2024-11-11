package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Doctor;
import com.example.demo.model.DoctorLogin;
import com.example.demo.repository.DoctorLoginRepository;

@Service
public class DoctorLoginService {

    @Autowired
    private DoctorLoginRepository doctorLoginRepository;

    public boolean authenticate(String username, String password) {
        DoctorLogin doctor = doctorLoginRepository.findById(username).orElse(null);
        return doctor != null && doctor.getPassword().equals(password);
    }
 // Add a new doctor
    public DoctorLogin addDoctor(DoctorLogin doctor) {
        return doctorLoginRepository.save(doctor);
    }
}
