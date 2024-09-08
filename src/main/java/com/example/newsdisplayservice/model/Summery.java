package com.example.newsdisplayservice.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "summary")
public class Summery {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "summary_text", nullable = false)
    private String summaryText;

    @Column(name = "generated_at", nullable = false)
    private LocalDate generatedAt;

    // 定義與 News 的多對多關聯
    @ManyToMany
    @JoinTable(
            name = "news_summary_sources",
            joinColumns = @JoinColumn(name = "summary_id"),
            inverseJoinColumns = @JoinColumn(name = "news_id")
    )
    private Set<News> newsSources;
}
