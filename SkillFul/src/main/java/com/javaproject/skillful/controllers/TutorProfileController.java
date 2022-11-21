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

import com.javaproject.skillful.models.Level;
import com.javaproject.skillful.models.Location;
import com.javaproject.skillful.models.TutorProfile;
import com.javaproject.skillful.models.TutorProfileSubjects;
import com.javaproject.skillful.services.SubjectService;
import com.javaproject.skillful.services.TutorProfileService;
import com.javaproject.skillful.services.TutorService;

@Controller
public class TutorProfileController {
	
	@Autowired
	TutorProfileService profileService;
	
	@Autowired
	TutorService tutorService;
	
	@Autowired
	SubjectService subjectService;
	
	// add authorization to different pages !!!
	
	
	// renders form for creating profile
	@GetMapping("/tutor/profile/create")
	public String newProfile(
			HttpSession session, 
			Model model, 
			@ModelAttribute("TutorProfile") TutorProfile tutorProfile) {
		model.addAttribute("locations", Location.values());
		return "createProfile.jsp";
	}
	
	// processes form for creating profile
	@PostMapping("/tutor/profile/create")
	public String createProfile(
			@Valid @ModelAttribute("TutorProfile") TutorProfile profile,
			BindingResult result, 
			Model model,
			HttpSession session) {
		if(result.hasErrors()) {
			return "createProfile.jsp";
		} else {
			profileService.createProfile(profile);
			Long profileId = profile.getId();
			return "redirect:/tutor/profile/"+profileId+"/subjects";
		}
	}
	
	// renders form for adding a subject to profile
	@GetMapping("/tutor/profile/{profileId}/subjects")
	public String subjects(
			@PathVariable("profileId") Long profileId,
			Model model,
			HttpSession session,
			@ModelAttribute("TutorProfileSubject") TutorProfileSubjects profileSubject) {
		TutorProfile thisProfile = profileService.findProfileById(profileId);
		model.addAttribute("tutorProfile", thisProfile);
		model.addAttribute("levels", Level.values());
		model.addAttribute("subjects", subjectService.allSubjects());
		return "addSubject.jsp";
	}
	
	// adds subject to profile
	@PostMapping("/tutor/profile/{profileId}/subjects")
	public String addSubject(
			@PathVariable("profileId") Long profileId,
			@ModelAttribute("TutorProfileSubject") TutorProfileSubjects profileSubject,
			HttpSession session,
			Model model) {
		profileService.addSubject(profileSubject);
		return "redirect:/tutor/profile/"+profileId+"/subjects";
	}
	
	// renders tutor profile
	@GetMapping("/tutor/profile/{id}")
	public String showProfile(
			@PathVariable("id") Long profileId,
			Model model,
			HttpSession session) {
		TutorProfile tutorProfile = profileService.findProfileById(profileId);
		model.addAttribute("profileSubjects", profileService.tutorSubjects(tutorProfile));
		model.addAttribute("tutorProfile", profileService.findProfileById(profileId));
		return "tutorProfile.jsp";
	}
	
	// renders form to edit tutor profile
	@GetMapping("/tutor/profile/{id}/edit")
	public String editProfile(
			@PathVariable("id") Long profileId,
			Model model,
			HttpSession session) {
		model.addAttribute("tutorProfile", profileService.findProfileById(profileId));
		return "editProfile.jsp";
	}
	
	// processes form that updates event
	@PutMapping("/tutor/profile/{id}/edit")
	public String updateProfile(
			@PathVariable("id") Long profileId,
			Model model, 
			@Valid @ModelAttribute("TutorProfile") TutorProfile profile,
			BindingResult result) {
		if (result.hasErrors()) {
			return "editProfile.jsp";
		} else {
			profileService.updateProfile(profile);
			return "redirect:/tutor/profile/"+profileId;
		}
	}
	
}

