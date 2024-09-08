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
    private String title;
    private String content;
    private String category;
    private LocalDate date;

    // 新增與 Summary 的多對多關聯
    @ManyToMany(mappedBy = "newsSources")
    private Set<Summery> summaries;
}
