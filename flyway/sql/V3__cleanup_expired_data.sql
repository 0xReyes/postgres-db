-- V3__cleanup_expired_data.sql
-- Non-destructive follow-up migration: add focused indexes for token/code lifecycle queries.

CREATE INDEX IF NOT EXISTS idx_authorization_codes_used_at
    ON authorization_codes(used_at)
    WHERE used_at IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_refresh_tokens_revoked_at
    ON refresh_tokens(revoked_at)
    WHERE revoked_at IS NOT NULL;
