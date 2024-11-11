package com.example.demo.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;


@Entity
public class Patient {
	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    private String name;
	    private int age;
	    private String bloodGroup;
	    private String city;
	    private String phoneNumber;

	    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL)
	    private List<Prescription> prescriptions;

		public Patient() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Patient(Long id, String name, int age, String bloodGroup, String city, String phoneNumber,
				List<Prescription> prescriptions) {
			super();
			this.id = id;
			this.name = name;
			this.age = age;
			this.bloodGroup = bloodGroup;
			this.city = city;
			this.phoneNumber = phoneNumber;
			this.prescriptions = prescriptions;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getAge() {
			return age;
		}

		public void setAge(int age) {
			this.age = age;
		}

		public String getBloodGroup() {
			return bloodGroup;
		}

		public void setBloodGroup(String bloodGroup) {
			this.bloodGroup = bloodGroup;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getPhoneNumber() {
			return phoneNumber;
		}

		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}

		public List<Prescription> getPrescriptions() {
			return prescriptions;
		}

		public void setPrescriptions(List<Prescription> prescriptions) {
			this.prescriptions = prescriptions;
		}

		@Override
		public String toString() {
			return "Patient [id=" + id + ", name=" + name + ", age=" + age + ", bloodGroup=" + bloodGroup + ", city="
					+ city + ", phoneNumber=" + phoneNumber + ", prescriptions=" + prescriptions + "]";
		}  
	}

