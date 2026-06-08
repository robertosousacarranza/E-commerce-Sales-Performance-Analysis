WITH user_activity AS (
    -- Paso 1: Extraemos el mes y el trimestre exacto de cada compra por usuario
    SELECT DISTINCT 
        User_Name, 
        DATE_TRUNC('month', Transaction_Date) AS activity_month,
        EXTRACT(QUARTER FROM Transaction_Date) AS quarter,
        EXTRACT(YEAR FROM Transaction_Date) AS activity_year
    FROM sales_data
),
retention_calc AS (
    -- Paso 2: Window Function (LAG) para buscar la compra del mes anterior del mismo usuario
    SELECT 
        User_Name,
        activity_month,
        quarter,
        activity_year,
        LAG(activity_month) OVER (PARTITION BY User_Name ORDER BY activity_month) AS previous_month
    FROM user_activity
)
-- Paso 3: Agrupamos y calculamos la tasa de retención
SELECT 
    activity_year AS "Year",
    quarter AS "Quarter",
    activity_month AS "Month",
    COUNT(DISTINCT User_Name) AS total_customers,
    COUNT(DISTINCT CASE 
        WHEN previous_month = activity_month - INTERVAL '1 month' 
        THEN User_Name 
    END) AS retained_customers,
    ROUND(
        COUNT(DISTINCT CASE WHEN previous_month = activity_month - INTERVAL '1 month' THEN User_Name END)::NUMERIC / 
        COUNT(DISTINCT User_Name), 4
    ) AS retention_rate
FROM retention_calc
GROUP BY activity_year, quarter, activity_month
ORDER BY activity_year, activity_month;