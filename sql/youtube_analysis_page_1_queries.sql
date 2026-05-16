-- ============================================================
-- SETUP: Add derived columns
-- ============================================================

-- Add video_type to metrics_by_video_final
ALTER TABLE metrics_by_video_final
ADD COLUMN video_type VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;
UPDATE metrics_by_video_final
SET video_type =
    CASE
        WHEN video_title LIKE '%short%' THEN 'Shorts'
        ELSE 'Regular Videos'
    END;
SET SQL_SAFE_UPDATES = 1;


-- Add video_category to metrics_by_video_final
ALTER TABLE metrics_by_video_final
ADD COLUMN video_category VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;
UPDATE metrics_by_video_final
SET video_category =
    CASE
        WHEN video_title LIKE '%portfolio%' OR video_title LIKE '%resume%' OR video_title LIKE '%project%'
          OR video_title LIKE '%github%' OR video_title LIKE '%website%'
        THEN 'Portfolio / Projects / Resume'

        WHEN video_title LIKE '%job%' OR video_title LIKE '%career%' OR video_title LIKE '%interview%'
          OR video_title LIKE '%internship%' OR video_title LIKE '%FAANG%'
          OR video_title LIKE '%analyst%' OR video_title LIKE '%data scientist%'
        THEN 'Career / Jobs'

        WHEN video_title LIKE '%learn%' OR video_title LIKE '%start%' OR video_title LIKE '%beginner%'
          OR video_title LIKE '%master%' OR video_title LIKE '%degree%' OR video_title LIKE '%course%'
          OR video_title LIKE '%resource%' OR video_title LIKE '%book%'
        THEN 'Learning / Beginner Advice'

        WHEN video_title LIKE '%sports%' OR video_title LIKE '%NBA%' OR video_title LIKE '%golf%'
          OR video_title LIKE '%bracket%' OR video_title LIKE '%Astros%' OR video_title LIKE '%PGA%'
        THEN 'Sports Analytics'

        WHEN video_title LIKE '%Python%' OR video_title LIKE '%SQL%' OR video_title LIKE '%Pandas%'
          OR video_title LIKE '%API%' OR video_title LIKE '%scrape%' OR video_title LIKE '%lambda%'
          OR video_title LIKE '%linear regression%'
        THEN 'Python / SQL / Technical'

        WHEN video_title LIKE '%machine learning%' OR video_title LIKE '%deep learning%'
          OR video_title LIKE '%ML Ops%' OR video_title LIKE '%AI%'
          OR video_title LIKE '%RNN%' OR video_title LIKE '%lSTM%'
        THEN 'Machine Learning / AI'

        WHEN video_title LIKE '%Kaggle%'
        THEN 'Kaggle'

        WHEN video_title LIKE '%KNN EP%' OR video_title LIKE '%Interview with%' OR video_title LIKE '%@%'
        THEN 'Interviews / Guest Episodes'

        WHEN video_title LIKE '%motivation%' OR video_title LIKE '%productive%' OR video_title LIKE '%doubt%'
          OR video_title LIKE '%impostor%' OR video_title LIKE '%discouraged%' OR video_title LIKE '%balance%'
        THEN 'Productivity / Motivation'

        WHEN video_title LIKE '%update%' OR video_title LIKE '%subscriber%' OR video_title LIKE '%Q&A%'
          OR video_title LIKE '%AMA%' OR video_title LIKE '%live stream%'
          OR video_title LIKE '%welcome%' OR video_title LIKE '%thank you%'
        THEN 'Personal / Channel Updates'

        WHEN video_title LIKE '%startup%' OR video_title LIKE '%business%' OR video_title LIKE '%industry%'
          OR video_title LIKE '%corporation%' OR video_title LIKE '%future%' OR video_title LIKE '%hot right now%'
        THEN 'Business / Industry'

        WHEN video_title LIKE '%funny%' OR video_title LIKE '%parody%'
          OR video_title LIKE '%#shorts%' OR video_title LIKE '%shorts%'
        THEN 'Funny / Shorts / Misc'

        ELSE 'Other'
    END;
SET SQL_SAFE_UPDATES = 1;


-- Add video_category to video_performance_final
ALTER TABLE video_performance_final
ADD COLUMN video_category VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;
UPDATE video_performance_final
SET video_category =
    CASE
        WHEN video_title LIKE '%portfolio%' OR video_title LIKE '%resume%' OR video_title LIKE '%project%'
          OR video_title LIKE '%github%' OR video_title LIKE '%website%'
        THEN 'Portfolio / Projects / Resume'

        WHEN video_title LIKE '%job%' OR video_title LIKE '%career%' OR video_title LIKE '%interview%'
          OR video_title LIKE '%internship%' OR video_title LIKE '%FAANG%'
          OR video_title LIKE '%analyst%' OR video_title LIKE '%data scientist%'
        THEN 'Career / Jobs'

        WHEN video_title LIKE '%learn%' OR video_title LIKE '%start%' OR video_title LIKE '%beginner%'
          OR video_title LIKE '%master%' OR video_title LIKE '%degree%' OR video_title LIKE '%course%'
          OR video_title LIKE '%resource%' OR video_title LIKE '%book%'
        THEN 'Learning / Beginner Advice'

        WHEN video_title LIKE '%sports%' OR video_title LIKE '%NBA%' OR video_title LIKE '%golf%'
          OR video_title LIKE '%bracket%' OR video_title LIKE '%Astros%' OR video_title LIKE '%PGA%'
        THEN 'Sports Analytics'

        WHEN video_title LIKE '%Python%' OR video_title LIKE '%SQL%' OR video_title LIKE '%Pandas%'
          OR video_title LIKE '%API%' OR video_title LIKE '%scrape%' OR video_title LIKE '%lambda%'
          OR video_title LIKE '%linear regression%'
        THEN 'Python / SQL / Technical'

        WHEN video_title LIKE '%machine learning%' OR video_title LIKE '%deep learning%'
          OR video_title LIKE '%ML Ops%' OR video_title LIKE '%AI%'
          OR video_title LIKE '%RNN%' OR video_title LIKE '%lSTM%'
        THEN 'Machine Learning / AI'

        WHEN video_title LIKE '%Kaggle%'
        THEN 'Kaggle'

        WHEN video_title LIKE '%KNN EP%' OR video_title LIKE '%Interview with%' OR video_title LIKE '%@%'
        THEN 'Interviews / Guest Episodes'

        WHEN video_title LIKE '%motivation%' OR video_title LIKE '%productive%' OR video_title LIKE '%doubt%'
          OR video_title LIKE '%impostor%' OR video_title LIKE '%discouraged%' OR video_title LIKE '%balance%'
        THEN 'Productivity / Motivation'

        WHEN video_title LIKE '%update%' OR video_title LIKE '%subscriber%' OR video_title LIKE '%Q&A%'
          OR video_title LIKE '%AMA%' OR video_title LIKE '%live stream%'
          OR video_title LIKE '%welcome%' OR video_title LIKE '%thank you%'
        THEN 'Personal / Channel Updates'

        WHEN video_title LIKE '%startup%' OR video_title LIKE '%business%' OR video_title LIKE '%industry%'
          OR video_title LIKE '%corporation%' OR video_title LIKE '%future%' OR video_title LIKE '%hot right now%'
        THEN 'Business / Industry'

        WHEN video_title LIKE '%funny%' OR video_title LIKE '%parody%'
          OR video_title LIKE '%#shorts%' OR video_title LIKE '%shorts%'
        THEN 'Funny / Shorts / Misc'

        ELSE 'Other'
    END;
SET SQL_SAFE_UPDATES = 1;


-- ============================================================
-- EXPLORATION
-- ============================================================

SELECT * FROM metrics_by_video_final;
SELECT * FROM video_performance_final;


-- ============================================================
-- ANALYSIS QUERIES
-- ============================================================

-- Growth by subscriber conversion
SELECT
    video_title,
    (subscribers_gained / views) * 100 AS subscriber_conversion,
    video_category
FROM metrics_by_video_final
ORDER BY subscriber_conversion DESC
LIMIT 10;


-- Overall growth score per video
SELECT
    video_title,
    growth_score,
    CASE
        WHEN growth_score >= 10 THEN 'High Growth'
        WHEN growth_score >= 5  THEN 'Medium Growth'
        ELSE 'Low Growth'
    END AS growth_group
FROM (
    SELECT
        video_title,
        (
            0.7 * ((likes + comments_added) * 100.0 / views) +
            0.3 * ((subscribers_gained * 100.0) / views)
        ) AS growth_score
    FROM metrics_by_video_final
) sub;


-- High engagement but low subscriber conversion (exceptional cases)
SELECT
    video_title,
    engagement_rate,
    subscriber_conversion,
    engagement_rate - subscriber_conversion AS shortfall
FROM (
    SELECT
        video_title,
        video_publish_date,
        (likes + comments_added) * 100.0 / views AS engagement_rate,
        (subscribers_gained * 100.0 / views)      AS subscriber_conversion
    FROM metrics_by_video_final
    WHERE views > 10000
) sub
ORDER BY shortfall DESC;


-- Video length vs views and watch time
SELECT
    CASE
        WHEN video_length_seconds < 60  THEN 'Short'
        WHEN video_length_seconds < 600 THEN 'Medium'
        ELSE 'Long'
    END AS length_group,
    AVG(views)                         AS avg_daily_views,
    AVG(average_watch_time_seconds)    AS avg_watch_seconds
FROM video_performance_final
GROUP BY length_group
ORDER BY avg_daily_views DESC;


-- Biggest months by growth rate
SELECT
    MONTHNAME(date)  AS month_name,
    YEAR(date)       AS year,
    ROUND(AVG(
        0.7 * (video_likes_added * 100.0 / views) +
        0.3 * (user_subscriptions_added * 100.0 / views)
    ), 2)            AS avg_growth_rate,
    SUM(user_subscriptions_added) + SUM(video_likes_added) AS total_growth
FROM video_performance_final
GROUP BY YEAR(date), MONTH(date), MONTHNAME(date)
ORDER BY avg_growth_rate DESC
LIMIT 5;


-- Growth rate by video category
SELECT
    video_title,
    ROUND(AVG(
        0.7 * (video_likes_added * 100.0 / views) +
        0.3 * (user_subscriptions_added * 100.0 / views)
    ), 2)          AS avg_growth_rate,
    video_category
FROM video_performance_final
GROUP BY video_title, video_category
ORDER BY avg_growth_rate DESC;


-- Number of videos per category
SELECT
    COUNT(DISTINCT video_title) AS num_of_videos,
    video_category
FROM video_performance_final
GROUP BY video_category
ORDER BY num_of_videos DESC;
