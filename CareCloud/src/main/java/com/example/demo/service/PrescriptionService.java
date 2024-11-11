package com.example.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Prescription;
import com.example.demo.repository.PrescriptionRepository;

@Service
public class PrescriptionService {

    @Autowired
    private PrescriptionRepository prescriptionRepository;

    public Prescription addPrescription(Prescription prescription) {
        return prescriptionRepository.save(prescription);
    }
    public List<Prescription> getPrescriptionsByDoctorId(Long doctorId) {
        return prescriptionRepository.findByDoctorId(doctorId);
    }
    public List<Prescription> findPrescriptionsByPatientAndDoctor(Long patientId, Long doctorId) {
        return prescriptionRepository.findByPatientIdAndDoctorId(patientId, doctorId);
    }
    public List<Prescription> getAllPrescriptions() {
        return prescriptionRepository.findAll(); // Fetch all prescriptions from the database
    }
}
