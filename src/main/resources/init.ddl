-- 創建資料庫
CREATE DATABASE IF NOT EXISTS News;

-- 使用資料庫
USE News;

-- 創建 news 表
CREATE TABLE IF NOT EXISTS news (
                                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    category VARCHAR(100) NOT NULL,
    date DATE NOT NULL
    );

-- 使用資料庫
USE news_display;

-- 插入測試資料
INSERT INTO news (title, content, category, date) VALUES
                                                      ('Market Soars as Tech Stocks Rally', 'Today, the stock market saw a significant increase, led by gains in the tech sector...', 'Technology', CURDATE()),
                                                      ('Oil Prices Hit New Highs', 'Oil prices have reached new highs today due to global supply concerns...', 'Energy', CURDATE()),
                                                      ('Retail Sector Faces Challenges', 'Retail companies are facing new challenges as consumer spending shifts...', 'Economy', CURDATE()),
                                                      ('New Developments in AI', 'Artificial Intelligence continues to advance, with new developments in natural language processing...', 'Technology', CURDATE()),
                                                      ('Green Energy on the Rise', 'Investments in green energy are increasing as companies seek sustainable alternatives...', 'Energy', CURDATE());
