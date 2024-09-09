package com.example.newsdisplayservice.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "news")
public class News {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 255)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String summary;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String content;

    @Column(name = "image_url", length = 255)
    private String imageUrl;

    @Column(nullable = false, unique = true, length = 255)
    private String link;

    @Column(nullable = false, length = 100)
    private String category;

    @Column(nullable = false)
    private LocalDate date;

    // 新增與 Summary 的多對多關聯
    @ManyToMany(mappedBy = "newsSources")
    private Set<Summary> summaries;
}