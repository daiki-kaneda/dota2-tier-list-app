package com.example.spring_boot_worker.usecase;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.example.spring_boot_worker.entity.Hero;
import com.example.spring_boot_worker.usecase.port.HeroDataSource;
import com.example.spring_boot_worker.usecase.port.HeroRepository;

@ExtendWith(MockitoExtension.class)
public class RefreshHeroDataUsecaseTests {
    @Mock
    private HeroDataSource heroDataSource;
    @Mock
    private HeroRepository heroRepository;

    @InjectMocks
    private RefreshHeroDataUsecase usecase;

    @Test
    @DisplayName("実行時に、ヒーローのデータが取得され、保存されること")
    public void excute_WhenInvoked_FetchAllHeroDataAndSave() {
        List<Hero> expectedHeroes = List.of(
                new Hero("Mars", 10, 6),
                new Hero("Anti-Mage", 20, 11));
        when(heroDataSource.fetchAllHeroes())
                .thenReturn(expectedHeroes);

        usecase.execute();

        verify(heroRepository, times(1))
                .saveAll(expectedHeroes);
    }

    @Test
    @DisplayName("取得したヒーローデータが空の時、保存せずにエラーを返すこと")
    public void excute_WhenNoHeroDataFetched_ThrowsExceptionAndNotSave() {
        List<Hero> emptyHeroes = List.of();
        when(heroDataSource.fetchAllHeroes())
                .thenReturn(emptyHeroes);

        assertThrows(
                IllegalStateException.class,
                () -> {
                    usecase.execute();
                });

        verify(heroRepository, never())
                .saveAll(emptyHeroes);
    }

}
