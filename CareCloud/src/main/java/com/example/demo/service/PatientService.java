package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Patient;
import com.example.demo.repository.PatientRepository;

@Service
public class PatientService {

    @Autowired
    private PatientRepository patientRepository;

    // Add a new patient
    public Patient addPatient(Patient patient) {
        return patientRepository.save(patient);
    }

    // Get all patients
    public List<Patient> getAllPatients() {
        return patientRepository.findAll();
    }

    // Get a patient by ID
    public Optional<Patient> getPatientById(Long id) {
        return patientRepository.findById(id);
    }

    // Update a patient
    public Patient updatePatient(Long id, Patient patientDetails) {
        Patient patient = patientRepository.findById(id).orElseThrow(() -> new RuntimeException("Patient not found"));
        patient.setName(patientDetails.getName());
        patient.setAge(patientDetails.getAge());
        patient.setBloodGroup(patientDetails.getBloodGroup());
        patient.setCity(patientDetails.getCity());
        patient.setPhoneNumber(patientDetails.getPhoneNumber());
        return patientRepository.save(patient);
    }

    // Delete a patient
    public void deletePatient(Long id) {
        patientRepository.deleteById(id);
    }
}