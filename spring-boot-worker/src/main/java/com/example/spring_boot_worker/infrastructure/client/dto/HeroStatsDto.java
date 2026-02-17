package com.example.spring_boot_worker.infrastructure.client.dto;

import com.example.spring_boot_worker.entity.Hero;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class HeroStatsDto {
    @JsonProperty("localized_name")
    private String name;
    
    @JsonProperty("pro_pick")
    private int picks;
    
    @JsonProperty("pro_win")
    private int wins;

    public Hero toDomain() {
        return new Hero(name, picks, wins);
    }
}