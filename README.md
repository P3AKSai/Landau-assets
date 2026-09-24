# Landau & Company website (Render static site)

Full website for Landau & Company Marketing Services, hosted on Render.

- Pages: `public/index.html`, `company.html`, `services.html`, `clients.html`,
  `testimonials.html`, `resources.html`, `contact.html` (clean URLs like `/company` via `render.yaml` rewrites)
- Images: `public/img/` — downloaded from the old Wix site at build time by `fetch-images.sh`
  (anything already committed to `public/img` is kept). Image gallery: `/assets.html`
- Contact form: GoHighLevel/LeadConnector form embedded on Home, Services and Contact.

Any push to `main` redeploys automatically.

## Custom domain
Render dashboard → landau-assets → Settings → Custom Domains → add `landaumarketing.com`
and `www.landaumarketing.com`, then set the DNS records Render shows at the domain registrar.
