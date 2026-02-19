package com.example.spring_boot_worker.infrastructure.dynamodb;

import java.time.Instant;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbBean;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbPartitionKey;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbSecondaryPartitionKey;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbSecondarySortKey;
import software.amazon.awssdk.enhanced.dynamodb.mapper.annotations.DynamoDbSortKey;

@NoArgsConstructor
@Getter
@Setter
@DynamoDbBean
abstract public class BaseEntity {
    private String pk;
    private String sk;
    private String entityType;
    private Instant createdAt;
    private Instant updatedAt;
    private String gsi1pk;
    private String gsi1sk;
    private Long ttl;

    @DynamoDbPartitionKey
    public String getPk(){
        return pk;
    }

    @DynamoDbSortKey
    public String getSk(){
        return sk;
    }

    @DynamoDbSecondaryPartitionKey(indexNames = "gsi1")
    public String getGsi1pk(){
        return gsi1pk;
    }

    @DynamoDbSecondarySortKey(indexNames = "gsi1")
    public String getGsi1sk(){
        return gsi1sk;
    }
}
