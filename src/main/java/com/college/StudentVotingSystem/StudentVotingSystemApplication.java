package com.college.StudentVotingSystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.server.servlet.context.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class StudentVotingSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(StudentVotingSystemApplication.class, args);
    }
}