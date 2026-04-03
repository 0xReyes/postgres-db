-- R__seed_dev_data.sql

INSERT INTO profiles (user_id, data, updated_at)
VALUES (
    'dev-user',
    '{"firstName":"Henry","lastName":"Argueta","email":"henry@example.com"}'::jsonb,
    NOW()
)
ON CONFLICT (user_id) DO UPDATE
SET data = EXCLUDED.data,
    updated_at = NOW();