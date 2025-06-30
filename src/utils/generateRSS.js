import { getCollection } from 'astro:content';
import  rss from '@astrojs/rss';
import { SITE_TITLE, SITE_DESCRIPTION } from '../consts';

export async function generateRSS({ collection, 
    context,
    title = SITE_TITLE, 
    description = SITE_DESCRIPTION }) {
	const posts = await getCollection(collection);
	return rss({
		title,
		description,
		site: context.site,
		items: posts.map((post) => ({
			...post.data,
			link: `/${post.collection}/${post.slug || post.id}/`,
		})),
	});
}