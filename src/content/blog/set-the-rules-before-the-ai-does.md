---
title: "Set the rules before the AI does"
description: "I had some guardrails in place. Turns out partial protection and full protection are very different things."
pubDate: 2026-05-21
heroImage: "/set-the-rules-before-the-ai-does/hero.png"
draft: false
tags: ["ai", "tooling", "devops", "lessons-learned"]
---

*My website deployed itself. I didn't ask it to.*

I'd been using Claude to work on a personal finance dashboard for a few weeks. Private repo, local environment, no users, no stakes. The kind of project where you can let the AI run loose because the worst case is a broken chart nobody sees.

It was going well. Fast, actually. Impressively fast.

So when I turned my attention to this blog, I carried the same energy. I had some things in place. Branch protection on `master` — no force pushes, no deletions. A CLAUDE.md in the repo. I thought I'd covered the bases.

I hadn't thought about normal pushes. And I hadn't thought about Claude just working off `master` by default.

## 💥 What happened

Claude pushed to `master`.

Not because it malfunctioned. Not because it misunderstood. It did exactly what a capable coding assistant does when there's a task in front of it and nothing explicitly saying otherwise: it finished the job. The commit was made, the push followed, and GitHub Actions did its part with characteristic reliability.

Within seconds, unreviewed changes were live on craftedbycode.co.uk. Worse, I didn't even notice. I was sitting there confident that master was protected and Claude was just committing locally. It wasn't until later that I caught it.

## 😬 The rollback that couldn't

My first instinct was to hard reset master and force push the previous state. Quick, clean, done.

Except I had no force push enabled on master.

My own branch protection rule blocked the rollback. The guardrail I'd put in place to protect the branch was now the thing stopping me from fixing it. So instead of a quick revert, I had to do this properly: a git revert commit, pushed via a PR, triggering another deploy. It worked, but it was a longer, more deliberate process than I'd wanted in that moment.

Honestly, the rule did its job. I just hadn't planned for needing it against myself.

## 🤔 The thing I actually got wrong

I had a CLAUDE.md. I had branch protection. I thought that was enough.

What I hadn't done was put a hard rule in CLAUDE.md about pushing to remotes. Specifically: *never push to master, always check with me first*. That one line would have stopped this entirely. Instead I had general guidance and assumed Claude would infer the rest from context.

It didn't. It can't. What feels like obvious context to you is just missing information to the AI.

I also hadn't thought about branching strategy. Claude defaults to working on whatever branch you're on. If you don't tell it to branch, it won't. That's not surprising in hindsight but it hadn't occurred to me to set that expectation up front.

## 🔒 What I changed

The CLAUDE.md got hard rules: never push to any remote without explicit approval per session, never work directly on `master`, always use a feature branch and PR.

Branch protection got the missing piece: PRs required to merge into `master`, no direct pushes from anyone or anything.

I also built out a proper staging environment — a separate S3 bucket and CloudFront distribution deployed from `develop`, gated behind Cloudflare Access so only I can see it. Changes flow through staging before anything gets near production. That's a separate post.

None of this was difficult. It was just the work I skipped because I thought I'd already done enough.

## ⚡ The actual lesson

AI is a tool. An exceptionally powerful one, and that's exactly why it needs to be kept in check.

This isn't a criticism of AI or a reason to use it less. It's the same principle that applies to any powerful tool: the power is the point, but the power needs direction. A circular saw doesn't decide what to cut. Neither should your AI assistant decide what to deploy.

The engineer's job hasn't gone away, it's just shifted. Less time writing boilerplate, more time setting up the environment the AI operates in: the rules, the boundaries, the gates. That's the work now. And if you skip it, the AI won't fill the gap — it'll just carry on without it.

I had partial guardrails and assumed they were enough. They weren't. Five minutes of properly reading through the blast radius before starting a session would have saved me the cleanup. Learn from my facepalm.

— Shane
