# Data Cleaning Log — `metrics_by_country_and_subscriber_status.xlsx`

**Sheet:** `Aggregated_Metrics_By_Country_A`

---

### Step 1 — Removed Null Values
Dropped all rows containing null/empty values to ensure every record is complete before SQL ingestion. Used `Ctrl + G` → Special → Blanks to select all empty cells, then `Ctrl + -` to delete the rows.

---

### Step 2 — Renamed Headers to Snake_Case
Renamed all column headers to lowercase snake_case (e.g. `Video Title` → `video_title`) since SQL requires no spaces or special characters in column names. Applied to all 15 original columns.

---

### Step 3 — Removed Column: `external_video_id`
Dropped this column as it was redundant — videos are already identifiable by title within this dataset and the ID wasn't needed for downstream analysis.

---

### Step 4 — Removed Column: `user_comments_added`
Dropped this column because every value in it was `0`, making it analytically useless. Confirmed with `=MAX()` before removing.

---

### Step 5 — Cleaned `video_title` — Removed Mojibake Prefix
All titles had a garbled prefix (`ðŸŒ¶`) caused by a UTF-8 emoji (🌶️) being misread as Latin-1 encoding. Removed it using Find & Replace (`Ctrl + H`) — pasted the garbled string into "Find what", left "Replace with" blank, and hit Replace All.

---

### Step 6 — Removed Column: `thumbnail_link`
Dropped this column as it contains CDN image URLs with no analytical value for SQL-based reporting.

---

### Step 7 — Renamed `average_watch_time` → `average_watch_time_seconds`
Renamed this column to make the unit explicit. Values like `39.6` for a 59-second video confirm the unit is seconds, so the name now reflects that clearly.

---

## Data Dictionary

| Column | Type | Description |
|---|---|---|
| `video_title` | `VARCHAR` | Title of the YouTube video |
| `video_length` | `INTEGER` | Duration of the video in seconds |
| `country_code` | `CHAR(2)` | ISO 3166-1 alpha-2 country code of the viewer |
| `is_subscribed` | `BOOLEAN` | Whether the viewer was subscribed at time of view |
| `views` | `INTEGER` | Total view count for this country/subscription segment |
| `video_likes_added` | `INTEGER` | Number of likes added |
| `video_dislikes_added` | `INTEGER` | Number of dislikes added |
| `video_likes_removed` | `INTEGER` | Number of likes removed |
| `user_subscriptions_added` | `INTEGER` | New subscriptions gained from this video |
| `user_subscriptions_removed` | `INTEGER` | Subscriptions lost attributed to this video |
| `average_view_percentage` | `FLOAT` | Average fraction of the video watched (0.0–1.0) |
| `average_watch_time_seconds` | `FLOAT` | Average watch duration in seconds |
