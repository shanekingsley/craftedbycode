# Removing Netlify Integration

## Current Situation

Your repository is currently experiencing PR check failures due to Netlify deployment checks. The issue is:

- **Status Check**: `netlify/craftedbycode/deploy-preview` 
- **State**: Failing
- **Reason**: The site is no longer deployed via Netlify (now using S3 via GitHub Actions)

## Why This Is Happening

Netlify is still connected to your GitHub repository and attempting to deploy preview builds for each PR. Since the Netlify site is no longer active or configured, these deployments fail, causing the status check to fail.

## Solution: Disconnect Netlify from GitHub

You need to remove the Netlify integration. Here are the steps:

### Option 1: Remove Netlify Site Entirely (Recommended)

1. **Go to Netlify Dashboard**
   - Visit [https://app.netlify.com](https://app.netlify.com)
   - Log in to your account

2. **Navigate to Your Site**
   - Find the `craftedbycode` site in your sites list
   - Click on it to open site settings

3. **Delete or Stop Builds**
   - Go to **Site settings** → **Build & deploy**
   - Scroll down to **Build settings**
   - Click **"Stop builds"** or delete the site entirely
   
   OR
   
   - Go to **Site settings** → **General**
   - Scroll to the bottom
   - Click **"Delete this site"**

### Option 2: Keep Netlify Site but Disable GitHub Integration

1. **Go to Netlify Dashboard**
   - Visit your site at [https://app.netlify.com/sites/craftedbycode](https://app.netlify.com/sites/craftedbycode)

2. **Disconnect from Repository**
   - Go to **Site settings** → **Build & deploy**
   - Under **Continuous deployment**, click **"Link site to Git"** 
   - Click **"Disconnect"** or unlink the repository

### Option 3: Remove Required Status Check in GitHub

If you've already disconnected Netlify but PRs still show the failing check:

1. **Go to GitHub Repository Settings**
   - Visit [https://github.com/shanekingsley/craftedbycode/settings/branches](https://github.com/shanekingsley/craftedbycode/settings/branches)

2. **Edit Branch Protection Rules**
   - Find the rule for your `master` branch (or default branch)
   - Click **Edit**

3. **Remove Netlify from Required Checks**
   - Under **"Require status checks to pass before merging"**
   - Find `netlify/craftedbycode/deploy-preview` in the list
   - Click the **X** to remove it
   - Save changes

### Option 4: Revoke Netlify GitHub App Access

If you want to completely remove Netlify's access to your GitHub repositories:

1. **Go to GitHub Settings**
   - Visit [https://github.com/settings/installations](https://github.com/settings/installations)

2. **Find Netlify**
   - Look for "Netlify" in the installed GitHub Apps list
   - Click **Configure**

3. **Modify Repository Access**
   - Either remove access to `craftedbycode` repository specifically
   - Or uninstall the Netlify app entirely if you're not using it

## Verifying the Fix

After completing the steps above:

1. The failing Netlify check should stop appearing on new commits
2. Existing PRs may still show the old failed check, but new commits won't trigger Netlify
3. You can re-run checks on existing PRs after disconnecting Netlify

## Current Deployment Setup

Your site is now deployed via **AWS S3 + CloudFront** using GitHub Actions:

- **Workflow**: `.github/workflows/deploy.yml`
- **Trigger**: Pushes to `master` branch
- **Process**: Build site → Sync to S3 → Invalidate CloudFront cache
- **Status**: This workflow is working correctly

## Need Help?

If you encounter any issues following these steps:

1. Check if you have admin access to both Netlify and GitHub repository
2. Verify you're signed in to the correct Netlify account
3. Contact GitHub or Netlify support if you need additional assistance

---

**Note**: This document can be deleted once the Netlify integration has been successfully removed.
