package com.example.newsdisplayservice.controller;

import com.example.newsdisplayservice.model.News;
import com.example.newsdisplayservice.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @GetMapping("/news/{category}")
    public String getNewsByCategory(@PathVariable String category, Model model) {
        List<News> newsList = newsService.getNewsByCategory(category);
        model.addAttribute("category",category);
        model.addAttribute("newsList", newsList);
        return "news-list";
    }
}