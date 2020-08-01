package com.sda.javagda34.webappdemo.model;

import com.sda.javagda34.webappdemo.model.Gender;
import lombok.*;
import org.hibernate.annotations.Formula;

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

    // SELECT id, active, average, firstName, gender, indexNumber, lastName, (select avg(g.value) from Grade g where g.student_id=s.id) as average2 FROM javagda34_hibernate_students.Student s;
    // pole adnotowane przez formula przestaje być kolumną
    // musi być wielką literą (Double), żeby wartość mogła być nullem (dzieje się tak w przypadku braku ocen)
    @Formula(value = "(select avg(g.value) from Grade g where g.student_id=id)")
    private Double average;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    private boolean active;

    @OneToMany(mappedBy = "student", fetch = FetchType.EAGER)
    @EqualsAndHashCode.Exclude
    private Set<Grade> gradeSet = new HashSet<>();
}
