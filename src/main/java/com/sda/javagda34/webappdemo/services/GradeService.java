package com.sda.javagda34.webappdemo.services;

import com.sda.javagda34.webappdemo.database.EntityDao;
import com.sda.javagda34.webappdemo.model.Grade;
import com.sda.javagda34.webappdemo.model.GradeSubject;
import com.sda.javagda34.webappdemo.model.Student;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletRequest;
import java.util.Optional;

@Slf4j
public class GradeService {
    private final EntityDao<Grade> gradeEntityDao = new EntityDao<>();
    private final EntityDao<Student> studentEntityDao = new EntityDao<>();

    public Optional<Grade> processFormParameters(ServletRequest req){
        String studentId = req.getParameter("studentId");
        String gradeValue = req.getParameter("gradeValue");
        String subject = req.getParameter("subject");

        Double gValue;
        Long sId;
        GradeSubject gSubject;
        try { // parsowanie - jeśli coś pójdzie nie tak to nie ma sensu kontynuować
            sId = Long.parseLong(studentId);
            gValue = Double.parseDouble(gradeValue);
            gSubject = GradeSubject.valueOf(subject);
        }catch (Exception e){
            // tutaj błąd wypisać i:
            log.error("Unable to parse value.");
            return Optional.empty();
        }

        Optional<Student> studentOptional = studentEntityDao.findById(sId, Student.class);
        if(studentOptional.isPresent()){
            // kontynuujemy
            Student student = studentOptional.get();
            Grade grade = new Grade(null, gValue, gSubject, null, student);

            return Optional.of(grade);
        }else{
            // metoda się wykrzacza :(
            // wypisać informację, że nie znaleziono studenta
            log.error("Student not found.");
        }
        return Optional.empty();
    }

    public void save(Grade grade) {
        log.info("Saving: " + grade);
        gradeEntityDao.saveOrUpdate(grade);
    }

    public void deleteGrade(String gradeId) {
        // zmiana string - > long
        Long gradeIdentifier = Long.parseLong(gradeId);

        // szukanie oceny w bazie danych (możemy usunąć tylko obiekt który istnieje)
        Optional<Grade> optionalGrade = gradeEntityDao.findById(gradeIdentifier, Grade.class);
        if(optionalGrade.isPresent()){ // upewniamy się że obiekt został odnaleziony
            Grade grade = optionalGrade.get(); // wyciągamy obiekt z optional

            gradeEntityDao.delete(grade); // usuwamy obiekt
        }else{
            log.error("Couldn't find grade."); // jeśli nie znajdziemy obiektu, to wypisujemy log
        }
    }
}
