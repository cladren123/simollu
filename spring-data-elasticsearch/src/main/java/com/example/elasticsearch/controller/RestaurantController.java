package com.example.elasticsearch.controller;

import com.example.elasticsearch.model.dto.restaurant.RestaurantFavoriteResponse;
import com.example.elasticsearch.model.dto.search.SearchInfoResponse;
import com.example.elasticsearch.model.service.RestaurantService;
import java.io.IOException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/")
public class RestaurantController {

    private final RestaurantService restaurantService;

    // es로 보내기
    @PostMapping("/restaurantDocuments")
    public ResponseEntity<Void> saveRestaurantDocuments() throws IOException {
        restaurantService.saveAllRestaurantDocuments();
        return ResponseEntity.ok().build();
    }

    // 레스토랑 상세검색
    @GetMapping("/{restaurantSeq}")
    public ResponseEntity<SearchInfoResponse> getSearchInfo(@PathVariable("restaurantSeq") long restaurantSeq) throws IOException {
        return ResponseEntity.ok(restaurantService.getSearchInfo(restaurantSeq));
    }

    @PostMapping("/favoriteList")
    public List<RestaurantFavoriteResponse>  receiveListOfPersons(@RequestBody List<Long> restaurantFavoriteList) {
        return restaurantService.getRestaurantFavoriteInfo(restaurantFavoriteList);
    }

    @GetMapping("/favorite/{restaurantSeq}")
    public RestaurantFavoriteResponse  receiveRestaurant(@PathVariable("restaurantSeq") Long restaurantSeq) {
        return restaurantService.getRestaurantFavorite(restaurantSeq);
    }

}
