import { generateRSS } from '../utils/generateRSS.js';

export async function GET(context) {
	return generateRSS({
		collection: 'blog',
		context,
		title: 'Crafted By Code — Blog RSS Feed',
	});
}