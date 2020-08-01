package com.sda.javagda34.webappdemo.model;

import com.sda.javagda34.webappdemo.model.Gender;
import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@ToString
@Builder
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
// POJO - Plain Old Java Object
//          - prywatne pola
//          - gettery settery
//          - pusty konstruktor (no args)
@Entity
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // auto_increment
    private Long id;

    private String indexNumber; //unikalny
    private String firstName;
    private String lastName;
    private Double average;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    private boolean active;

    @OneToMany(mappedBy = "student", fetch = FetchType.EAGER)
    @EqualsAndHashCode.Exclude
    private Set<Grade> gradeSet = new HashSet<>();
}
