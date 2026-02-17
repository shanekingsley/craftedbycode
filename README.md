# Crafted by code
My first proper go at a blog.

## Deployment

This site is automatically deployed to AWS S3 + CloudFront via GitHub Actions.

- **Trigger**: Automatic deployment on push to `master` branch
- **Workflow**: `.github/workflows/deploy.yml`
- **Hosting**: AWS S3 with CloudFront CDN
- **Build**: Astro static site generator

### Manual Deployment

To deploy manually:

```bash
npm run build
aws s3 sync ./dist s3://YOUR_BUCKET_NAME --delete
```

## Color Palette
| Color Role     | Hex     | Description                    |
| -------------- | ------- | ------------------------------ |
| Charcoal       | #2B2B2B | Text, UI elements              |
| Beam Yellow    | #F5D86C | Accent, highlights             |
| Soft Blue      | #6D9AE3 | Background, calm, clean anchor |
| Pale Blue Grey | #EEF3F6 | Background light shade         |
| Pure White     | #FFFFFF | Background edge                |
