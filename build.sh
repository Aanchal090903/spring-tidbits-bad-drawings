#!/usr/bin/env bash
set -e

echo "→ Installing Hugo extended 0.152.2 (Vercel already ships this, we just symlink)"
# Vercel already has extended Hugo v0.152.2 in PATH for static-build
# If not found, download portable binary (no sudo needed)
if ! command -v hugo &> /dev/null; then
  echo "→ Hugo not found in PATH, downloading portable extended binary..."
  curl -L https://github.com/gohugoio/hugo/releases/download/v0.152.2/hugo_extended_0.152.2_linux-amd64.tar.gz \
    | tar -xz -C /tmp
  chmod +x /tmp/hugo
  export PATH="/tmp:$PATH"
fi

echo "→ Building site with Hugo"
hugo --gc --minify

echo "→ Build complete! Public folder ready"
