#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

if ! command -v brew &>/dev/null; then
  echo -e "${RED}Error:${NC} Homebrew is not installed."
  echo "Install it from https://brew.sh"
  exit 1
fi

packages=(fnm fzf lazygit starship tmux direnv go)

echo "Installing brew packages..."
echo ""

for package in "${packages[@]}"; do
  if brew list "$package" &>/dev/null; then
    echo -e "  ${YELLOW}✓${NC} $package (already installed)"
  else
    echo -e "  ${GREEN}⟳${NC} Installing $package..."
    brew install "$package"
  fi
done

echo ""
echo -e "${GREEN}Done.${NC}"
