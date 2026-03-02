# Publishing Guide

Steps to publish your GCP AI Tools Runner project to GitHub.

## Prerequisites

1. GitHub account
2. Git installed locally
3. This repository initialized and committed

## Step 1: Create GitHub Repository

### Option A: Via GitHub Website

1. Go to [github.com](https://github.com) and sign in
2. Click the "+" icon in top right
3. Select "New repository"
4. Fill in details:
   - **Repository name**: `gcp-ai-tools-runner`
   - **Description**: "Interactive shell script to use Claude, Gemini, and OpenAI via GCP Vertex AI. Maximize your free GCP credits!"
   - **Visibility**: Public
   - **DO NOT** initialize with README, .gitignore, or license (we already have these)
5. Click "Create repository"

### Option B: Via GitHub CLI

```bash
# Install gh CLI if needed
brew install gh  # macOS
# or visit https://cli.github.com/

# Login
gh auth login

# Create repository
gh repo create gcp-ai-tools-runner --public --description "Interactive shell script to use Claude, Gemini, and OpenAI via GCP Vertex AI"
```

## Step 2: Connect Local Repository to GitHub

After creating the repository on GitHub, you'll see instructions. Use:

```bash
# Add remote repository
git remote add origin https://github.com/YOUR_USERNAME/gcp-ai-tools-runner.git

# Or if using SSH
git remote add origin git@github.com:YOUR_USERNAME/gcp-ai-tools-runner.git

# Verify remote
git remote -v
```

## Step 3: Push to GitHub

```bash
# Push main branch
git branch -M main
git push -u origin main
```

## Step 4: Configure Repository Settings

### Repository Description

Add a description and topics:

1. Go to your repository on GitHub
2. Click "About" settings (gear icon)
3. Add description: "Interactive shell script to use Claude, Gemini, and OpenAI via GCP Vertex AI. Maximize your free GCP credits!"
4. Add topics:
   - `gcp`
   - `vertex-ai`
   - `claude`
   - `gemini`
   - `openai`
   - `ai`
   - `cli`
   - `bash`
   - `shell-script`
   - `gcp-credits`

### Enable Issues

1. Go to Settings → Features
2. Ensure "Issues" is checked

### Enable Discussions (Optional)

1. Go to Settings → Features
2. Check "Discussions"
3. Set up categories for:
   - General
   - Q&A
   - Show and tell
   - Feature requests

## Step 5: Update README with Correct URLs

Update the README.md file to replace placeholders:

```bash
# Replace YOUR_USERNAME with your actual GitHub username
sed -i '' 's/code-wiki/YOUR_ACTUAL_USERNAME/g' *.md
sed -i '' 's/code-wiki/YOUR_ACTUAL_USERNAME/g' .github/ISSUE_TEMPLATE/*.md

# Commit changes
git add .
git commit -m "Update repository URLs with actual GitHub username"
git push
```

## Step 6: Add Repository Social Preview

Create a social preview image (1280x640 recommended):

1. Go to Settings → Social Preview
2. Upload an image (you can create one at [canva.com](https://canva.com))
3. Suggested text for image:
   ```
   GCP AI Tools Runner
   Use Claude, Gemini & OpenAI
   Via GCP Vertex AI
   Maximize Your Free Credits!
   ```

## Step 7: Set Up GitHub Pages (Optional)

For documentation hosting:

1. Go to Settings → Pages
2. Source: Deploy from a branch
3. Branch: main, folder: / (root)
4. Save

Your docs will be available at: `https://YOUR_USERNAME.github.io/gcp-ai-tools-runner/`

## Step 8: Add Badges to README

Consider adding these badges at the top of README.md:

```markdown
[![GitHub stars](https://img.shields.io/github/stars/YOUR_USERNAME/gcp-ai-tools-runner?style=social)](https://github.com/YOUR_USERNAME/gcp-ai-tools-runner/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/YOUR_USERNAME/gcp-ai-tools-runner?style=social)](https://github.com/YOUR_USERNAME/gcp-ai-tools-runner/network/members)
[![GitHub issues](https://img.shields.io/github/issues/YOUR_USERNAME/gcp-ai-tools-runner)](https://github.com/YOUR_USERNAME/gcp-ai-tools-runner/issues)
[![GitHub license](https://img.shields.io/github/license/YOUR_USERNAME/gcp-ai-tools-runner)](https://github.com/YOUR_USERNAME/gcp-ai-tools-runner/blob/main/LICENSE)
```

## Step 9: Create Release

### Via GitHub Website

1. Go to your repository
2. Click "Releases" on right sidebar
3. Click "Create a new release"
4. Fill in:
   - **Tag**: `v1.0.0`
   - **Release title**: `v1.0.0 - Initial Release`
   - **Description**: Copy from CHANGELOG.md
5. Check "Set as the latest release"
6. Click "Publish release"

### Via GitHub CLI

```bash
gh release create v1.0.0 \
  --title "v1.0.0 - Initial Release" \
  --notes-file CHANGELOG.md
```

## Step 10: Share Your Project

### Share on Social Media

**Twitter/X:**
```
🚀 Just open-sourced GCP AI Tools Runner!

✅ Use Claude, Gemini & OpenAI via GCP Vertex AI
✅ Maximize your $300 free GCP credits
✅ Simple bash scripts, no complex setup
✅ MIT licensed

Check it out: https://github.com/YOUR_USERNAME/gcp-ai-tools-runner

#GCP #AI #OpenSource #Claude #Gemini
```

**LinkedIn:**
```
I'm excited to share my new open-source project: GCP AI Tools Runner!

This tool helps developers maximize their GCP free credits by providing easy access to Claude and Gemini via Vertex AI, with support for OpenAI too.

Features:
• Interactive configuration menu
• Simple chat interface
• Works on local machines and GCP VMs
• Comprehensive documentation
• MIT licensed

Perfect for developers who want to experiment with multiple AI models without complex setup.

GitHub: https://github.com/YOUR_USERNAME/gcp-ai-tools-runner

Would love your feedback and contributions!
```

**Reddit:**

Post to:
- r/googlecloud
- r/commandline
- r/opensource
- r/programming
- r/devops

### Share on Communities

- Hacker News
- Dev.to
- Hashnode
- Product Hunt
- Indie Hackers

## Step 11: Add to Awesome Lists

Search for and submit to relevant "awesome" lists:
- [awesome-gcp](https://github.com/GoogleCloudPlatform/awesome-google-cloud)
- [awesome-cli-apps](https://github.com/agarrharr/awesome-cli-apps)
- [awesome-shell](https://github.com/alebcay/awesome-shell)

## Monitoring Your Project

### GitHub Insights

Check regularly:
- Traffic: Views and unique visitors
- Community: Issues, PRs, discussions
- Contributors: Who's helping

### Engage with Users

- Respond to issues promptly
- Thank contributors
- Update documentation based on feedback
- Release updates regularly

## Maintenance

### Regular Updates

1. Review and merge pull requests
2. Respond to issues
3. Update dependencies
4. Release new versions
5. Keep documentation current

### Version Releases

When releasing new versions:

```bash
# Update CHANGELOG.md
# Commit changes
git add CHANGELOG.md
git commit -m "Update changelog for v1.1.0"

# Create tag
git tag -a v1.1.0 -m "Version 1.1.0"

# Push
git push origin main --tags

# Create GitHub release
gh release create v1.1.0 --title "v1.1.0" --notes-file CHANGELOG.md
```

## Contact Information

Update these in your repository:

1. Add your contact info to SECURITY.md
2. Add email to repository description
3. Add social links to profile README

## Next Steps After Publishing

1. ✅ Monitor initial feedback
2. ✅ Respond to first issues
3. ✅ Thank first contributors
4. ✅ Share in communities
5. ✅ Add to portfolio/resume
6. ✅ Write blog post about the project
7. ✅ Continue development based on feedback

## Quick Checklist

Before publishing, verify:

- [ ] All scripts are executable (`chmod +x *.sh`)
- [ ] No sensitive data in repository
- [ ] README has correct GitHub username
- [ ] LICENSE file is present
- [ ] .gitignore includes sensitive files
- [ ] All documentation links work
- [ ] Examples are tested and working
- [ ] Issue templates are configured
- [ ] Repository description is set
- [ ] Topics/tags are added
- [ ] Initial release is created
- [ ] Security policy is defined

---

**Congratulations on publishing your open-source project! 🎉**

Remember: The most successful open-source projects are those that are actively maintained and engage with their community.
