/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import models.Student;

public class Main {
    
    public static void main(String[] args) {
        var studentController = new StudentController();
        var students = studentController.getStudents();
        
        System.out.println("\n=== Lista de Estudiantes Actual ===\n");
        printStudentList(students);
        
        System.out.println("\n=== Intentando eliminar estudiante con ID 11 ===\n");
        if (studentController.deleteStudent(11)) {
            System.out.println("✓ Estudiante eliminado correctamente");
        } else {
            System.out.println("✗ Error al eliminar estudiante");
        }
        
        System.out.println("\n=== Lista de Estudiantes Actualizada ===\n");
        students = studentController.getStudents();
        printStudentList(students);
    }
    
    private static void printStudentList(java.util.List<Student> students) {
        if (students.isEmpty()) {
            System.out.println("No hay estudiantes registrados");
            return;
        }
        
        String format = "| %-4s | %-20s | %-25s | %-4s | %-5s | %-4s | %-15s |\n";
        System.out.println("+" + "-".repeat(89) + "+");
        System.out.printf(format, "ID", "Nombre", "Apellidos", "Edad", "Nota", "Curso", "Tiene Foto");
        System.out.println("+" + "-".repeat(89) + "+");
        
        for (Student s : students) {
            System.out.printf(format,
                s.id(),
                s.name(),
                s.surnames(),
                s.age(),
                s.grade(),
                s.course(),
                s.photo() ? "Sí" : "No"
            );
        }
        System.out.println("+" + "-".repeat(89) + "+");
    }
}