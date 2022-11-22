package com.javaproject.skillful.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.javaproject.skillful.models.Student;

public interface StudentRepository extends CrudRepository<Student, Long> {
    Optional<Student> findByEmail(String email);
}
