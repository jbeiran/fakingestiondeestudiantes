/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import models.Student;

/**
 *
 * @author Flavio
 */
public class Main {
    
    public static void main(String[] args) {
        var sm = new StudentController();
        var list = sm.getStudents();
        for (Student s: list) System.out.println(s);
        if (sm.deleteStudent(11)) System.out.println("se borro");
        for (Student s: list) System.out.println(s);
    }
    
}
