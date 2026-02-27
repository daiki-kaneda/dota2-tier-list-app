package com.example.spring_boot_worker.entity;

import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

public class HeroTests {

    @Test
    void constructor_ValidInputs_SetsPropertiesCorrect() {
        Hero hero = new Hero("Anti-Mage", 100, 60);
        assertThat(hero.getName()).isEqualTo("Anti-Mage");
        assertThat(hero.getPicks()).isEqualTo(100);
        assertThat(hero.getWins()).isEqualTo(60);
    }

    @ParameterizedTest(name = "名前が{0}の時、エラーを返すこと")
    @CsvSource(value = {
            "''", "' '", "null"
    }, nullValues = "null")
    public void constructor_WhenIllegalName_ThrowsException(String name) {
        assertThrows(
                IllegalArgumentException.class,
                () -> {
                    new Hero(name, 0, 0);
                });
    }

    @ParameterizedTest(name = "ピック数が{0}で勝利数が{1}の時,負の値が許可されていないエラーを返すこと")
    @CsvSource({
            "-1,3",
            "1,-2",
            "-1,-2",
    })
    public void constructor_WhenNegativePicksOrWins_ThrowsException(
            int picks, int wins) {
        IllegalArgumentException e = assertThrows(
                IllegalArgumentException.class,
                () -> {
                    new Hero("HeroName", picks, wins);
                });

        assertThat(e.getMessage())
                .contains("負の値");

    }

    @ParameterizedTest(name = "ピック数が勝利数より少ない時、エラーを返すこと")
    @CsvSource({
            "0,3",
            "1,5",
            "10,11",
    })
    public void constructor_WhenPicksIsLowerThanWins_ThrowsException(
            int picks, int wins) {
        IllegalArgumentException e = assertThrows(
                IllegalArgumentException.class,
                () -> {
                    new Hero("HeroName", picks, wins);
                });

        assertThat(e.getMessage())
                .contains("ピック数は勝利数以上");

    }

    @ParameterizedTest(name = "{1}勝/{0}ピックの時、Tierが[{2}]であること")
    @CsvSource({
            "100, 55, S",
            "100, 52, A",
            "100, 49, B",
            "100, 48, C",
            "0, 0, C"
    })
    void getTier_VariousStats_ReturnsExpectedTier(int picks, int wins, String expectedTier) {
        Hero hero = new Hero("Hero", picks, wins);
        assertThat(hero.getTier()).isEqualTo(expectedTier);
    }
}
