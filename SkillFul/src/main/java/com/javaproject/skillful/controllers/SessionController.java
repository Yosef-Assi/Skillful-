package com.javaproject.skillful.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.javaproject.skillful.models.Session;
import com.javaproject.skillful.repositories.SessionRepository;
import com.javaproject.skillful.services.SessionService;


//Note that the name of session "userId" is not exactly like that
@Controller
public class SessionController {
	@Autowired
	SessionService sessionService;
	
	@Autowired
	SessionRepository sessionRepository;
	
	//methods 
	//methods to add sessions 
	@GetMapping("/session/new") 
	public String allSessions(@ModelAttribute("newSession") Session newSession, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}else {
			return "add_session.jsp";
		}
	}
	
	@PostMapping("/session/new")
	public String createNewSession(@Valid @ModelAttribute("newSession") Session newSession, BindingResult result) {
		if (result.hasErrors()) {
			return "add_session.jsp";
		} else {
			sessionService.createSession(newSession);
			return "redirect:/mySession";
		}
	}
	
	//methods to retrieve all Sessions
	@GetMapping("/mySession")
	public String mySessions(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}else {
			model.addAttribute("mySession", sessionService.allSessions());
			return "my_session.jsp";
		}

	}
	
	//method to edit specific session 
	//first method to render edit page 
	@GetMapping("/sessoion/{session_id}/edit")
	public String editPage(@PathVariable("session_id") Long sessionId, HttpSession session, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}else {
			model.addAttribute("updatedSession", sessionService.findSession(sessionId));
			return "edit_session.jsp";
		}
	}
	
	//second method to edit a specific session
	@PutMapping("/sessoion/{session_id}/edit")
	public String updateSession(@Valid @ModelAttribute("updatedSession") Session updatedSession, BindingResult result, @PathVariable("session_id") Long session_id) {
		if (result.hasErrors()) {
			return "edit_session.jsp";
		}else {
			sessionService.createSession(updatedSession);
			return "redirect:/mySession";
		}
	}
	
	//method to delete a specific session
    @GetMapping("/delete/{session_id}")
    public String deleteBook(@PathVariable("session_id") Long session_id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
			return "redirect:/";
    	}
    	 Session sessionToDelete = sessionService.findSession(session_id);
    	 if (session.getAttribute("userId") == sessionToDelete.getStudent().getId()) {
			sessionService.deleteSession(session_id);
		}
			return "redirect:/mySession";
    }
	
}
