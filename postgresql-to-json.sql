SELECT
    coalesce(json_agg(all_data), '[]') AS data_row
FROM (
    SELECT
        *
    FROM box
        LEFT OUTER JOIN LATERAL (
            SELECT
                coalesce(json_agg(actual_rows), '[]') AS "items"
            FROM (
                 -- Actual rows
                SELECT
                    *
                FROM item
                WHERE
                    box.id = item.box_id
            ) AS actual_rows
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
                -- If limit isn't added then it will create two rows
                LIMIT 1
            ) AS actual_rows
        ) AS any_name_2 ON ('true')
) AS all_data;
