# AI Agent Instructions for Passos Tech Tools

## What this repository is

- A Ruby on Rails 8.1 application.
- Uses `postgresql` for the database.
- Uses `importmap-rails` for JavaScript, `tailwindcss-rails` for styles, and `propshaft` for assets.
- Includes code security and style tooling in CI: `brakeman`, `bundler-audit`, `rubocop`, and `importmap audit`.

## Primary developer commands

- Start the app: `bin/rails server`
- Run the test suite: `bin/rails test`
- Run system tests: `bin/rails test:system`
- Prepare test DB and run tests in CI-like form: `bin/rails db:test:prepare test`
- Lint code: `bin/rubocop -f github`
- Scan Rails security issues: `bin/brakeman --no-pager`
- Scan gem vulnerabilities: `bin/bundler-audit`
- Audit JavaScript dependencies: `bin/importmap audit`
- Tailwind dev watcher: `bin/rails tailwindcss:watch`

## CI / workflow references

- GitHub Actions file: `.github/workflows/ci.yml`
- CI installs `libpq-dev` and `libvips` before running tests.
- CI test jobs use PostgreSQL service and environment variable `DATABASE_URL=postgres://postgres:postgres@localhost:5432`.

## Relevant code structure

- `app/controllers/` — request handling.
- `app/views/` — templates and page HTML.
- `app/helpers/` — view helper methods.
- `app/models/` — business/data logic.
- `app/mailers/`, `app/jobs/` — mail and background job patterns.
- `config/` — Rails app configuration and environment-specific settings.
- `test/` — tests, fixtures, integration, system coverage.

## Conventions and important notes

- Prefer Rails built-in MVC structure and keep logic in models/controllers/helpers, not views.
- Use `bin/rubocop` before submitting style or formatting changes.
- Do not assume a JavaScript bundler like Webpacker / webpack; use importmap-managed assets instead.
- `config/application.rb` loads Rails defaults for version 8.1.
- `config/credentials.yml.enc` is encrypted, so sensitive configuration is handled by Rails credentials.

## When editing this repo

- Preserve standard Rails scaffold patterns unless there is a strong reason to alter them.
- If adding dependencies, update `Gemfile` and run the relevant test and lint commands.
- When modifying frontend behavior, verify importmap-based JavaScript and Tailwind stylesheet paths.
- For database changes, prefer migrations and ensure the test database is prepared.

## What not to do

- Do not add unrelated frontend build tools or JS bundlers unless the app explicitly needs them.
- Do not bypass the existing security or lint tooling; run the commands listed above when making code changes.
- Do not assume the repo has extensive docs; use the code and tests as the authoritative source.
