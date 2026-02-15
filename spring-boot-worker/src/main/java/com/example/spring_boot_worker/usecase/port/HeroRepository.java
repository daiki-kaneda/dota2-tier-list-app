package com.example.spring_boot_worker.usecase.port;

import java.util.List;

import com.example.spring_boot_worker.entity.Hero;

public interface HeroRepository {
    void saveAll(List<Hero> heros);
}
