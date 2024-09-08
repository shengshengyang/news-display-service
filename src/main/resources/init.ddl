-- 創建資料庫
CREATE DATABASE IF NOT EXISTS News;

-- 使用資料庫
USE News;

-- 創建 news 表
CREATE TABLE IF NOT EXISTS news (
                                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                    title VARCHAR(255) NOT NULL,
    summary TEXT,
    content TEXT NOT NULL,
    image_url VARCHAR(255),
    link VARCHAR(255) UNIQUE NOT NULL, -- 確保新聞的 URL 不會重複
    category VARCHAR(100) NOT NULL,
    date DATE NOT NULL
    );

-- 使用資料庫
USE News;

-- 插入測試資料
INSERT INTO news (title, summary, content, image_url, link, category, date) VALUES
                                                                                ('Market Soars as Tech Stocks Rally', 'Stock market led by gains in tech sector', 'Today, the stock market saw a significant increase, led by gains in the tech sector...', 'https://example.com/image1.jpg', 'https://example.com/market-soars', 'Technology', CURDATE()),
                                                                                ('Oil Prices Hit New Highs', 'Oil prices rise due to global supply concerns', 'Oil prices have reached new highs today due to global supply concerns...', 'https://example.com/image2.jpg', 'https://example.com/oil-prices-high', 'Energy', CURDATE()),
                                                                                ('Retail Sector Faces Challenges', 'Consumer spending shifts causing challenges', 'Retail companies are facing new challenges as consumer spending shifts...', 'https://example.com/image3.jpg', 'https://example.com/retail-challenges', 'Economy', CURDATE()),
                                                                                ('New Developments in AI', 'Advancements in natural language processing', 'Artificial Intelligence continues to advance, with new developments in natural language processing...', 'https://example.com/image4.jpg', 'https://example.com/ai-developments', 'Technology', CURDATE()),
                                                                                ('Green Energy on the Rise', 'Sustainable investments on the rise', 'Investments in green energy are increasing as companies seek sustainable alternatives...', 'https://example.com/image5.jpg', 'https://example.com/green-energy', 'Energy', CURDATE());

-- 創建 summary 表，儲存 AI 統整後的內容
CREATE TABLE IF NOT EXISTS summary (
                                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                       summary_text TEXT NOT NULL,   -- AI 統整後的內容
                                       generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- 統整生成的時間
);

-- 創建 news_summary_sources 表，關聯新聞與統整內容
CREATE TABLE IF NOT EXISTS news_summary_sources (
                                                    summary_id BIGINT NOT NULL,   -- 參照 summary 表
                                                    news_id BIGINT NOT NULL,      -- 參照 news 表
                                                    PRIMARY KEY (summary_id, news_id), -- 保證每條新聞不會重複對應到同一統整
    FOREIGN KEY (summary_id) REFERENCES summary(id) ON DELETE CASCADE, -- 當統整內容刪除時，相關記錄也會被刪除
    FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE         -- 當新聞被刪除時，相關記錄也會被刪除
    );

-- 插入測試資料
-- 插入統整後的內容
INSERT INTO summary (summary_text) VALUES
                                       ('Tech stocks lead market rally and global energy concerns lead to rising oil prices.'),
                                       ('AI advancements and green energy investments dominate tech and energy news.');

-- 插入新聞與統整內容的關聯
INSERT INTO news_summary_sources (summary_id, news_id) VALUES
                                                           (1, 1), -- 第一篇統整內容來自於第一篇新聞
                                                           (1, 2), -- 第一篇統整內容也來自於第二篇新聞
                                                           (2, 4), -- 第二篇統整內容來自於第四篇新聞
                                                           (2, 5); -- 第二篇統整內容也來自於第五篇新聞
