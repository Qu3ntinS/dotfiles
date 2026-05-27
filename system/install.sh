#!/bin/bash
# Install system files that can't be managed by stow (require root).
# Run once after cloning dotfiles, or after system reinstall.
#
# Usage: bash system/install.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing PAM helper for fingerprint toggle..."
sudo install -m 755 "$SCRIPT_DIR/usr/local/bin/omarchy-fingerprint-pam-toggle" \
  /usr/local/bin/omarchy-fingerprint-pam-toggle

echo "Installing sudoers rule for fingerprint toggle..."
sudo install -m 440 "$SCRIPT_DIR/etc/sudoers.d/fingerprint-toggle" \
  /etc/sudoers.d/fingerprint-toggle

# Validate sudoers syntax
sudo visudo -c -f /etc/sudoers.d/fingerprint-toggle

echo "Done. Run 'stow scripts' from ~/dotfiles to link ~/.local/bin/ scripts."
