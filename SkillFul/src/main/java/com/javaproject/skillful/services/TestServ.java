package com.javaproject.skillful.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaproject.skillful.repositories.TestRepo;
@Service
public class TestServ {
		@Autowired 
		TestRepo testRepo;
		
		public List<Object []> findSkill(String skill){
			return testRepo.findByskills(skill);
		}
}
