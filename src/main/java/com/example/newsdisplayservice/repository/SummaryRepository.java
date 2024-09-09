package com.example.newsdisplayservice.repository;

import com.example.newsdisplayservice.model.Summary;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface SummaryRepository extends JpaRepository <Summary, Long>{

    // 查詢指定日期生成的統整
    List<Summary> findByGeneratedAt(LocalDate generatedAt);
}
