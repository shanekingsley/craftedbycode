---
title: "From backburner to deployed: actually built something real with AI"
description: "I gave AI a real project instead of a toy demo — months of procrastination turned into a deployed app in hours"
pubDate: 2026-05-14
heroImage: "/desk_pi.png"
draft: true
tags: ["ai", "claude-code", "self-hosting", "personal-project", "productivity"]
---

*Six months on the backburner. Hours days to deploy. Rethinking what is possible.*

---

I had a personal finance dashboard I'd been meaning to build properly for ages. Not a tutorial project. Not a demo. A real thing, for my actual household finances, running on a Raspberry Pi in my house.

I kept putting it off. Not because it was hard, exactly. More because "hard enough to feel like a weekend project that becomes a three-week thing" is exactly the kind of thing that stays on a list forever.

Then I started using Claude Code properly.

## 🚀 The thing about real projects

The demos are misleading.

Not deliberately. But there's a significant difference between watching someone build a CRUD app in twenty minutes and using AI to build something with actual stakes. Real data. Real infrastructure decisions. Real things that could go wrong.

The demos make AI look like a shortcut. It's not exactly that. It's more like having a developer who's genuinely good at keeping everything in their head while you talk through the problem out loud.

The thinking still happens. You're still making the decisions. But the time between "I want this" and "this exists" collapses dramatically.

## 🏗️ What I actually built

A personal finance dashboard. PostgreSQL on the backend, an Express API, a vanilla JS frontend. Runs in Docker, served via Nginx Proxy Manager, sits on a Raspberry Pi in my living room.

It tracks household income, emergency fund balances pulled live from the database, a live Trading 212 portfolio value synced on a schedule via their API, net worth including property equity and pension pots, monthly budget breakdown, debt countdown, and Gift Aid tracking.

Before I started, it was a static HTML file with numbers hardcoded in three different places. The data was already drifting.

Within the first session, Claude found a gross/net mismatch in the budget figures I hadn't caught. It also noticed various discrepancies in the numbers without being asked to look. Not a bad start.

Then the cards started appearing.

A net worth card. A monthly budget breakdown. An emergency fund tracker showing individual account balances with interest rates. Before I knew it I had a real dashboard — not a prototype.

![Dashboard cards showing budget and emergency fund](/screens/cards.png)

The one that genuinely surprised me was the Trading 212 integration. I asked for a live portfolio tracker pulling straight from the T212 API, syncing on a schedule, storing snapshots in the database. Done. Real portfolio value, updating automatically, sitting right there on the page.

![Net worth and portfolio cards](/screens/net.png)

And when I needed screenshots for this post without exposing real figures, I asked for a privacy toggle. A button that blurs all the sensitive numbers. Done in minutes. It even persists in localStorage so it remembers your preference between visits.

## ⚡ The pace of it

I had a working, deployed app in roughly two hours, four and it was hooked up to a database, regression testing itself and planning future sessions. Not even days, hours.

Previous estimate for doing this alone: several weekends. Maybe never, honestly.

That's the real value. Not that AI wrote all the code (it didn't), but that the friction between idea and implementation is low enough that you actually do the thing instead of deferring it again.

The workflow I settled on breaks work into phases and plans, tracks what's done, and verifies before marking things complete. That structure meant I was never staring at a blank page wondering what to do next. The scaffolding problem — the part that kills most personal projects before they start — just went away. I even got it to update a 'journey' file as I went so I could remember everything I did when I came to writing this blog.

## 🐛 What it got wrong

Here's the honest part. And I think this is where a lot of AI content fails.

**It missed an XSS vulnerability.** The whole point of a safety module was to provide proper escaping for database-sourced strings going into the DOM. The module was built correctly. It was just never wired in. Three card components were interpolating database values directly into innerHTML without escaping. A code review caught it after the fact. The AI that wrote the code didn't flag it.

**The test suite was a mess.** Tests were failing on Windows because of Unix-only environment variable syntax. Jest was picking up test files from Git worktrees. A Playwright install step was missing entirely. An end-to-end test was checking for a card named "Debt Countdown" that had been renamed sessions earlier. None of these were fatal. All of them needed manual diagnosis.

**A database migration had the production DB name hardcoded.** Worked fine in production. Failed immediately in the test environment. Easy fix once spotted. Required me to spot it.

The pattern is consistent. AI is excellent at building the thing. It's less reliable at thinking about environment differences, edge cases, and the thing it built three sessions ago that still needs to work with what it's building now.

That's not a dealbreaker. It's just the shape of the tool. And honestly, on a personal project, would I have thought about this beforehand either? Maybe, maybe not.

## 🧰 What I've learned about wielding it

The word I keep coming back to is *wielding*. Not using. Not prompting. Wielding.

When I started, I felt like I needed to understand every line before accepting it. I'd second-guess suggestions, re-read everything twice, feel vaguely guilty about not writing it myself.

That's the wrong mode.

The right mode is more like being a technical lead working with a fast but occasionally overconfident engineer. You set the direction. You review the output. You catch what they missed. You don't do their job for them, but you're absolutely paying attention.

The more I've worked that way, the more useful it becomes. And the less anxious I feel about it.

## 🖥️ It runs on a Pi. In my living room.

I want to sit with this for a second.

Getting something like this running — PostgreSQL, a proper migration system, a live API integration, Docker Compose with a correct network setup — would previously have been a meaningful weekend project. The kind of thing you'd be quietly proud of.

It still is. But it took two days instead of several weekends.

And it works. It's running right now. My actual financial data, updating live, accessible from any browser in the house.

The backburner project is off the backburner, and for me, thats a huge win.

That's the thing AI sceptics miss when they debate whether AI "really" codes. The question isn't whether the code is any good (it mostly is, with review). The question is whether the project gets built at all.

A lot of personal projects don't get built. Not because they're too hard, but because the ratio of friction to enthusiasm tips the wrong way. AI shifts that ratio.

## 🧭 Where I'm at now

I wrote a post a while back about feeling anxious about AI. Worried about the pace, the noise, the sense that everything was moving too fast to keep up.

This project didn't resolve all of that. But it changed something.

I'm less scared of it now. Not because the problems I worried about have gone away, but because I've used it on something real and I understand its shape better.

Powerful and fallible at the same time. Needs directing and reviewing. Gives you back the time you'd spend on scaffolding so you can focus on the parts that actually require judgement.

That's not scary. That's just a better version of the tool I already use.

---

Shane 🪐
