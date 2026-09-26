package br.com.tupidigital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableAsync
@EnableCaching
public class TupiDigitalApplication {

    public static void main(String[] args) {
        SpringApplication.run(TupiDigitalApplication.class, args);
    }

}
