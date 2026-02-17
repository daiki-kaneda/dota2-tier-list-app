package com.example.spring_boot_worker.runner;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.example.spring_boot_worker.usecase.RefreshHeroDataUsecase;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@RequiredArgsConstructor
public class RefreshHeroRunner implements CommandLineRunner {

    private final RefreshHeroDataUsecase usecase;

    @Override
    public void run(String... args) throws Exception {
        log.info("バッチ処理開始");
        try {
            usecase.execute();
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        log.info("バッチ処理終了");
    }
}
