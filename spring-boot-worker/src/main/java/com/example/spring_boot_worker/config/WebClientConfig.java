package com.example.spring_boot_worker.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
public class WebClientConfig{
    @Bean
    public WebClient openDotaWebClient(){
        return WebClient.builder()
        .baseUrl("https://api.opendota.com/api")
        .build();
    }
}
