package com.example.spring_boot_worker.usecase;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring_boot_worker.entity.Hero;
import com.example.spring_boot_worker.usecase.port.HeroDataSource;
import com.example.spring_boot_worker.usecase.port.HeroRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RefreshHeroDataUsecase {
    private final HeroDataSource heroDataSource;
    private final HeroRepository heroRepository;

    void execute() {
        List<Hero> heros = heroDataSource.fetchAllHeros();
        heroRepository.saveAll(heros);
    }
}
