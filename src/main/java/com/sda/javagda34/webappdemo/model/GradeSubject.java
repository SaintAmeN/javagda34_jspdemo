package com.sda.javagda34.webappdemo.model;

public enum GradeSubject {
    ENGLISH("English"),
    POLISH("Polish"),
    IT("Information Technology"),
    HISTORY("History"),
    MATH("Math");

    private String name;

    GradeSubject(String subName) {
        this.name = subName;
    }

    public String getName() {
        return name;
    }
}
