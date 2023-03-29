package com.tduck.cloud.form.service.data;

import cn.hutool.core.convert.Convert;
import com.mongodb.client.MongoClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.mongo.MongoProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author : wangqing
 * @description : mongo 模板
 * @create :  2022/10/08 11:52
 **/
@Component
@ConditionalOnClass({MongoClient.class})
@EnableConfigurationProperties({MongoProperties.class})
@ConditionalOnMissingBean(type = {"org.springframework.data.mongodb.MongoDatabaseFactory"})
@ConditionalOnProperty(prefix = "spring.data.mongodb", name = "host")
public class TduckMongoTemplate {

    @Autowired(required = false)
    private MongoTemplate mongoTemplate;

    public MongoTemplate getMongoTemplate() {
        return mongoTemplate;
    }

    /**
     * 新增数据
     *
     * @param objectToSave   保存对象
     * @param collectionName 集合名称
     * @return 是否成功
     */
    public boolean save(Object objectToSave, String collectionName) {
        if (null != mongoTemplate) {
            mongoTemplate.insert(objectToSave, collectionName);
        }
        return true;
    }

    /**
     * 修改数据
     *
     * @param objectToSave   修改对象
     * @param id             主键
     * @param collectionName 集合名称
     * @return 是否成功
     */
    public boolean updateById(Map<String, Object> objectToSave, Object id, String collectionName) {
        if (null != mongoTemplate) {
            Query query = Query.query(Criteria.where("id").is(id));
            Update update = new Update();
            objectToSave.forEach(update::set);
            mongoTemplate.updateFirst(query, update, collectionName);
        }
        return true;
    }

    /**
     * 删除数据
     *
     * @param ids            删除对象
     * @param collectionName 集合名称
     * @return 是否成功
     */
    public boolean deleteByIds(List<String> ids, String collectionName) {
        if (null != mongoTemplate) {
            List<Long> longIds = ids.stream().map(id -> Convert.convert(Long.class, id)).collect(Collectors.toList());
            mongoTemplate.remove(Query.query(Criteria.where("id").in(longIds)), collectionName);
        }
        return true;
    }


}
