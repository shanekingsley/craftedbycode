# Crafted by Code

A clean, minimal blog built with [Astro](https://astro.build) to share thoughts on software development, technology, and personal reflections.

🌐 **Live Site:** [craftedbycode.co.uk](https://craftedbycode.co.uk)

## 📖 About

This blog focuses on:
- .NET and software architecture
- AI tools and workflows
- Cloud services (AWS & Azure)
- Developer insights and reflections
- Work-life balance and personal growth

## ✨ Features

- **Two Content Types:** Blog posts for technical content and Reflections for personal thoughts
- **MDX Support:** Write content in Markdown with JSX components
- **RSS Feed:** Stay updated with RSS subscriptions
- **Sitemap Generation:** Automatic sitemap for better SEO
- **Type-Safe Content:** Content collections with Zod schema validation
- **Fast & Modern:** Built on Astro for optimal performance

## 🚀 Getting Started

### Prerequisites

- Node.js (v18 or higher)
- npm or yarn

### Installation

```bash
# Clone the repository
git clone https://github.com/shanekingsley/craftedbycode.git

# Navigate to the project directory
cd craftedbycode

# Install dependencies
npm install
```

### Development

```bash
# Start the development server
npm run dev
```

The site will be available at `http://localhost:4321`

### Build

```bash
# Create a production build
npm run build

# Preview the production build
npm run preview
```

## 📁 Project Structure

```
/
├── public/          # Static assets (images, fonts, favicon)
├── src/
│   ├── components/  # Reusable UI components
│   ├── content/     # Blog posts and reflections (MDX/Markdown)
│   │   ├── blog/
│   │   └── reflections/
│   ├── layouts/     # Page layouts
│   ├── pages/       # Routes and page templates
│   ├── styles/      # Global styles
│   └── utils/       # Utility functions
└── astro.config.mjs # Astro configuration
```

## 🎨 Design System

### Color Palette

| Color Role     | Hex     | Description                    |
| -------------- | ------- | ------------------------------ |
| Charcoal       | #2B2B2B | Text, UI elements              |
| Beam Yellow    | #F5D86C | Accent, highlights             |
| Soft Blue      | #6D9AE3 | Background, calm, clean anchor |
| Pale Blue Grey | #EEF3F6 | Background light shade         |
| Pure White     | #FFFFFF | Background edge                |

## 🛠️ Tech Stack

- [Astro](https://astro.build) - Static Site Generator
- [MDX](https://mdxjs.com/) - Markdown with JSX
- TypeScript - Type safety
- RSS - Content syndication
- Sitemap - SEO optimization

## 📝 Adding Content

### Blog Posts

Create a new `.md` or `.mdx` file in `src/content/blog/`:

```markdown
---
title: "Your Post Title"
description: "A brief description"
pubDate: 2025-05-16
heroImage: "/image.jpg"
imageCredit: '<small>Photo credit</small>'
---

Your content here...
```

### Reflections

Create a new `.md` or `.mdx` file in `src/content/reflections/` with the same frontmatter structure.

## 📄 License

This project is open source and available for reference.

## 👤 Author

**Shane Kingsley**

- Website: [craftedbycode.co.uk](https://craftedbycode.co.uk)
- GitHub: [@shanekingsley](https://github.com/shanekingsley)
