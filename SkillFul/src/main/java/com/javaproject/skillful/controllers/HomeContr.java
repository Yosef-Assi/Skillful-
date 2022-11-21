package com.javaproject.skillful.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaproject.skillful.models.Location;
import com.javaproject.skillful.services.TestServ;

@Controller
public class HomeContr {
	@Autowired
	TestServ testServ;
	
	
	@PostMapping("/search")
	public String dashboard(@RequestParam("search") String search,@RequestParam("location") String location,@RequestParam("level") String level,Model model) {
			
			if(location.contains("None") && level.contains("All")) {
			
			return "redirect:/search/"+search;
			
			}
			
			else if (level.contains("All")){
				return "redirect:/search/"+search+"/"+location;

			}
			else if (location.contains("None") && !level.contains("All")){
				return "redirect:/search/level/"+search+"/"+level;

			}
			else if (!location.contains("None") && !level.contains("All")) {
				return "redirect:/search/location/"+search+"/"+location+"/"+level;

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
	
	@GetMapping("/search/{search}/{location}")
	public String search(@PathVariable("search") String search,@PathVariable("location") int location, Model model) {
		List<Object []> skills = testServ.findSkillLoc(search,location);
		System.out.println(skills);
		model.addAttribute("skills", skills);
		return "filter.jsp";
	}
	

	@GetMapping("/search/level/{search}/{level}")
	public String searchLevel(@PathVariable("search") String search,@PathVariable("level") int level, Model model) {
		List<Object []> skills = testServ.findSkillLevel(search,level);
		System.out.println(skills);
		model.addAttribute("skills", skills);
		return "filter.jsp";
	}
	
	@GetMapping("/search/location/{search}/{location}/{level}")
	public String searchLevel(@PathVariable("search") String search,@PathVariable("location") int location,@PathVariable("level") int level, Model model) {
		List<Object []> skills = testServ.findSkillLevellocation(search,location,level);
		System.out.println(skills);
		model.addAttribute("skills", skills);
		return "filter.jsp";
	}
}










