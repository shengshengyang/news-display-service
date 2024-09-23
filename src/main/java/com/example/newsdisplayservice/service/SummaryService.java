package com.example.newsdisplayservice.service;

import com.example.newsdisplayservice.model.Summary;
import com.example.newsdisplayservice.repository.SummaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class SummaryService {

    @Autowired
    SummaryRepository summaryRepository;

    public Map<LocalDate, List<Summary>> getSummariesGroupedByDate() {
        List<Summary> summaries = summaryRepository.findAll();

        // 按日期分組，忽略時間部分
        return summaries.stream()
                .collect(Collectors.groupingBy(Summary::getGeneratedAt));  // 將 Timestamp 轉換為 LocalDate
    }
}
