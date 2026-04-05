-- R__seed_dev_data.sql

INSERT INTO data (url, html, data, created_at, updated_at)
VALUES
    (
        'https://example.com/welcome',
        '<html><body><h1>Welcome</h1><p>Seed page.</p></body></html>',
        '{"category":"example","tags":["welcome","demo"]}'::jsonb,
        NOW(),
        NOW()
    ),
    (
        'https://example.com/getting-started',
        '<html><body><h1>Getting Started</h1><p>Seed page.</p></body></html>',
        '{"category":"guide","tags":["getting-started","demo"]}'::jsonb,
        NOW(),
        NOW()
    )
ON CONFLICT (url) DO UPDATE
SET html = EXCLUDED.html,
    data = EXCLUDED.data,
    updated_at = EXCLUDED.updated_at;
