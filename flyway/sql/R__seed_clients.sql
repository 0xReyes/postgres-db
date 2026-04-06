-- R__seed_clients.sql

INSERT INTO oauth_clients (
    id,
    client_id,
    client_secret,
    client_name,
    redirect_uris,
    allowed_scopes,
    is_confidential,
    created_at
)
VALUES
    (
        'client-public-web',
        'public-web',
        NULL,
        'Public Web App',
        '["http://localhost:3000/callback","http://127.0.0.1:3000/callback","https://mkpnpkpaenljpmodfopelfgdmgnijlih.chromiumapp.org/oidc"]',
        'openid profile email offline_access',
        FALSE,
        NOW()
    ),
    (
        'client-internal-cli',
        'internal-cli',
        'dev-cli-secret',
        'Internal CLI',
        '["http://localhost:8787/callback"]',
        'openid profile email offline_access data:read data:write',
        TRUE,
        NOW()
    )
ON CONFLICT (client_id) DO UPDATE
SET id = EXCLUDED.id,
    client_secret = EXCLUDED.client_secret,
    client_name = EXCLUDED.client_name,
    redirect_uris = EXCLUDED.redirect_uris,
    allowed_scopes = EXCLUDED.allowed_scopes,
    is_confidential = EXCLUDED.is_confidential;