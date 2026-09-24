# landau-assets

Static image hosting on Render for the Landau & Company GHL website.
The GHL pages load images from `https://landau-assets.onrender.com/img/...`.

## Deploy (one time, ~5 minutes)
1. Create a new GitHub repo named `landau-assets` and upload everything in this folder.
2. In Render: **New + → Blueprint**, pick the repo. Render reads `render.yaml` and creates a
   free Static Site called `landau-assets`. (Or: New + → Static Site, Build Command
   `bash fetch-images.sh`, Publish Directory `public`.)
3. When the deploy finishes, open the site URL. You should see a gallery of all 28 images.

If Render gives you a different URL (e.g. `landau-assets-xyz.onrender.com`), send it over and the
HTML pages get rebuilt with that address. Adding a custom domain (e.g. `assets.landaumarketing.com`)
in Render works too.

## Removing the Wix dependency
The build downloads the images from Wix. To make the repo fully standalone, download the
`public/img` folder once (run `bash fetch-images.sh` locally, or grab the files from the
deployed site) and commit it. The script skips any image that is already in the repo.

## Swapping an image
Replace the file in `public/img/` with the same name and push — Render redeploys automatically.
