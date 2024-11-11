package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.demo.model.Prescription;
import com.example.demo.service.PrescriptionService;

import java.util.List;

@RestController
@RequestMapping("/api/prescriptions")
public class PrescriptionController {

    @Autowired
    private PrescriptionService prescriptionService;

    // Add a new prescription
    @PostMapping
    public ResponseEntity<Prescription> createPrescription(@RequestBody Prescription prescription) {
        Prescription savedPrescription = prescriptionService.addPrescription(prescription);
        return ResponseEntity.ok(savedPrescription);
    }

    // Get all prescriptions
//    @GetMapping
//    public ResponseEntity<List<Prescription>> getAllPrescriptions() {
//        List<Prescription> prescriptions = prescriptionService.getAllPrescriptions();
//        return ResponseEntity.ok(prescriptions);
//    }
//
//    // Get a prescription by ID
//    @GetMapping("/{id}")
//    public ResponseEntity<Prescription> getPrescriptionById(@PathVariable Long id) {
//        return prescriptionService.getPrescriptionById(id)
//                .map(ResponseEntity::ok)
//                .orElse(ResponseEntity.notFound().build());
//    }
//
//    // Update a prescription
//    @PutMapping("/{id}")
//    public ResponseEntity<Prescription> updatePrescription(@PathVariable Long id, @RequestBody Prescription prescriptionDetails) {
//        Prescription updatedPrescription = prescriptionService.updatePrescription(id, prescriptionDetails);
//        return ResponseEntity.ok(updatedPrescription);
//    }
//
//    // Delete a prescription
//    @DeleteMapping("/{id}")
//    public ResponseEntity<Void> deletePrescription(@PathVariable Long id) {
//        prescriptionService.deletePrescription(id);
//        return ResponseEntity.noContent().build();
//    }
}
