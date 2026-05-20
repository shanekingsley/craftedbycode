---
title: "Locking Down a Staging Environment with Cloudflare Access and Google Auth"
description: "Notes on setting up a private staging URL using Cloudflare Zero Trust, Google OAuth, and S3 — so only you can see work in progress before it goes live."
pubDate: 2026-05-20
draft: true
tags: ["devops", "cloudflare", "infrastructure"]
---

> **Draft notes** — raw material for a future post. Not polished yet.

## The problem

Pushing straight to production is fine until it isn't. This site (craftedbycode.co.uk) auto-deploys to S3/CloudFront on every push to `master`. That's fast — but it means anything that hits `master` is immediately live and public.

The fix: a proper staging environment. A separate URL where changes can be validated before being promoted to production. But a staging URL that's open to the internet isn't really staging — it's just another production site nobody asked for.

The goal: `staging.craftedbycode.co.uk` that only I can access.

---

## Stack

- **DNS:** Cloudflare (proxied)
- **Storage:** AWS S3 (separate staging bucket)
- **CDN:** AWS CloudFront
- **Auth gate:** Cloudflare Zero Trust Access + Google OAuth

---

## Step 1 — S3 staging bucket

A separate S3 bucket named `staging.craftedbycode.co.uk` configured identically to the production bucket but pointing at the staging CloudFront distribution.

The deploy pipeline targets this bucket on pushes to `develop` instead of `master`.

---

## Step 2 — DNS in Cloudflare

In the Cloudflare dashboard for `craftedbycode.co.uk`:

- Add a CNAME record: `staging` → the CloudFront distribution domain
- **Cloud must be orange (proxied)** — Cloudflare Access only works on proxied records

---

## Step 3 — Cloudflare Zero Trust Access

This puts an auth wall in front of the staging subdomain. Anyone who navigates to it gets a login prompt before seeing anything.

1. **Zero Trust** → **Access** → **Applications** → **Add an application**
2. Choose **Self-hosted**
3. Fill in:
   - Application name: `craftedbycode staging`
   - Session duration: `24 hours`
   - Application domain: `staging.craftedbycode.co.uk`
4. Add a policy:
   - Name: `Owner only`
   - Action: `Allow`
   - Rule: **Emails** → your email address

At this point, the staging URL is protected by an email one-time-code login.

---

## Step 4 — Upgrade to Google OAuth (optional but nicer)

Swapping the email code for "Sign in with Google" is cleaner — one click instead of waiting for a code.

### Google Cloud Console

1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Create a project (or use an existing one)
3. **APIs & Services** → **Credentials** → **Create credentials** → **OAuth 2.0 Client ID**
4. Application type: **Web application**
5. Authorised redirect URI:
   ```
   https://<your-team-name>.cloudflareaccess.com/cdn-cgi/access/callback
   ```
   Your team name is visible in **Zero Trust → Settings** — look for your `*.cloudflareaccess.com` domain.
6. Save — copy the **Client ID** and **Client Secret**

### Back in Cloudflare

1. **Zero Trust → Settings → Authentication**
2. **Login methods** → **Add new** → **Google**
3. Paste in the Client ID and Secret
4. Update the Access Application policy if needed — you can scope by specific email or by `@gmail.com` domain

---

## Result

- `craftedbycode.co.uk` — public, production, deploys from `master`
- `staging.craftedbycode.co.uk` — private, auth-gated, deploys from `develop`

Changes flow: `feature branch` → PR into `develop` → validate on staging → PR into `master` → live.

---

## What this prevents

The specific incident that prompted this: an AI assistant pushed directly to `master` without explicit approval, triggering an immediate live deploy of unreviewed changes. With this setup:

- `master` is protected — requires a PR, no direct pushes
- Even if something reaches `develop`, it deploys to a private URL only I can see
- The deliberate step of opening a `develop → master` PR is the deploy decision

Slow is smooth. Smooth is fast.
