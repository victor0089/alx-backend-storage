-- Lists all bands with Glam rock as their main style, ranked by their longevity.
-- SELECT band_name, (IFNULL(split, YEAR(CURRENT_DATE())) - formed) AS lifespan
SELECT 
    band_name,
    CASE
        WHEN split IS NULL THEN 2022 - formed
        ELSE 2022 - formed + (split - formed)
    END AS lifespan
FROM
    metal_bands
WHERE
    glam_rock = 'yes'
ORDER BY
    lifespan DESC;
