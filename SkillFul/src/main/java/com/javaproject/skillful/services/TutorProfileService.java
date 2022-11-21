package com.javaproject.skillful.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaproject.skillful.models.TutorProfile;
import com.javaproject.skillful.models.TutorProfileSubjects;
import com.javaproject.skillful.repositories.TutorProfileRepository;
import com.javaproject.skillful.repositories.TutorProfileSubjectRepository;

@Service
public class TutorProfileService {
	
	@Autowired 
	TutorProfileRepository profileRepo;
	@Autowired
	TutorProfileSubjectRepository profileSubjectRepo;
	
	
	// creates profile
	public TutorProfile createProfile(TutorProfile p) {
		return profileRepo.save(p);
	}
	
	// updates profile
	public TutorProfile updateProfile(TutorProfile p) {
		return profileRepo.save(p);
		
	}
	
	// deletes profile
	public void deleteProfile(Long id) {
		profileRepo.deleteById(id);
	}
	
	// retrieves a profile using profile id
	public TutorProfile findProfileById(Long id) {
		Optional<TutorProfile> optionalProfile = profileRepo.findById(id);
		if (optionalProfile.isPresent()) {
			return optionalProfile.get();
		} else {
			return null;
		}
	}
	
	
	// adds skill to profile
	public TutorProfileSubjects addSubject(TutorProfileSubjects s) {
		return profileSubjectRepo.save(s);
	}

}
