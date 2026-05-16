# Data Cleaning Log — `metrics_by_video_original.csv`

---

### Step 1 — Replaced Null Values with 0
Replaced all null/empty cells with `0` to ensure no missing values enter the SQL table. Used `Ctrl + G` → Special → Blanks to select all empty cells, typed `0`, and confirmed with `Ctrl + Enter` to fill all at once.

---

### Step 2 — Removed "Total" Summary Row
The first row contained an aggregate total across all videos (with `Video = "Total"` and no publish date or title) rather than an actual video record. Removed it to prevent it from skewing any aggregations run against the table.

---

### Step 3 — Removed Column: `video`
Dropped this column as it contained opaque alphanumeric YouTube video IDs (e.g. `4OZip0cgOho`) with no analytical value for SQL-based reporting.

---

### Step 4 — Replaced Soft-Hyphen Characters in Column Headers
All column headers contained invisible soft-hyphen characters (`\xad`) embedded mid-word (e.g. `Video pub­lish time`), likely exported from YouTube Studio. Replaced them with nothing so headers read as clean words.

---

### Step 5 — Renamed Headers to Snake_Case and Removed Brackets
Renamed all column headers to lowercase snake_case and removed parentheses since SQL does not allow special characters or spaces in column names. For example, `RPM (USD)` → `rpm_usd` and `Impressions click-through rate (%)` → `impressions_click_through_rate_pct`.

---

### Step 6 — Standardized `video_publish_time` Date Format
Dates were stored inconsistently as plain text (e.g. `May 8, 2020`). Converted all values to a standard `YYYY-MM-DD` format so the column is recognised as a proper date type on SQL import.

---

### Step 7 — Renamed `video_publish_time` → `video_publish_date`
The column was named "publish time" but only contained a date with no time component. Renamed to `video_publish_date` to accurately reflect the data.

---

### Step 8 — Converted `average_view_duration` from `HH:MM:SS` to Seconds
The column was stored as a text string (e.g. `00:03:25`), making it impossible to aggregate in SQL. Converted all values to total seconds (e.g. `205`) using the formula `=HOUR(A1)*3600 + MINUTE(A1)*60 + SECOND(A1)`, then renamed the column to `average_view_duration_seconds`.

---

### Step 9 — Fixed Scientific Notation in `impressions`
One value in the `impressions` column was stored in scientific notation (e.g. `1.00954064E+08`), causing the column to be read as text. Reformatted the column as a plain integer so all values are consistent.

---

### Step 10 — Filled Null Values in `cpm_usd` with 0
Two rows had no CPM value. Filled these with `0` to maintain a complete numeric column without dropping valid video records.

---

## Data Dictionary

| Column | Type | Description |
|---|---|---|
| `video_title` | `VARCHAR` | Title of the YouTube video |
| `video_publish_date` | `DATE` | Date the video was published (YYYY-MM-DD) |
| `comments_added` | `INTEGER` | Number of comments added |
| `shares` | `INTEGER` | Number of times the video was shared |
| `dislikes` | `INTEGER` | Number of dislikes |
| `likes` | `INTEGER` | Number of likes |
| `subscribers_lost` | `INTEGER` | Subscribers lost attributed to this video |
| `subscribers_gained` | `INTEGER` | Subscribers gained attributed to this video |
| `rpm_usd` | `FLOAT` | Revenue per 1000 impressions in USD |
| `cpm_usd` | `FLOAT` | Cost per 1000 impressions in USD |
| `average_percentage_viewed_pct` | `FLOAT` | Average percentage of the video watched |
| `average_view_duration_seconds` | `INTEGER` | Average watch duration in seconds |
| `views` | `INTEGER` | Total view count |
| `watch_time_hours` | `FLOAT` | Total watch time in hours |
| `subscribers` | `INTEGER` | Net subscriber count at time of export |
| `estimated_revenue_usd` | `FLOAT` | Estimated revenue generated in USD |
| `impressions` | `INTEGER` | Total number of impressions |
| `impressions_click_through_rate_pct` | `FLOAT` | Impression click-through rate as a percentage |
