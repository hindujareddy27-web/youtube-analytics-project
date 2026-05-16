# Project Findings — YouTube Analytics Dashboard

## Project Overview
Analyzed a YouTube creator's channel data to surface insights beyond what YouTube Studio natively provides. The dataset was sourced from Kaggle and covers the full channel lifetime of a data-focused YouTube creator with 223 videos.

---

## Data Preparation & Feature Engineering

### Video Categorization — SQL CASE-WHEN Classification
Videos had no predefined categories, so a keyword-based classification system was built in SQL using CASE-WHEN logic on video titles. 11 categories were created:

- Learning / Beginner Advice
- Career / Jobs
- Python / SQL / Technical
- Machine Learning / AI
- Sports Analytics
- Portfolio / Projects / Resume
- Interviews / Guest Episodes
- Productivity / Motivation
- Personal / Channel Updates
- Business / Industry
- Funny / Shorts / Misc

This is essentially manual text classification — scanning titles for relevant keywords to group content meaningfully for analysis.

Videos were further classified by:
- **Type:** Regular Videos vs Shorts
- **Length Group:** Short / Medium / Long

### Custom Metrics Created

**Growth Rate:**
```sql
0.7 * ((likes_added + comments_added) * 100.0 / views) +
0.3 * ((subscriptions_added * 100.0) / views)
```

**Impact Score:**
```sql
(0.7 * ((likes_added + comments_added) * 100.0 / views) +
0.3 * ((subscriptions_added * 100.0) / views))
* LOG(SUM(subscriptions_added) + 1)
```

---

## Page 1 — Channel Performance Analysis

### Subscriber Conversion
Learning/Advice and Beginner content dominated the top 10 subscriber conversion videos — these categories are the most effective for sustained channel growth. If the creator wants to grow and retain subscribers, these are the video types worth frequenting.

### Content Length vs Engagement
Medium length videos drive the highest average daily views, but long form videos generate the deepest engagement through watch time — a content mix strategy works better than optimizing for one metric alone.

### Best Performance Months — YouTube Wrapped
Built a "YouTube Wrapped" style performance table using growth rate and impact score across multiple parameters — likes, subscribers, and engagement. This allows the creator to identify which months performed well and attempt to replicate those conditions.

---

## Page 2 — Geography & Monetization Analysis

### Global Audience Geography
One of YouTube's biggest advantages is its global reach — creators can find their audience without geographic restrictions. The geography dashboard visualizes audience density through bubbles on a world map, sized by view volume per country. Hovering over each bubble reveals additional details including average watch time, view percentage, and subscribers added.

A continent-wise slicer allows filtering the entire dashboard by region — making it easier to draw focused insights rather than looking at hundreds of countries at once. KPIs update dynamically based on the selected continent showing total views, watch time, and view percentage.

Key finding: While the US dominates total views, CZ leads in average watch time — indicating a smaller but highly engaged audience exists outside the primary market. The donut chart provides a quick continent-level picture of where the audience originates.

### Revenue & Monetization
- **Total Revenue:** $29.07K across the channel lifetime
- **Average CPM:** $11.44 (Cost per 1000 impressions paid by advertisers)
- **Average RPM:** $4.48 (Actual revenue earned per 1000 views)

### Top Revenue Videos
"How I Would Learn" format videos appear 5 times in the top 10 revenue videos — showing that actionable roadmap content is not only what the audience prefers to consume but also what monetizes best.

### CTR Quality
Only 12.22% of videos fall in the high CTR category while 59.73% average CTR and 28.05% low CTR. While many videos risk being skipped, the majority maintaining average CTR suggests thumbnail and title optimization remains the highest leverage improvement area for the channel.

### CPM vs RPM by Content Category
Learning/Advice and Career/Jobs content delivers strong RPM despite lower views — consistent advertiser value regardless of volume. These categories punch above their weight for revenue making them the most efficient content types to produce.

---

## Overall Recommendation

The analysis suggests a clear content strategy supported by data:

- **For subscriber growth:** Prioritize Learning/Beginner Advice and Career/Jobs content — these categories consistently dominate subscriber conversion rates regardless of view volume
- **For reach:** Medium length videos generate the highest average daily views and should form the bulk of the content calendar
- **For engagement depth:** Long form content builds stronger audience loyalty through watch time — best used for technical or in-depth topics
- **For revenue efficiency:** Career/Jobs and Learning/Advice deliver strong RPM despite lower views — producing these categories yields better returns per video than chasing high view counts alone
- **Highest leverage improvement:** Only 12% of videos achieve high CTR — systematic improvement of thumbnails and titles represents the single biggest untapped revenue and growth opportunity
