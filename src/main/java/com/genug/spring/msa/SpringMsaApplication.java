package com.genug.spring.msa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;

@SpringBootApplication
public class SpringMsaApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringMsaApplication.class, args);
    }

}
