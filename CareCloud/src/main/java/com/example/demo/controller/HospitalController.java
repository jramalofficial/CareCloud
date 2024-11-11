package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Doctor;
import com.example.demo.model.DoctorLogin;
import com.example.demo.model.Patient;
import com.example.demo.model.PharmacyLogin;
import com.example.demo.service.DoctorLoginService;
import com.example.demo.service.DoctorService;
import com.example.demo.service.HospitalLoginService;
import com.example.demo.service.PatientService;
import com.example.demo.service.PharmacyLoginService;

import ch.qos.logback.core.model.Model;

@Controller
@RequestMapping ("/hospital")
public class HospitalController {
	
	@Autowired
    private HospitalLoginService hospitalLoginService;
	
	@Autowired
	private DoctorLoginService doctorLoginService;
	
	@Autowired
	private DoctorService doctorService;
	

	   @GetMapping("/login")
	   public String showHospitalLoginPage() {
	        return "hospitalLogin"; // Renders the hospitalLogin.jsp
	    }
	   
	   @PostMapping("/login")
	    public ModelAndView performLogin(@RequestParam("username") String username,
	                                     @RequestParam("password") String password) {
	        ModelAndView modelAndView = new ModelAndView();
	        boolean isAuthenticated = hospitalLoginService.authenticate(username, password);
	        if (isAuthenticated) {
	            modelAndView.setViewName("hospitalDashboard"); // Redirect to hospital dashboard
	        } else {
	            modelAndView.setViewName("hospitalLogin"); // Back to login page with error
	            modelAndView.addObject("error", "Invalid Credentials!");
	        }
	        return modelAndView;
	    }
	   @GetMapping("/addDoctor")
	    public String showDoctoraddPage() {
	        return "addDoctor"; // Renders the doctorLogin.jsp
	   }
	    @PostMapping("/addDoctor")
	    public ModelAndView addDoctor(
	    @RequestParam("name") String name,
	    @RequestParam("specialization") String specialization,
	    @RequestParam("username") String username,
	    @RequestParam("password") String password) {

	    // Save the doctor details
	    Doctor doctor = new Doctor(name, specialization,username);
	    doctorService.addDoctor(doctor);

	    // Save the login credentials
	    DoctorLogin doctorLogin = new DoctorLogin(username, password);
	    doctorLoginService.addDoctor(doctorLogin);

	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName("hospitalDashboard");
	    modelAndView.addObject("successMessage", "Doctor added successfully!");

	    return modelAndView;
	    }
	    
	    @Autowired
	    private PatientService patientService;

	    // Show Add Patient form
	    @GetMapping("/addPatient")
	    public ModelAndView showAddPatientForm() {
	    ModelAndView modelAndView = new ModelAndView("addPatient");
	    modelAndView.addObject("patient", new Patient()); // Passing an empty Patient object to the form
	    return modelAndView;
	    }
	    @GetMapping("/viewPatients")
	    public ModelAndView showviewPatients() {
	    List<Patient> patients = patientService.getAllPatients();// Fetch all patients
	    ModelAndView mav = new ModelAndView("viewPatient"); // Name of the JSP
	    mav.addObject("patients", patients); // Add patients data to the model
	    return mav; // Return ModelAndView
	    }
	    
	    @GetMapping("/viewDoctors")
	    public ModelAndView showviewDoctors() {
	    List<Doctor> doctors = doctorService.getAllDoctors();// Fetch all patients
	    ModelAndView mav = new ModelAndView("viewDoctor"); // Name of the JSP
	    mav.addObject("doctors", doctors); // Add patients data to the model
	    return mav; // Return ModelAndView
	    }
	    // Handle form submission for adding a new patient
	    @PostMapping("/addPatient")
	    public ModelAndView addPatient(@ModelAttribute("patient") Patient patient) {
	    patientService.addPatient(patient); // Save patient to database
	    ModelAndView modelAndView = new ModelAndView("hospitalDashboard"); // Redirect to View Patients page after success
	    return modelAndView;
	    }
	    
	    
	    @Autowired
	    private PharmacyLoginService pharmacyService;

	    // Show Add Pharmacy form
	    @GetMapping("/addPharmacy")
	    public ModelAndView showAddPharmacyForm() {
	    ModelAndView modelAndView = new ModelAndView("addPharmacy");
	    modelAndView.addObject("pharmacy", new PharmacyLogin()); // Passing an empty Pharmacy object to the form
	    return modelAndView;
	    }

	    // Handle form submission for adding a new pharmacy
	    @PostMapping("/addPharmacy")
	    public ModelAndView addPharmacy(@ModelAttribute("pharmacy") PharmacyLogin pharmacy) {
	    pharmacyService.addPharmacy(pharmacy); // Save pharmacy to database
	    ModelAndView modelAndView = new ModelAndView("hospitalDashboard"); // Redirect to View Pharmacy page after success
	    return modelAndView;
	    }
	    @GetMapping("/managePatient")
	    public String showmanagePatientPage() {
	        return "managePatient"; // Renders the doctorLogin.jsp
	    }
	    @GetMapping("/manageDoctor")
	    public String showmanageDoctorPage() {
	        return "manageDoctor"; // Renders the doctorLogin.jsp
	    }
	    @GetMapping("/managePharmacy")
	    public String showmanagePharmacyPage() {
	        return "managePharmacy"; // Renders the doctorLogin.jsp
	    }
	    @GetMapping("/dashboard")
	    public String showDashboardPage() {
	        return "hospitalDashboard"; // Renders the doctorLogin.jsp
	    }
	    @GetMapping("/logout")
	    public String showlogoutPage() {
	        return "hospitalLogin"; // Renders the doctorLogin.jsp
	    }



	    // Handle deleting a patient
	    @GetMapping("/updatePatient/{id}")
	    public ModelAndView showUpdateForm(@PathVariable("id") Long id) {
	        Optional<Patient> patient = patientService.getPatientById(id);
	        if (patient.isPresent()) {
	            ModelAndView mav = new ModelAndView("updatePatient"); // JSP page for updating the patient
	            mav.addObject("patient", patient.get());
	            return mav;
	        } else {
	            return new ModelAndView("errorPage").addObject("message", "Patient not found"); // Handle case when patient doesn't exist
	        }
	    }

	    // Process the Update Form and Update the Patient in the Database
	    @PostMapping("/updatePatient")
	    public ModelAndView updatePatient(@RequestParam("id") Long id, @ModelAttribute Patient patientDetails) {
	        patientService.updatePatient(id, patientDetails); // Update patient
	        return new ModelAndView("redirect:/hospital/viewPatients"); // Redirect to the list of patients after update
	    }

	    // Delete a Patient by ID
	    @GetMapping("/deletePatient/{id}")
	    public ModelAndView deletePatient(@PathVariable("id") Long id) {
	        patientService.deletePatient(id); // Delete patient by ID
	        return new ModelAndView("redirect:/hospital/viewPatients"); // Redirect to the list of patients after deletion
	    }
	    
	    @GetMapping("/updateDoctor/{id}")
	    public ModelAndView showUpdateDoctorForm(@PathVariable("id") Long id) {
	        Optional<Doctor> doctor = doctorService.getDoctorById(id);
	        if (doctor.isPresent()) {
	            ModelAndView mav = new ModelAndView("updateDoctor"); // JSP page for updating the patient
	            mav.addObject("doctor", doctor.get());
	            return mav;
	        } else {
	            return new ModelAndView("errorPage").addObject("message", "Doctor not found"); // Handle case when patient doesn't exist
	        }
	    }

	    // Process the Update Form and Update the Patient in the Database
	    @PostMapping("/updateDoctor")
	    public ModelAndView updateDoctor(@RequestParam("id") Long id, @ModelAttribute Doctor doctorDetails) {
	        doctorService.updateDoctor(id, doctorDetails); // Update patient
	        return new ModelAndView("redirect:/hospital/viewDoctors"); // Redirect to the list of patients after update
	    }

	    // Delete a Patient by ID
	    @GetMapping("/deleteDoctor/{id}")
	    public ModelAndView deleteDoctor(@PathVariable("id") Long id) {
	        doctorService.deleteDoctor(id); // Delete patient by ID
	        return new ModelAndView("redirect:/hospital/viewDoctors"); // Redirect to the list of patients after deletion
	    }
	    
	    
	    



	}


