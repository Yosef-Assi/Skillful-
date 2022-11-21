package com.javaproject.skillful.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.skillful.services.TestServ;

@Controller
public class HomeContr {
	@Autowired
	TestServ testServ;
	
	
	@PostMapping("/search")
	public String dashboard(@RequestParam("search") String search,@RequestParam("filter") String filter,Model model) {
		if(filter.equals("skill")) {
			
			return "redirect:/search/"+search;
//			
		}
	
		return "redirect:/search/";
	}
	@GetMapping("/search/{search}")
	public String search(@PathVariable("search") String search, Model model) {
		List<Object []> skills = testServ.findSkill(search);
		System.out.println(skills);
		model.addAttribute("skills", skills);
		return "filter.jsp";
	}
}










