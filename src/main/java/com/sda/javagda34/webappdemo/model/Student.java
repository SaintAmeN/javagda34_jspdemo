package com.sda.javagda34.webappdemo.model;

import com.sda.javagda34.webappdemo.model.Gender;
import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of = {"indexNumber"})
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private String indexNumber; //unikalny
    private String firstName;
    private String lastName;
    private Double average;
    private Gender gender;
    private boolean active;

}
