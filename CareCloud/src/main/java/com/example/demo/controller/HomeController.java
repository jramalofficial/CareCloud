package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")  // Maps the root URL to index.jsp
    public String showHomePage() {
        return "index";  // Returns the index.jsp located in /WEB-INF/jsp/
    }
}