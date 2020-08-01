package com.sda.javagda34.webappdemo.services;

import com.sda.javagda34.webappdemo.database.EntityDao;
import com.sda.javagda34.webappdemo.model.Student;

import java.util.List;

public class StudentService {
    private final EntityDao<Student> studentEntityDao = new EntityDao<>();

    public List<Student> findAll() {
        return studentEntityDao.findAll(Student.class);
    }
}
