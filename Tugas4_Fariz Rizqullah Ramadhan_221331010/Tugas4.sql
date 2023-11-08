WITH List AS (
    SELECT
        provinsi,
        kabupaten,
        COUNT(desa) AS "#desa",
        ROW_NUMBER() OVER (PARTITION BY provinsi ORDER BY COUNT(*) DESC) AS urutan
    FROM list_desa
    GROUP BY provinsi, kabupaten
)
SELECT provinsi, kabupaten, urutan, "#desa"
FROM List
WHERE urutan <= 5
ORDER BY provinsi ASC, urutan ASC;