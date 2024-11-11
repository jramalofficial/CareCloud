package com.example.demo.controller;




import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Doctor;
import com.example.demo.model.DoctorLogin;
import com.example.demo.model.Patient;
import com.example.demo.model.Prescription;
import com.example.demo.service.DoctorLoginService;
import com.example.demo.service.DoctorService;
import com.example.demo.service.PatientService;
import com.example.demo.service.PrescriptionService;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	
	@Autowired
    private DoctorLoginService doctorLoginService;
	
	@Autowired
	private DoctorService doctorService;
	
	@Autowired
	private PrescriptionService prescriptionService;
	
	@Autowired
	private PatientService patientService;

    @GetMapping("/login")
    public String showDoctorLoginPage() {
        return "doctorLogin"; // Renders the doctorLogin.jsp
    }
    @GetMapping("/logout")
    public String showLogoutPage() {
        return "doctorLogin"; // Renders the doctorLogin.jsp
    }
    
    
    @PostMapping("/login")
    public ModelAndView performLogin(@RequestParam("username") String username,
                                     @RequestParam("password") String password,HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        boolean isAuthenticated = doctorLoginService.authenticate(username, password);
        if (isAuthenticated) {
        	Doctor doctor = doctorService.findDoctorByUsername(username);
        	session.setAttribute("loggedInDoctor", doctor);

            ModelAndView mav = new ModelAndView("doctorDashboard");
           // mav.addObject("doctorName", doctor.getName());
            mav.addObject("doctor", doctor);
            // Pass the doctor's name to the view
            return mav; // Redirect to doctor dashboard
        } else {
            modelAndView.setViewName("doctorLogin"); // Back to login page with error
            modelAndView.addObject("error", "Invalid Credentials!");
        }
        return modelAndView;
    }
    
    @GetMapping("/addPrescription")
    public ModelAndView showAddPrescriptionForm(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("addPrescription");

        // Fetch all patients to select from
        List<Patient> patients = patientService.getAllPatients();
        modelAndView.addObject("patients", patients);

        // Fetch the doctor from session
        Doctor doctor = (Doctor) session.getAttribute("loggedInDoctor");
        if (doctor == null) {
            throw new RuntimeException("No doctor logged in");
        }

        modelAndView.addObject("doctor", doctor);
        modelAndView.addObject("prescription", new Prescription());

        return modelAndView;
    }


    @PostMapping("/addPrescription")
    public String addPrescription(@ModelAttribute("prescription") Prescription prescription,
                                  @RequestParam("patientId") Long patientId,
                                  @RequestParam("doctorId") Long doctorId) {
        // Fetch the patient by ID
        Patient patient = patientService.getPatientById(patientId)
                .orElseThrow(() -> new RuntimeException("Patient not found"));

        // Fetch the doctor by ID
        Doctor doctor = doctorService.getDoctorById(doctorId)
                .orElseThrow(() -> new RuntimeException("Doctor not found"));

        // Set patient and doctor to prescription
        prescription.setPatient(patient);
        prescription.setDoctor(doctor);

        // Save prescription
        prescriptionService.addPrescription(prescription);

        return "doctorDashboard";
    }

    @GetMapping("/viewPrescription")
    public ModelAndView viewPrescription(@RequestParam("patientId") Long patientId, 
                                          @RequestParam("doctorId") Long doctorId) {
        // Fetch the prescriptions for the given patient and doctor
        List<Prescription> prescriptions = prescriptionService.findPrescriptionsByPatientAndDoctor(patientId, doctorId);
        
        // Create a ModelAndView object
        ModelAndView modelAndView = new ModelAndView("viewPrescriptions"); // Name of the JSP page to render
        
        // Add the prescriptions to the model
        modelAndView.addObject("prescriptions", prescriptions);
        
        // Optionally, add the patient ID and doctor ID if you need them in the view
        modelAndView.addObject("patientId", patientId);
        modelAndView.addObject("doctorId", doctorId);
        
        // Return the ModelAndView object
        return modelAndView;
    }
//    @GetMapping("/dashboard")
//    public ModelAndView showDashboardPage(@RequestParam("doctorId") Long doctorId) {
//        // Fetch the doctor object from the database using the doctorId
//        Optional<Doctor> doctor = doctorService.getDoctorById(doctorId);
//        
//        // Create a ModelAndView object
//        ModelAndView modelAndView = new ModelAndView("doctorDashboard"); // Make sure this matches your JSP file name
//        
//        // Add the doctor object to the model
//        modelAndView.addObject("doctor", doctor);
//        
//        return modelAndView; // Return the ModelAndView object
//    }
    
}