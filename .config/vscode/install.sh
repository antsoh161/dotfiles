#!/usr/bin/env bash
# Symlink settings/keybindings into Code - OSS and install extensions.
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
user_dir="${XDG_CONFIG_HOME:-$HOME/.config}/Code - OSS/User"
code_bin="$(command -v code-oss || command -v code)"

mkdir -p "$user_dir"
for f in settings.json keybindings.json; do
	target="$user_dir/$f"
	if [ -e "$target" ] && [ ! -L "$target" ]; then
		echo "Backing up existing $f -> $f.bak"
		mv "$target" "$target.bak"
	fi
	ln -sfn "$here/$f" "$target"
done

installed="$("$code_bin" --list-extensions | tr '[:upper:]' '[:lower:]')"
sed -e 's/#.*//' -e 's/[[:space:]]//g' "$here/extensions.txt" | while read -r ext; do
	[ -z "$ext" ] && continue
	if grep -qx "${ext,,}" <<<"$installed"; then
		echo "already installed: $ext"
	else
		"$code_bin" --install-extension "$ext"
	fi
done
