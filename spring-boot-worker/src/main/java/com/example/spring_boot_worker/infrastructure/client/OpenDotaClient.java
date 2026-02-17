package com.example.spring_boot_worker.infrastructure.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import com.example.spring_boot_worker.entity.Hero;
import com.example.spring_boot_worker.infrastructure.client.dto.HeroStatsDto;
import com.example.spring_boot_worker.usecase.port.HeroDataSource;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class OpenDotaClient implements HeroDataSource {
    @Qualifier("openDotaWebClient")
    private final WebClient webClient;

    @Override
    public List<Hero> fetchAllHeroes() {
        return webClient.get()
        .uri("/heroStats")
        .retrieve()
        .bodyToFlux(HeroStatsDto.class)
        .map(HeroStatsDto::toDomain)
        .collectList()
        .block();
    }
}
