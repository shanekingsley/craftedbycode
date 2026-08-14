# Claude Code Rules — craftedbycode.co.uk

This is a **public-facing production website** for Shane Kingsley — blog plus business/consultancy site (`SITE_DESCRIPTION` in `src/consts.ts`: "Helping local businesses grow with technology — web, AI, and tech consultancy"). Every push to `master` auto-deploys live. Treat it accordingly. These rules apply to the whole site — content, components, config, and infra — not just blog posts.

## Hard rules

- **Never push to `master` directly.** Not even if Shane approved a commit. Committing ≠ pushing. Always stop and ask: "Ready to push?" in the current turn.
- **Never merge a PR without explicit instruction.** Creating a PR is fine; merging it is not.
- **Never run `terraform apply` or `terraform destroy` without explicit approval in the current turn.** These touch live AWS (S3, CloudFront) and Cloudflare DNS. `terraform init`, `validate`, and `plan` are fine to run freely.
- **Never bump Astro or other dependencies to a new major/minor version without explicit discussion first.** Astro upgrades have broken the build before (see "Update Astro - fix issues"). Patch-level security fixes: flag them, still confirm before installing.
- **Don't change design tokens (colors, fonts) or the color palette without explicit approval.** If they do change, update the palette table in `README.md` to match — it already drifts from the real values in `src/styles/global.css`, don't trust that table blindly.
- **One thing at a time.** One post, one component, one config change, or one infra change per session. No bundling unrelated changes.
- **Small commits.** Each commit should be reviewable in under 2 minutes. If a change feels large, stop and check in.
- **No "and" in commit messages.** A commit message containing "and" is a sign it covers more than one concern. Split it. Example: ~~"fix hero image and update frontmatter"~~ → two commits.
- **No co-author labels.** Do not add `Co-Authored-By` trailers to commit messages.

## Voice and content

- Blog voice/style is governed by the `craftedbycode-blog-writer` skill — always use it for blog posts, don't freehand the tone.
- Other site copy (About page, business/consultancy messaging) should match that same voice unless Shane says otherwise.

## Branching model

- `master` → **production** (live site, auto-deploys to craftedbycode.co.uk)
- `develop` → **staging** (auto-deploys to a preview URL for validation)
- Feature/post branches → short-lived, named `feature/description` or `post/slug`; PR into `develop`
- `develop` → `master` PR is the **deploy step** — only after staging has been reviewed and signed off
- Hotfixes only may go directly to `master` (rare, requires explicit discussion first)

## Flow

```
feature/my-thing  →  develop (staging deploy, validate here)
                              ↓  Shane signs off
                          master (production deploy)
```

## Before any git push

Ask Shane explicitly. Wait for a clear "yes, push it" in the same message. If the session ended and restarted, ask again — prior approval does not carry over.

## Deploy pipeline

- Primary path: `.github/workflows/deploy.yml` — on push to `master` or `develop`, builds with `npm run build`, runs Terraform (`infra/`) to resolve the target S3 bucket/CloudFront distribution (prod for `master`, staging for `develop`), syncs `dist/` to S3, and invalidates CloudFront.
- `azure-pipelines.yml` is an intentional backup deploy path (GitHub Actions has gone down before) — not the primary pipeline, and not guaranteed to be kept in lockstep with the GitHub Actions workflow. Making the two fully redundant is a potential future project, not assumed done.
- Infra (Cloudflare DNS + AWS S3/CloudFront) is managed as Terraform in `infra/` — see the infra hard rule above.

## Architecture

- Astro static site (`astro build` → `dist/`). No client-side framework — components are `.astro`.
- Content collections are defined in `src/content.config.ts`. Only `blog` exists today (loads `src/content/blog/**/*.{md,mdx}`). **Note:** `README.md` still describes a second `reflections` collection — that doesn't exist in the schema; don't assume it does.
- Blog frontmatter schema: `title`, `description`, `pubDate`, `updatedDate?`, `heroImage?`, `imageCredit?`, `draft?` (default false), `tags?`.
- Pages live in `src/pages/`; `src/pages/blog/[...slug].astro` renders posts via the `BlogPost` layout (`src/layouts/BlogPost.astro`).
- Design tokens and fonts (Figtree, Satoshi) live in `src/styles/global.css` — this is the source of truth, not the README palette table.

## Commands

```bash
npm run dev      # local dev server
npm run build    # production build to dist/
npm run preview  # preview the production build
```

## Content

- Blog posts go in `src/content/blog/`
- Hero images go in `public/<post-title>/hero.png`
- Draft posts use `draft: true` in frontmatter until Shane signs off
