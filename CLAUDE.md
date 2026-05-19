# Claude Code Rules — craftedbycode.co.uk

This is a **public-facing production website**. Every push to `master` auto-deploys live via GitHub Actions. Treat it accordingly.

## Hard rules

- **Never push to `master` directly.** Not even if Shane approved a commit. Committing ≠ pushing. Always stop and ask: "Ready to push?" in the current turn.
- **Never merge a PR without explicit instruction.** Creating a PR is fine; merging it is not.
- **One thing at a time.** One post, one component, one config change per session. No bundling unrelated changes.
- **Small commits.** Each commit should be reviewable in under 2 minutes. If a change feels large, stop and check in.
- **No "and" in commit messages.**
- **No co-author labels.** Do not add `Co-Authored-By` trailers to commit messages. A commit message containing "and" is a sign it covers more than one concern. Split it. Example: ~~"fix hero image and update frontmatter"~~ → two commits.

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

## Content

- Blog posts go in `src/content/blog/`
- Hero images go in `public/blog/`
- Draft posts use `draft: true` in frontmatter until Shane signs off
