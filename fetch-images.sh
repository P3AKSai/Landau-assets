#!/usr/bin/env bash
# Downloads Landau & Company's images (from their current Wix site) into public/img
# during the Render build. Images already committed to public/img are kept as-is,
# so once you commit them the site no longer depends on Wix at all.
set -euo pipefail
cd "$(dirname "$0")"
ok=0; skip=0
while read -r name url; do
  [ -z "${name:-}" ] && continue
  out="public/img/$name"
  mkdir -p "$(dirname "$out")"
  if [ -s "$out" ]; then skip=$((skip+1)); continue; fi
  curl -fsSL --retry 3 -H "Accept: */*" -o "$out" "$url"
  [ -s "$out" ] || { echo "Empty download: $name" >&2; exit 1; }
  ok=$((ok+1))
done < image-list.txt
echo "Images downloaded: $ok, already present: $skip"
# simple gallery page to check everything at a glance
{
  echo '<!doctype html><meta charset="utf-8"><title>Landau assets</title>'
  echo '<style>body{font:14px system-ui;background:#18212d;color:#fff;margin:24px}div{display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:12px}figure{margin:0;background:#2e3b4d;padding:10px;border-radius:10px}img{width:100%;height:150px;object-fit:contain;background:#fff3}figcaption{margin-top:6px;word-break:break-all;opacity:.8}</style>'
  echo '<h1>Landau &amp; Company image assets</h1><div>'
  while read -r name url; do [ -n "${name:-}" ] && echo "<figure><img src=\"img/$name\" loading=\"lazy\"><figcaption>/img/$name</figcaption></figure>"; done < image-list.txt
  echo '</div>'
} > public/index.html
