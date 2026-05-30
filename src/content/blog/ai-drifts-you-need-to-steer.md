---
title: "AI drifts. You need to steer."
description: "A week of refactoring my Finance project taught me something important about working with AI"
pubDate: 2026-05-30
heroImage: "/ai-drifts-you-need-to-steer/hero.png"
draft: false
tags: ["ai", "claude-code", "refactoring", "personal-project", "lessons"]
---

*Eight commits. No new features. Best week of the project so far.*

I've been building a personal finance dashboard with AI assistance for a couple of months now. The pace has been good; features landing regularly, the app taking shape. But somewhere along the way I stopped reading the code and started just shipping.

This week I stopped. Read everything. What I found was instructive.

## 🔍 The code wasn't bad

That's the honest summary. The AI-generated code wasn't broken or embarrassing. The logic worked, the structure was mostly sensible.

But reading AI-assisted code after a sprint has a particular feeling to it. It's familiar but slightly alien. Like coming back to a house someone else has been tidying while you were away. Everything is roughly where it should be, but the choices aren't quite yours.

"Not bad" isn't the same as good. There was duplication creeping in across `data.js` and the goals card. A data layer that had grown inconsistent as requirements shifted. And there was a bug quietly sitting in `investment.js`, a total return miscalculation that wasn't dramatic, just wrong. The kind of thing that gets missed when you're always looking forward.

Oh, and 17 separate migration files for a project with one environment and no production users. So I consolidated them into a single `001_init.sql`. The database didn't notice. The codebase breathed easier.

## 🗑️ The real mess was in the markdown

Here's something I have learnt: AI doesn't just write code. It generates a lot of supporting material too — planning docs, architecture notes, context files, task summaries.

When I audited the `.planning/` directory, I found over 9,000 lines of stale documentation. A phase plan describing an authentication flow that had been scrapped three iterations ago. Summaries referencing components that had since been renamed or removed. Notes confidently explaining the rationale behind decisions that had already been reversed.

It wasn't malicious. Just drift.

The AI had been dutifully updating its own context files as it went, but over time those files became a record of old intentions rather than current reality. A palimpsest of what it *thought* was happening, not what actually ended up in the codebase. And because those files feed back into future sessions as context, the drift compounds. The AI starts optimising for a version of the project that no longer exists.

I deleted 9,114 lines. The project got clearer overnight.

## 🧭 The junior dev analogy

The best way I can describe working with AI: it's like pairing with a talented junior developer who hasn't yet developed longer-term wisdom.

They write decent code. They follow the patterns you've established. They remember what you told them this morning. But they don't yet have the instinct for when to stop and clean up, when a pattern is quietly becoming a problem, or when the scaffolding has outlived its purpose. They're heads-down on the task. The bigger picture is yours to hold.

A good senior engineer looks at the whole codebase periodically and asks: *does this still make sense?* That's not something you can delegate. AI doesn't do it unprompted — it optimises for the current task, not the long-term health of the project.

That's not a flaw to fix. It's the nature of the tool. And once you understand it, the fix is simple: you become the senior. You do the review. You set the direction.

## ⚡ Course correct regularly

For me, that looks like blocking out time every few weeks to actually *read* the code rather than just write it. Checking whether the planning docs still reflect reality. Asking whether the patterns that emerged organically still make sense now the project has matured.

It's not glamorous. There's no feature to show at the end. But the total return calculation is now correct, the migration history is clean, and I know exactly what's in the codebase because I looked at it myself.

The longer you go without reviewing, the more drift accumulates. AI accelerates development. It doesn't replace the human judgment that keeps a codebase honest.

You're still the one who has to steer.

— Shane
