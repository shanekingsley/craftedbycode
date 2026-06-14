---
title: "Renting intelligence"
description: "Two evenings with Fable 5, then it was gone. A note on dependency, atrophy, and an AI industry moving faster than the rules"
pubDate: 2026-06-14
heroImage: "/renting-intelligence/hero.png"
draft: false
tags: ["ai", "claude", "tools", "opinion"]
---

*Two evenings with Fable 5. By Friday, it was gone.*

Anthropic released Fable 5 last week as part of their Mythos preview. I had two evenings with it before the weekend I was actually planning to use it. I gave it a few general tasks first, was genuinely impressed, then pointed it at something I cared about: a set of AI skills for an ATDD/BDD workflow.

The plan for the weekend was to use those skills, with Fable 5, to one-shot a real project. Pure ATDD in, working application out. The skills are sitting in a repo: [shanekingsley/atdd-bdd-plugin](https://github.com/shanekingsley/atdd-bdd-plugin). They need a tidy. I didn't get the chance.

By Friday morning, Fable 5 was pulled.

## 🧠 What two evenings looked like

Fable 5 was the best model I've used. Not by a small margin.

It read context faster, held more of it, and made fewer of the small mistakes that normally pile up over a long session. When I described the ATDD workflow I wanted, it didn't just produce a single skill file. It produced a set of skills that referenced each other, with consistent structure and the right level of granularity. I'd have spent a day shaping that. It took an evening.

That part was the impressive bit. The scary bit was harder to put into words. It felt *forward*. Like it was ahead of me, and willing to keep going.

I'm not anthropomorphising. I know what these models are. But there's a tangible difference between a model you're driving and a model you're trying to keep up with. Fable 5 was the second kind.

## 🛑 Why it got pulled

[Anthropic's announcement](https://www.anthropic.com/news/fable-mythos-access) is short and unusually candid. A US government directive ordered them to suspend access. The trigger: a demonstration that Fable 5 could be asked to read a codebase and surface vulnerabilities.

Anthropic disagreed. They said the capability was widely available elsewhere and the vulnerability was minor and known. They complied anyway.

Here's the thing. I can see why the directive landed. If you spent two evenings with this model, you'd understand the nervousness. It's not that it's dangerous in any obvious sense. It's that it's *capable* in a way that gets ahead of the rules we've thought to write.

## 🪫 The dependency question (it isn't new)

> We don't own these tools. We rent them. And the landlord can change the locks overnight.

This isn't new. We rent operating systems, cloud platforms, IDEs, package registries. The landlord has always been able to change the locks. We've adapted.

The newer question is the one underneath: what happens when we forget how to do this without the tool?

Not "lose convenience." Atrophy. The actual skill of breaking down a problem, holding the structure in your head, writing the code. If your default workflow assumes a model that can disappear, and you've stopped exercising the muscles that worked before it, you don't just lose productivity when it goes. You lose competence.

I felt a flicker of that on Saturday morning. Not panic. A small "wait, how was I going to do this?" That's the warning sign.

## ⚠️ Faster than the rules

There's a bigger question I've been chewing on since Friday.

AI is moving faster than any legislation, ethics framework, or institutional review can keep up with. The Fable 5 recall is a small example of that gap. A government noticed a single demonstrated capability and reached straight for the off switch, because the off switch is the only lever they have. The model behind it had been through extensive red-teaming. None of that mattered in the moment.

We can argue about whether the directive was right. What we can't argue about is the shape of the situation: a frontier capability shipped, was used, and was withdrawn, all faster than any public process designed to evaluate it.

Is it time to slow down?

I'm not sure. I don't love that question, because I'm one of the people benefitting from the pace. But I think it's worth asking out loud, and I think the people who get to answer it shouldn't only be the people building the models.

> Pandora's box is already open. Let's close it before hope has gone too.

## 🪙 The takeaway

I'll get the atdd-bdd skills tidied up at some point. I'll use them with whatever model is current. The work isn't lost.

What stays with me is the feeling of those two evenings. Impressed, slightly scared, and aware that the gap between what these models can do and what we've collectively decided they should do is widening fast.

Build like the tool might be gone next Tuesday. Practice like it never existed. And keep asking who gets to decide what gets built next.

— Shane