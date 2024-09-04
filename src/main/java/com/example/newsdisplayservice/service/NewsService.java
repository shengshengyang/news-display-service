package com.example.newsdisplayservice.service;

import com.example.newsdisplayservice.model.News;
import com.example.newsdisplayservice.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class NewsService {

    @Autowired
    private NewsRepository newsRepository;

    public List<News> getNewsByCategory(String category) {
        return newsRepository.findByCategory(category);
    }
}
