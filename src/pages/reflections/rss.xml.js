import { generateRSS } from '../../utils/generateRSS.js';

export async function GET(context) {
	return generateRSS({
		collection: 'reflections',
		context,
		title: 'Crafted By Code — Reflections RSS Feed',
		description: 'Reflections on life, growth, and the messier parts of being human.',
	});
}