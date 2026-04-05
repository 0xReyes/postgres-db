-- R__seed_clients.sql

INSERT INTO oauth_clients (client_id, client_secret, name, redirect_uris, allowed_scopes, updated_at)
VALUES
    (
        'public-web',
        NULL,
        'Public Web App',
        '["http://localhost:3000/callback","http://127.0.0.1:3000/callback"]',
        'openid profile email offline_access',
        NOW()
    ),
    (
        'internal-cli',
        'dev-cli-secret',
        'Internal CLI',
        '["http://localhost:8787/callback"]',
        'openid profile email offline_access data:read data:write',
        NOW()
    )
ON CONFLICT (client_id) DO UPDATE
SET client_secret = EXCLUDED.client_secret,
    name = EXCLUDED.name,
    redirect_uris = EXCLUDED.redirect_uris,
    allowed_scopes = EXCLUDED.allowed_scopes,
    updated_at = NOW();
