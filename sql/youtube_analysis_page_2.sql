-- ============================================================
-- QUERY 1 — metrics_by_country_final/Global Audience Engagement by Country Dashboard
-- ============================================================

SELECT
    *,
    CASE
        WHEN video_length_seconds <= 60 THEN 'Short'
        ELSE 'Regular Video'
    END AS video_type,
    CASE
        -- UNKNOWN
        WHEN country_code = 'ZZ' THEN 'Unknown'
        -- ASIA
        WHEN country_code IN (
            'IN','CN','JP','KR','KP','TW','HK','SG','MY','TH','VN','ID','PH','PK','BD','LK','NP','BT','MM','KH','LA','MN',
            'AE','SA','QA','KW','OM','BH','YE','IR','IQ','IL','JO','LB','SY','TR','AF','UZ','KZ','TM','TJ','KG',
            'AM','AZ','GE','MO','PS','TL','BN'
        ) THEN 'Asia'
        -- EUROPE
        WHEN country_code IN (
            'GB','IE','FR','DE','IT','ES','PT','NL','BE','LU','CH','AT','SE','NO','FI','DK','IS',
            'PL','CZ','SK','HU','RO','BG','GR','HR','SI','RS','BA','ME','MK','AL','LT','LV','EE','UA','BY','MD','RU',
            'CY','MT','AD'
        ) THEN 'Europe'
        -- NORTH AMERICA
        WHEN country_code IN (
            'US','CA','MX','GT','BZ','SV','HN','NI','CR','PA','CU','DO','HT','JM','TT','BS',
            'BB','KY','GD','PR','GP','MF'
        ) THEN 'North America'
        -- SOUTH AMERICA
        WHEN country_code IN (
            'BR','AR','CL','CO','PE','VE','UY','PY','BO','EC','GY','SR'
        ) THEN 'South America'
        -- AFRICA
        WHEN country_code IN (
            'ZA','NG','EG','KE','GH','DZ','MA','TN','LY','SD','ET','UG','TZ','RW','CM','CI','SN','ZM','ZW','BW','NA','AO','MZ',
            'MW','GM','TD','DJ','CD','BI','SO','SL','MU'
        ) THEN 'Africa'
        -- OCEANIA
        WHEN country_code IN (
            'AU','NZ','FJ','PG','WS','TO','SB','VU'
        ) THEN 'Australia/Oceania'
        ELSE 'Unknown'
    END AS continent,
    CASE
        WHEN LOWER(video_title) LIKE '%project%'
          OR LOWER(video_title) LIKE '%portfolio%'
          OR LOWER(video_title) LIKE '%github%'
          OR LOWER(video_title) LIKE '%resume%'
        THEN 'Projects / Portfolio'
        WHEN LOWER(video_title) LIKE '%job%'
          OR LOWER(video_title) LIKE '%career%'
          OR LOWER(video_title) LIKE '%internship%'
          OR LOWER(video_title) LIKE '%interview%'
          OR LOWER(video_title) LIKE '%salary%'
        THEN 'Career / Jobs'
        WHEN LOWER(video_title) LIKE '%learn%'
          OR LOWER(video_title) LIKE '%beginner%'
          OR LOWER(video_title) LIKE '%course%'
          OR LOWER(video_title) LIKE '%roadmap%'
          OR LOWER(video_title) LIKE '%study%'
        THEN 'Learning'
        WHEN LOWER(video_title) LIKE '%python%'
          OR LOWER(video_title) LIKE '%sql%'
          OR LOWER(video_title) LIKE '%pandas%'
          OR LOWER(video_title) LIKE '%api%'
          OR LOWER(video_title) LIKE '%coding%'
        THEN 'Python / SQL / Coding'
        WHEN LOWER(video_title) LIKE '%ai%'
          OR LOWER(video_title) LIKE '%machine learning%'
          OR LOWER(video_title) LIKE '%deep learning%'
          OR LOWER(video_title) LIKE '%neural%'
        THEN 'AI / ML'
        WHEN LOWER(video_title) LIKE '%kaggle%'
        THEN 'Kaggle'
        WHEN LOWER(video_title) LIKE '%sports%'
          OR LOWER(video_title) LIKE '%nba%'
        THEN 'Sports Analytics'
        WHEN LOWER(video_title) LIKE '%motivation%'
          OR LOWER(video_title) LIKE '%productive%'
        THEN 'Motivation / Productivity'
        WHEN LOWER(video_title) LIKE '%shorts%'
        THEN 'Shorts'
        ELSE 'Other'
    END AS video_category
FROM metrics_by_country_final
WHERE country_code IS NOT NULL
AND TRIM(country_code) <> '';


-- ============================================================
-- QUERY 2 — metrics_by_video_final/Revenue & Monetization Analytics Dashboard
-- ============================================================

SELECT
   *,
    -- VIDEO TYPE
    CASE
        WHEN average_view_duration_seconds <= 60 THEN 'Short'
        ELSE 'Regular Video'
    END AS video_type,
    -- ENGAGEMENT SCORE
    (
        likes
        + comments_added
        + shares
        - dislikes
    ) AS engagement_score,
    -- CTR CATEGORY
    CASE
        WHEN impressions_click_through_rate_pct < 2 THEN 'Low CTR'
        WHEN impressions_click_through_rate_pct BETWEEN 2 AND 5 THEN 'Average CTR'
        ELSE 'High CTR'
    END AS ctr_category,
    -- REVENUE CATEGORY
    CASE
        WHEN estimated_revenue_usd < 500 THEN 'Low Revenue'
        WHEN estimated_revenue_usd BETWEEN 500 AND 3000 THEN 'Medium Revenue'
        ELSE 'High Revenue'
    END AS revenue_category,
    -- REVENUE PER 1000 VIEWS
    ROUND(
        (estimated_revenue_usd / NULLIF(views, 0)) * 1000,
        2
    ) AS revenue_per_1000_views,
    -- VIDEO CATEGORY
    CASE
        WHEN LOWER(video_title) LIKE '%python%'
          OR LOWER(video_title) LIKE '%sql%'
          OR LOWER(video_title) LIKE '%pandas%'
          OR LOWER(video_title) LIKE '%api%'
          OR LOWER(video_title) LIKE '%coding%'
        THEN 'Programming / SQL'
        WHEN LOWER(video_title) LIKE '%ai%'
          OR LOWER(video_title) LIKE '%machine learning%'
          OR LOWER(video_title) LIKE '%deep learning%'
          OR LOWER(video_title) LIKE '%neural%'
        THEN 'AI / ML'
        WHEN LOWER(video_title) LIKE '%job%'
          OR LOWER(video_title) LIKE '%career%'
          OR LOWER(video_title) LIKE '%internship%'
          OR LOWER(video_title) LIKE '%resume%'
          OR LOWER(video_title) LIKE '%interview%'
        THEN 'Career / Jobs'
        WHEN LOWER(video_title) LIKE '%project%'
          OR LOWER(video_title) LIKE '%portfolio%'
          OR LOWER(video_title) LIKE '%github%'
        THEN 'Projects / Portfolio'
        WHEN LOWER(video_title) LIKE '%learn%'
          OR LOWER(video_title) LIKE '%course%'
          OR LOWER(video_title) LIKE '%roadmap%'
          OR LOWER(video_title) LIKE '%beginner%'
        THEN 'Learning / Advice'
        WHEN LOWER(video_title) LIKE '%sports%'
          OR LOWER(video_title) LIKE '%nba%'
        THEN 'Sports Analytics'
        WHEN LOWER(video_title) LIKE '%motivation%'
          OR LOWER(video_title) LIKE '%productive%'
        THEN 'Productivity'
        ELSE 'Other'
    END AS video_category
FROM metrics_by_video_final
WHERE
    video_title IS NOT NULL
    AND TRIM(video_title) <> ''
    AND views IS NOT NULL
    AND estimated_revenue_usd IS NOT NULL;
