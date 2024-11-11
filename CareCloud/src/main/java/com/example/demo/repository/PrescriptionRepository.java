package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Prescription;

public interface PrescriptionRepository extends JpaRepository<Prescription, Long>{
	List<Prescription> findByDoctorId(Long doctorId);
	List<Prescription> findByPatientIdAndDoctorId(Long patientId, Long doctorId);
	
}
