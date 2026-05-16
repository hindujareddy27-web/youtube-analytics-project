# Data Cleaning Log — `video_performance_original.csv`

---

### Step 1 — Dropped Null Rows
1,347 rows had null values exclusively in `average_view_percentage` and `average_watch_time` — both columns were null on the exact same rows. These rows were dropped entirely as they contained no usable performance data.

---

### Step 2 — Removed Column: `external_video_id`
Dropped this column as it contained opaque alphanumeric YouTube video IDs with no analytical value for SQL-based reporting.

---

### Step 3 — Removed Column: `thumbnail_link`
Dropped this column as it contains CDN image URLs with no analytical value for SQL-based reporting.

---

### Step 4 — Removed Column: `user_comments_added`
Dropped this column because every value was `0`, confirmed with `=MAX()`, making it analytically useless.

---

### Step 5 — Standardized `date` Column to `YYYY-MM-DD`
Dates were stored as two-digit year text strings (e.g. `19-Jan-22`), which are ambiguous and not recognised as a proper date type in SQL. Converted all values to `YYYY-MM-DD` format (e.g. `2022-01-19`).

---

### Step 6 — Renamed Headers to Snake_Case
Renamed all column headers to lowercase snake_case for SQL compatibility. Spaces and special characters in column names require quoting in SQL and cause frequent errors.

---

### Step 7 — Renamed `video_length` → `video_length_seconds`
The column name gave no indication of its unit. Values align with seconds (range: 47–5029), so the column was renamed to `video_length_seconds` to make the unit explicit.

---

### Step 8 — Renamed `average_watch_time` → `average_watch_time_seconds`
Same as above — values (mean: ~217, max: 5322) confirm the unit is seconds. Renamed to `average_watch_time_seconds` for clarity.

---

### Step 9 — Limited Decimal Places to 3
`average_view_percentage` and `average_watch_time_seconds` contained values with up to 16 decimal places. Rounded both columns to 3 decimal places for consistency and storage efficiency.

---

## Data Dictionary

| Column | Type | Description |
|---|---|---|
| `date` | `DATE` | Date of the performance record (YYYY-MM-DD) |
| `video_title` | `VARCHAR` | Title of the YouTube video |
| `video_length_seconds` | `INTEGER` | Duration of the video in seconds |
| `views` | `INTEGER` | Total view count for that date |
| `video_likes_added` | `INTEGER` | Number of likes added |
| `video_dislikes_added` | `INTEGER` | Number of dislikes added |
| `video_likes_removed` | `INTEGER` | Number of likes removed |
| `user_subscriptions_added` | `INTEGER` | Subscriptions gained attributed to this video |
| `user_subscriptions_removed` | `INTEGER` | Subscriptions lost attributed to this video |
| `average_view_percentage` | `FLOAT` | Average fraction of the video watched (0.0–1.0) |
| `average_watch_time_seconds` | `FLOAT` | Average watch duration in seconds |
