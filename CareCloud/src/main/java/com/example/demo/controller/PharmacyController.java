package com.example.demo.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Prescription;
import com.example.demo.service.PharmacyLoginService;
import com.example.demo.service.PrescriptionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/pharmacy")
public class PharmacyController {
	
	@Autowired
    private PrescriptionService prescriptionService;
	
	@Autowired
	private PharmacyLoginService pharmacyLoginService;

    @GetMapping("/login")
    public String showPharmacyLoginPage() {
        return "pharmacyLogin"; // Renders the pharmacyLogin.jsp
    }
    
    @PostMapping("/login")
    public ModelAndView performLogin(@RequestParam("username") String username,
                                     @RequestParam("password") String password) {
        ModelAndView modelAndView = new ModelAndView();
        boolean isAuthenticated = pharmacyLoginService.authenticate(username, password);
        if (isAuthenticated) {
            modelAndView.setViewName("pharmacyDashboard"); // Redirect to pharmacy dashboard
        } else {
            modelAndView.setViewName("pharmacyLogin"); // Back to login page with error
            modelAndView.addObject("error", "Invalid Credentials!");
        }
        return modelAndView;
    }
    @GetMapping("/viewPrescriptions")
    public ModelAndView viewPrescriptions() {
        List<Prescription> prescriptions = prescriptionService.getAllPrescriptions();
        
        // Create a ModelAndView object and set the view name to 'viewPrescriptions'
        ModelAndView mav = new ModelAndView("viewPrescriptions");
        
        // Add the prescriptions list as a model attribute
        mav.addObject("prescriptions", prescriptions);
        
        return mav;  // Return the ModelAndView object
    }
    @GetMapping("/dashboard")
    public String showdashboard() {
    	return "pharmacyDashboard";
    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        // Invalidate the current session and redirect to the login page
        request.getSession().invalidate();
        return "redirect:/pharmacy/login";
    }
    
    
}