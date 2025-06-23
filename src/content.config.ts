import { glob } from 'astro/loaders';
import { defineCollection, z } from 'astro:content';

const _schema = z.object({
	title: z.string(),
	description: z.string(),
	// Transform string to Date object
	pubDate: z.coerce.date(),
	updatedDate: z.coerce.date().optional(),
	heroImage: z.string().optional(),
	imageCredit: z.string().optional(), 
});

const blog = defineCollection({
	// Load Markdown and MDX files in the `src/content/blog/` directory.
	loader: glob({ base: './src/content/blog', pattern: '**/*.{md,mdx}' }),
	// Type-check frontmatter using a schema
	schema: _schema,
});

const reflections = defineCollection({
  // Load Markdown and MDX files in the `src/content/blog/` directory.
	loader: glob({ base: './src/content/reflections', pattern: '**/*.{md,mdx}' }),
	// Type-check frontmatter using a schema
	schema: _schema,
});

export const collections = {
  blog,
  reflections
};
