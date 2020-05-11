SELECT coalesce(json_agg("root"), '[]') AS "root" FROM (
SELECT *
FROM box
LEFT OUTER JOIN LATERAL(
    SELECT coalesce(json_agg("items".z), '[]') AS "items" FROM (
        SELECT row_to_json(x) AS z
        FROM (
            SELECT *
            FROM item
            WHERE box.id = item.box_id
        ) AS "x"
    ) AS "items") AS z ON ('true')
LEFT OUTER JOIN LATERAL(
        SELECT row_to_json(x) AS "item"
        FROM (
            SELECT *
            FROM item
            WHERE box.id = item.box_id
        ) AS x) AS y ON ('true')
) AS "root";
