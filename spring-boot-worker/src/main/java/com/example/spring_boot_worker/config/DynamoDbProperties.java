package com.example.spring_boot_worker.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@ConfigurationProperties(prefix = "app.dynamodb")
@Data
@Component
public class DynamoDbProperties {
    private String region;
    private String tableName;
    private int batchWriteChunckSize;
}
