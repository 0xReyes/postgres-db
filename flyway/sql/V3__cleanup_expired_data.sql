-- V3__cleanup_expired_data.sql

DELETE FROM authorization_codes
WHERE expires_at < NOW();

DELETE FROM sessions
WHERE expires_at < NOW();

DELETE FROM refresh_tokens
WHERE expires_at < NOW() OR revoked_at IS NOT NULL;
