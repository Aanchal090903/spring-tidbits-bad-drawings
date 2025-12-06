#!/bin/bash
set -e

# Install Hugo extended if not present (Vercel has it, but safe)
if ! command -v hugo &> /dev/null; then
  curl -sL https://github.com/gohugoio/hugo/releases/download/v0.152.2/hugo_extended_0.152.2_linux-amd64.tar.gz | tar -xz -C /tmp
  sudo mv /tmp/hugo /usr/local/bin/hugo
fi

# Update submodules for Ananke theme
git submodule update --init --recursive

# Build the site
hugo --gc --minify

# Output success
echo "Hugo build complete. Public dir ready."
