package com.javaproject.skillful.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.skillful.models.User;
import com.javaproject.skillful.services.UserService;
import com.javaproject.skillful.validator.UserValidator;

@Controller
public class UserController {
    
    private UserValidator userValidator;
    
    private UserService userService;
    
    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }
    
    @RequestMapping("/registration")
    public String registerForm(@ModelAttribute("user") User user) {
        return "UserRegistration.jsp";
    }

    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {

        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "UserRegistration.jsp";
        }
        
        userService.saveWithUserRole(user);
        return "redirect:/login";
    }
  
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
    	String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "adminPage.jsp";
    }
   
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "UserLogin.jsp";
    }
    
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model) {

        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "homePage.jsp";
    }
}
