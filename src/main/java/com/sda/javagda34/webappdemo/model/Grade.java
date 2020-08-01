package com.sda.javagda34.webappdemo.model;

import com.sun.xml.bind.v2.model.core.ID;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double value; // wartość oceny
    private GradeSubject subject;

    // data wystawienia
    @CreationTimestamp
    private LocalDate dateAdded; // now

    @ManyToOne()
    private Student student;
}
