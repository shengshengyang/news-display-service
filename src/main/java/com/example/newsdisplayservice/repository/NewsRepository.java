package com.example.newsdisplayservice.repository;

import com.example.newsdisplayservice.model.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface NewsRepository extends JpaRepository<News, Long> {
    List<News> findByCategoryAndDate(String category, LocalDate date);

    List<News> findByCategory(String category);
}
