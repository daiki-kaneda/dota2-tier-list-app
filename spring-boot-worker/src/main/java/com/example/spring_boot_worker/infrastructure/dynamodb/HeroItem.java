package com.example.spring_boot_worker.infrastructure.dynamodb;

import java.time.Instant;

import com.example.spring_boot_worker.entity.Hero;

import lombok.Getter;
import lombok.Setter;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;

@Getter
@Setter
@DynamoDbBean
public class HeroItem extends BaseEntity{
    private String name;
    private double winRate;
    private String tier;
    private int picks;
    private int wins;

    public static HeroItem fromDomain(Hero hero){
        HeroItem item = new HeroItem();
        item.setPk("RANKING#LATEST");
        item.setSk("HERO#"+hero.getName());
        item.setEntityType("HERO");
        Instant now = Instant.now();
        item.setCreatedAt(now);
        item.setUpdatedAt(now);
        item.setGsi1pk("RANKING#LATEST");
        String paddedWinRate = String.format("%06.2f", hero.calculateWinRate());
        item.setGsi1sk("WINRATE#"+paddedWinRate);

        item.name = hero.getName();
        item.winRate = hero.calculateWinRate();
        item.tier = hero.getTier();
        item.picks = hero.getPicks();
        item.wins = hero.getWins();
        return item;
    }
}
