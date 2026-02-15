package com.example.spring_boot_worker.entity;

import lombok.Getter;

@Getter
public class Hero {
    private String name;
    private int picks;
    private int wins;

    private Hero(){}

    public double calculateWinRate() {
        if (picks == 0) {
            return 0.0;
        }
        return (double) wins / picks * 100.0;
    }

    public static Hero create(String name, int picks, int wins) {
        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException("名前が空欄です。");
        }
        if (picks < 0 || wins < 0) {
            throw new IllegalArgumentException("負の値は許可されていません。");
        }
        if (picks < wins) {
            throw new IllegalArgumentException("ピック数は勝利数以上でなくてはいけません。");
        }
        Hero hero = new Hero();
        hero.name = name;
        hero.picks = picks;
        hero.wins = wins;

        return hero;
    }
}
