# Earn2Trade Affiliate Guide — Static Build

Pure HTML/CSS/JS. Host anywhere (Netlify, Vercel, Cloudflare Pages, S3, GitHub Pages, nginx, Apache).

## Quick start

Just serve this folder as a static site. For local preview:

```
npx serve .
# or
python3 -m http.server 8000
```

Open `index.html` and you'll land on slide 1. Use arrow keys / on-screen nav to advance.

## Deep links (IMPORTANT)

Routing is client-side (`/slide1` … `/slide18`). For deep links to work on refresh, your host needs an SPA fallback that serves `index.html` for unknown paths.

- **Netlify**: add a file `_redirects` with:
  ```
  /*  /index.html  200
  ```
- **Vercel**: add `vercel.json`:
  ```json
  { "rewrites": [{ "source": "/(.*)", "destination": "/index.html" }] }
  ```
- **nginx**:
  ```
  location / { try_files $uri /index.html; }
  ```
- **Apache** (`.htaccess`):
  ```
  RewriteEngine On
  RewriteRule ^ index.html [L]
  ```
- **GitHub Pages**: copy `index.html` to `404.html` (works as a fallback).

Without this, the root URL works fine — only refreshing on `/slide5` etc. would 404.

## Hosting under a subpath

This build uses relative asset URLs, so it works at the domain root **or** under any subpath (e.g. `https://example.com/guide/`) with no rebuild needed.

## Files

- `index.html` — entry point
- `assets/` — bundled JS, CSS, logo (hashed filenames for cache-busting)
