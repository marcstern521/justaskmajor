# justaskmajor.com — site bundle

Production-ready static site for Cloudflare Pages. Drop the entire folder contents into the project root and deploy.

## File structure

```
justaskmajor/
├── index.html              # Home
├── services.html           # 3 tiers + FAQ
├── about.html              # Personal story + Major pledge
├── contact.html            # Formspree contact form
├── resources.html          # Curated Amazon affiliate kit
├── sitemap.xml             # SEO
├── robots.txt              # SEO
├── blog/
│   ├── index.html          # Blog landing
│   └── smb-it-starter-kit.html   # Launch post w/ affiliate links
└── assets/
    └── style.css           # Shared stylesheet
```

## Before going live — find and replace

Three placeholders need real values. Use a text editor's project-wide find-and-replace:

| Placeholder | Where to get it | Files affected |
|---|---|---|
| `YOUR_FORM_ID` | Formspree.io → New Form → copy the form ID from the endpoint URL | `contact.html` (1 location) |
| `YOUR_AMAZON_TAG` | Amazon Associates Central → Account Settings → Tracking IDs (e.g. `justaskmajor-20`) | `resources.html` + `blog/smb-it-starter-kit.html` (~15 locations) |
| `hello@justaskmajor.com` | Set up this address (or replace with whatever email you want) | All pages, footer |

**Quick PowerShell one-liner for find/replace on Windows:**

```powershell
$root = "C:\path\to\justaskmajor"
$amazon = "justaskmajor-20"   # your real tag
$formspree = "abcd1234"        # your real form ID

Get-ChildItem -Path $root -Recurse -Include *.html | ForEach-Object {
    (Get-Content $_.FullName) `
      -replace 'YOUR_AMAZON_TAG', $amazon `
      -replace 'YOUR_FORM_ID', $formspree |
    Set-Content $_.FullName
}
```

## Deploy to Cloudflare Pages

### Option 1 — Direct upload (fastest)
1. Log into Cloudflare → Pages → your existing `justaskmajor` project
2. Click **Create deployment** → **Upload assets**
3. Drag the entire folder (or zip it first and upload the zip)
4. Click **Deploy site**

Live in under a minute.

### Option 2 — Git-based (recommended long-term)
1. `git init` in the folder, commit everything
2. Push to a private GitHub repo
3. In Cloudflare Pages → connect to GitHub → select the repo
4. Build command: *(none)* — static files
5. Build output directory: `/`
6. Every push to `main` auto-deploys

## Post-launch checklist

- [ ] Amazon Associate tracking ID applied site-wide
- [ ] Formspree form ID applied
- [ ] Send a test message through the contact form to verify Formspree delivers to your inbox
- [ ] Verify all Amazon links open the right product searches (with your tag in URL)
- [ ] Submit sitemap to Google Search Console (https://search.google.com/search-console)
- [ ] Submit sitemap to Bing Webmaster Tools
- [ ] Set up Cloudflare Web Analytics (free, in CF dashboard) — no JS bloat, GDPR-friendly
- [ ] Add `hello@justaskmajor.com` as an email route in Cloudflare Email Routing (free, forwards to your real inbox)
- [ ] LinkedIn post announcing the site

## Amazon Associates — finding your tracking ID

1. Log in at https://affiliate-program.amazon.com
2. Top right: **Account Settings** → **Manage Your Tracking IDs**
3. Default ID looks like `yourname-20` (US program)
4. If you don't have one yet, create one — name it `justaskmajor-20` or similar

## Formspree setup — 2 minutes

1. Sign up free at https://formspree.io
2. Click **New Form** → name it "justaskmajor contact"
3. Set destination email to `hello@justaskmajor.com` (or wherever you want submissions)
4. Copy the form ID from the endpoint (e.g. `https://formspree.io/f/xyzabc123` → ID is `xyzabc123`)
5. Free tier: 50 submissions/month, which is plenty for now

## Adding more blog posts

Each post is a standalone HTML file in `/blog/`. Copy `smb-it-starter-kit.html` as a template, change content, then add an entry to `/blog/index.html` post list.

Suggested next 3 posts (already teased in blog index):
1. The Three Backup Mistakes I See Every Single Week
2. Microsoft 365 Security Basics — In Plain English
3. Why Your $79 Router Is Your Biggest Security Risk

Each one = another set of affiliate placements + SEO long-tail capture.

## Things deliberately NOT included

- No JavaScript frameworks — keeps load fast, no build step needed
- No tracking pixels — Cloudflare Web Analytics is privacy-friendly and ad-blocker-proof
- No cookie banner — no cookies are set, so no banner needed
- No newsletter signup yet — add later via ConvertKit or Buttondown if list-building becomes a priority
