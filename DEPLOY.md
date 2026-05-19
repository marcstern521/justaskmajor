# justaskmajor.com — DEPLOY GUIDE

Everything is wired and ready. This is the final deployment guide.

## What's baked in

- ✅ Amazon Associates tag: `marcstern521-20` (32 affiliate links across site)
- ✅ Formspree form ID: `mwvaddlk` (contact form active)
- ✅ All 7 pages built and cross-linked
- ✅ Sitemap.xml and robots.txt for SEO
- ✅ Affiliate disclosure on every page footer

## File structure

```
justaskmajor/
├── index.html                  # Homepage
├── services.html               # Advisor / Quarterly Partner / Projects
├── about.html                  # Story, M3, Major pledge
├── contact.html                # Formspree-wired contact form
├── resources.html              # Curated affiliate kit (your tagged links)
├── blog/
│   ├── index.html              # Blog landing
│   └── smb-it-starter-kit.html # Launch post
├── assets/
│   └── style.css               # Shared stylesheet
├── sitemap.xml                 # SEO
└── robots.txt                  # SEO
```

## Deploy — Cloudflare Pages (fastest path)

### Step 1: Upload the bundle

1. Log into Cloudflare dashboard → **Workers & Pages**
2. Click your existing `justaskmajor` project
3. Click **Create deployment** (top right)
4. Select **Upload assets**
5. Drag-and-drop the entire `justaskmajor` folder (or upload the .zip and Cloudflare will extract)
6. Click **Deploy site**

Live in under a minute. Your custom domain (justaskmajor.com) should auto-route since it was previously configured.

### Step 2: Verify live site

After deployment, open https://justaskmajor.com and click through:

- [ ] **Homepage** loads, navy/copper styling renders, fonts load
- [ ] **Services** page shows Advisor + Quarterly Partner tier cards
- [ ] **About** page renders the Major story
- [ ] **Resources** page loads with "✓ Marc owns this" tags
- [ ] **Blog** index and the SMB starter kit post load
- [ ] **Contact** form displays
- [ ] **Mobile view** — open on your phone, verify nav hamburger and layout
- [ ] **Footer disclosure** visible on every page

### Step 3: Test the contact form

This is critical — verify Formspree is delivering.

1. Open https://justaskmajor.com/contact.html
2. Fill out the form with your own info (use a real email)
3. Submit
4. Check Formspree dashboard → Submissions → confirm it landed
5. Check the email inbox you set up for Formspree → confirm the notification arrived

If the email doesn't arrive: check your spam folder, then check Formspree → Settings → verify the notification email address is correct.

### Step 4: Test an Amazon link

1. Open https://justaskmajor.com/resources.html
2. Click any "View on Amazon →" link
3. On Amazon, scroll to the bottom of the product page
4. You should see your tracking ID `marcstern521-20` in the URL bar
5. Verify in Amazon Associates dashboard: clicks should start showing up within 1-2 hours

## Formspree post-launch settings

Two things to do in Formspree after deployment:

### Restrict domains (security)
Settings → look for "Allowed Domains" or "Restrict Domains"
- Add `justaskmajor.com`
- Add `www.justaskmajor.com`

This prevents the form endpoint from being abused by other sites.

### Auto-response (optional but recommended)
Workflow → Actions → look for "Autoresponse" or "Email to submitter"

Suggested copy:

```
Subject: Got your message — Marc at justaskmajor

Hi {{name}},

Thanks for reaching out through justaskmajor.com. I've got your message and I'll reply personally within one business day with next steps — usually a short call to talk through what you need.

If your situation is time-sensitive, just reply to this email and let me know.

Talk soon,
Marc Stern
justaskmajor.com

10% of every invoice donated to special needs nonprofits
```

## SEO submission (do within 24 hours of launch)

### Google Search Console
1. Go to https://search.google.com/search-console
2. Add property → `justaskmajor.com`
3. Verify via DNS (Cloudflare makes this easy — add a TXT record they give you)
4. Once verified: Sitemaps → submit `https://justaskmajor.com/sitemap.xml`

### Bing Webmaster Tools
1. Go to https://www.bing.com/webmasters
2. Same process — add site, verify, submit sitemap

This kicks off indexing. Expect first results to appear in Google in 1-2 weeks.

## Cloudflare Web Analytics (free, no JS bloat)

1. Cloudflare dashboard → Analytics & Logs → Web Analytics
2. Add a site → enter `justaskmajor.com`
3. Choose "automatic setup" if your domain is on Cloudflare DNS (it is)
4. No JS snippet needed — works at the edge

You'll get traffic data without slowing the site down or needing a cookie banner.

## After-launch checklist

- [ ] Site loads at https://justaskmajor.com
- [ ] All pages render correctly
- [ ] Mobile view tested
- [ ] Contact form submission delivered to your inbox
- [ ] Amazon link carries `marcstern521-20` tag
- [ ] Formspree allowed domains set
- [ ] Google Search Console verified and sitemap submitted
- [ ] Bing Webmaster Tools verified and sitemap submitted
- [ ] Cloudflare Web Analytics enabled
- [ ] (Optional) LinkedIn announcement post drafted

## Need to update content later?

For now, edit the HTML files directly and redeploy. For a more polished workflow:

1. Push the folder to a private GitHub repo
2. Connect Cloudflare Pages to GitHub
3. Every push to `main` auto-deploys
4. Future edits can be made from anywhere

I can walk you through Git setup separately if you want that.

## What's deliberately not included

- No JavaScript framework — keeps load fast, no build step
- No tracking pixels — Cloudflare Web Analytics handles this privacy-friendly
- No cookie banner — no cookies are set, so no banner required
- No newsletter signup — add via ConvertKit or Buttondown later if list-building matters
