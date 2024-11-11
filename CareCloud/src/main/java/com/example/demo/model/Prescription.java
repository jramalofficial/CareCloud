package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Prescription {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    private String symptoms;
    private String diagnosis;
    private String prescriptionDetails;
	public Prescription() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Prescription(Long id, Patient patient, Doctor doctor, String symptoms, String diagnosis,
			String prescriptionDetails) {
		super();
		this.id = id;
		this.patient = patient;
		this.doctor = doctor;
		this.symptoms = symptoms;
		this.diagnosis = diagnosis;
		this.prescriptionDetails = prescriptionDetails;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	public String getSymptoms() {
		return symptoms;
	}
	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getPrescriptionDetails() {
		return prescriptionDetails;
	}
	public void setPrescriptionDetails(String prescriptionDetails) {
		this.prescriptionDetails = prescriptionDetails;
	}
	@Override
	public String toString() {
		return "Prescription [id=" + id + ", patient=" + patient + ", doctor=" + doctor + ", symptoms=" + symptoms
				+ ", diagnosis=" + diagnosis + ", prescriptionDetails=" + prescriptionDetails + "]";
	}

    // Getters and setters
}


