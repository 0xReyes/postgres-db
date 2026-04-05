-- R__seed_dev_user.sql

INSERT INTO users (id, email, password_hash, updated_at)
VALUES (
    'dev-user',
    'dev@example.com',
    'dev-password-hash',
    NOW()
)
ON CONFLICT (id) DO UPDATE
SET email = EXCLUDED.email,
    password_hash = EXCLUDED.password_hash,
    updated_at = NOW();

INSERT INTO profiles (user_id, data, updated_at)
VALUES (
    'dev-user',
    '{"firstName":"Dev","lastName":"User","email":"dev@example.com"}'::jsonb,
    NOW()
)
ON CONFLICT (user_id) DO UPDATE
SET data = EXCLUDED.data,
    updated_at = NOW();
