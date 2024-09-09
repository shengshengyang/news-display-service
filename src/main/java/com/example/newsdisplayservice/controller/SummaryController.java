package com.example.newsdisplayservice.controller;

import com.example.newsdisplayservice.model.Summary;
import com.example.newsdisplayservice.repository.SummaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class SummaryController {

    @Autowired
    SummaryRepository summaryRepository;

    // 顯示單一統整新聞的頁面
    @GetMapping("/summary/{id}")
    public String viewSummary(@PathVariable Long id, Model model) {
        var summary = summaryRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid summary ID"));
        model.addAttribute("summary", summary);
        return "summary";
    }

    // 顯示每日統整列表的頁面
    @GetMapping("/summaries")
    public String viewSummariesByDate(Model model) {
        List<Summary> summaries = summaryRepository.findAll();

        // 按日期分組，忽略時間部分
        Map<LocalDate, List<Summary>> summariesByDate = summaries.stream()
                .collect(Collectors.groupingBy(Summary::getGeneratedAt));  // 將 Timestamp 轉換為 LocalDate

        model.addAttribute("summariesByDate", summariesByDate);
        return "summary-list";
    }
}
