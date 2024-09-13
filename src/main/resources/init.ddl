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

-- 創建 summary 表，儲存 AI 統整後的內容
CREATE TABLE IF NOT EXISTS summary (
                                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                       summary_text MEDIUMTEXT NOT NULL,   -- AI 統整後的內容
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
