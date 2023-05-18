package com.simollu.UserService.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@Slf4j
public class RedisService {
    private final RedisTemplate<String, Object> redisTemplate;
    private final ObjectMapper objectMapper;
    private final String FCM_KEY = "uft";

    public RedisService(RedisTemplate<String, Object> redisTemplate, ObjectMapper objectMapper) {
        this.redisTemplate = redisTemplate;
        this.objectMapper = objectMapper;
    }

    // firebase token 저장
    public void saveUserFirebaseToken(String key, String token) throws JsonProcessingException{
        HashOperations<String, String, String> hashOps = redisTemplate.opsForHash();
        Map<String, String> map = hashOps.entries(FCM_KEY);
        map.put(key, token);
        hashOps.putAll(FCM_KEY, map);
    }

    // token 조회
    public String getFirebaseToken(String key) {
        HashOperations<String, String, String> hashOps = redisTemplate.opsForHash();
        Map<String, String> map = hashOps.entries(FCM_KEY);
//        System.out.println("token 조회" + map.get(key));
        return map.get(key);
    }
}//RedisService
