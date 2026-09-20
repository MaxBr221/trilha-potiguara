package br.com.tupidigital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class TupiDigitalApplication {

    public static void main(String[] args) {
        SpringApplication.run(TupiDigitalApplication.class, args);
    }

}
