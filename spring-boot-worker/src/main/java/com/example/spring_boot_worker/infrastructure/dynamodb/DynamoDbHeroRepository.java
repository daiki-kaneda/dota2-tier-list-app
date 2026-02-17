package com.example.spring_boot_worker.infrastructure.dynamodb;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.spring_boot_worker.config.DynamoDbProperties;
import com.example.spring_boot_worker.entity.Hero;
import com.example.spring_boot_worker.usecase.port.HeroRepository;
import com.google.common.collect.Lists;

import lombok.RequiredArgsConstructor;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbEnhancedClient;
import software.amazon.awssdk.enhanced.dynamodb.DynamoDbTable;
import software.amazon.awssdk.enhanced.dynamodb.TableSchema;
import software.amazon.awssdk.enhanced.dynamodb.model.WriteBatch;

@Repository
@RequiredArgsConstructor
public class DynamoDbHeroRepository implements HeroRepository {
    private final DynamoDbEnhancedClient client;
    private final DynamoDbProperties properties;

    private DynamoDbTable<HeroItem> table() {
        return client.table(properties.getTableName(), TableSchema.fromBean(HeroItem.class));
    }

    private WriteBatch.Builder<HeroItem> getWriteBatchBuilder() {
        return WriteBatch
                .builder(HeroItem.class)
                .mappedTableResource(table());

    }

    @Override
    public void saveAll(List<Hero> heroes) {
        for (List<Hero> chunck : Lists.partition(heroes, properties.getBatchWriteChunckSize())) {
            WriteBatch.Builder<HeroItem> heroItems = getWriteBatchBuilder();

            for (Hero hero : chunck) {
                heroItems.addPutItem(HeroItem.fromDomain(hero));
            }
            WriteBatch batch = heroItems.build();
            client.batchWriteItem(b -> b.addWriteBatch(batch));
        }
    }
}
