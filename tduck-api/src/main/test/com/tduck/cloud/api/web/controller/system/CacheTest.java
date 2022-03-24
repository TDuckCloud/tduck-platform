package com.tduck.cloud.api.web.controller.system;

import com.tduck.cloud.common.util.CacheUtils;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class CacheTest {

    @Autowired
    CacheUtils cacheUtils;

    @org.junit.Test
    public void genEnumByDict() {
//        cacheUtils.save("aa","aaa");
        System.out.println(cacheUtils.get("aa"));
    }

}