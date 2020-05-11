SELECT coalesce(json_agg("root"), '[]') AS "root" FROM (
    SELECT
        *
    FROM box
        LEFT OUTER JOIN LATERAL (
            SELECT
                coalesce(json_agg(rows_with_object.json_object), '[]') AS "items"
            FROM (
                SELECT
                    row_to_json(actual_rows) AS json_object
                FROM (
                    -- Actual rows
                    SELECT
                        *
                    FROM item
                    WHERE
                        box.id = item.box_id
                ) AS actual_rows
            ) AS rows_with_object
        ) AS any_name_1 ON ('true')
        LEFT OUTER JOIN LATERAL (
            SELECT
                row_to_json(actual_rows) AS "item"
            FROM (
                -- Actual rows
                SELECT
                    *
                FROM item
                WHERE
                    box.id = item.box_id
            ) AS actual_rows
        ) AS any_name_2 ON ('true')
) AS "root";
