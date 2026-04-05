-- R__seed_dev_data.sql

INSERT INTO data (url, user_id, title, payload, updated_at)
VALUES
    (
        'https://example.com/welcome',
        'dev-user',
        'Welcome Example',
        '{"category":"example","tags":["welcome","demo"]}'::jsonb,
        NOW()
    ),
    (
        'https://example.com/getting-started',
        'dev-user',
        'Getting Started',
        '{"category":"guide","tags":["getting-started","demo"]}'::jsonb,
        NOW()
    )
ON CONFLICT (url) DO UPDATE
SET user_id = EXCLUDED.user_id,
    title = EXCLUDED.title,
    payload = EXCLUDED.payload,
    updated_at = NOW();
