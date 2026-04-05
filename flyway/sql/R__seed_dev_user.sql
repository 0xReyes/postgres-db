-- R__seed_dev_user.sql

INSERT INTO users (
    id,
    email,
    password_hash,
    email_verified,
    name,
    created_at,
    updated_at
)
VALUES (
    'dev-user',
    'dev@example.com',
    'dev-password-hash',
    TRUE,
    'Dev User',
    NOW(),
    NOW()
)
ON CONFLICT (id) DO UPDATE
SET email = EXCLUDED.email,
    password_hash = EXCLUDED.password_hash,
    email_verified = EXCLUDED.email_verified,
    name = EXCLUDED.name,
    updated_at = EXCLUDED.updated_at;

INSERT INTO profiles (user_id, data, updated_at)
VALUES (
    'dev-user',
    '{"firstName":"Dev","lastName":"User","email":"dev@example.com"}'::jsonb,
    NOW()
)
ON CONFLICT (user_id) DO UPDATE
SET data = EXCLUDED.data,
    updated_at = EXCLUDED.updated_at;
