package com.example.spring_boot_worker.entity;

import lombok.Value;

@Value
public class Hero {
    private final String name;
    private final int picks;
    private final int wins;

    public Hero(String name, int picks, int wins) {
        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException("名前が空欄です。");
        }
        if (picks < 0 || wins < 0) {
            throw new IllegalArgumentException("負の値は許可されていません。");
        }
        if (picks < wins) {
            throw new IllegalArgumentException("ピック数は勝利数以上でなくてはいけません。");
        }

        this.name = name;
        this.picks = picks;
        this.wins = wins;
    }

    public double calculateWinRate() {
        if (picks == 0) {
            return 0.0;
        }
        return (double) wins / picks * 100.0;
    }

    public String getTier() {
        double winRate = calculateWinRate();
        if (winRate >= 55.0)return "S";
        if (winRate >= 52.0)return "A";
        if (winRate >= 49.0)return "B";
        return "C";
    }
}
