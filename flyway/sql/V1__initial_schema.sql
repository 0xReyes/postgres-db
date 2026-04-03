-- V1__initial_schema.sql

CREATE TABLE IF NOT EXISTS profiles (
    user_id TEXT PRIMARY KEY,
    data JSONB NOT NULL DEFAULT '{}'::jsonb,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS autofill_jobs (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    provider TEXT NOT NULL,
    html TEXT NOT NULL,
    url TEXT NOT NULL,
    title TEXT NOT NULL,
    status TEXT NOT NULL,
    result JSONB,
    error TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_autofill_jobs_user_id
    ON autofill_jobs(user_id);

CREATE INDEX IF NOT EXISTS idx_autofill_jobs_status
    ON autofill_jobs(status);

CREATE INDEX IF NOT EXISTS idx_autofill_jobs_created_at
    ON autofill_jobs(created_at DESC);