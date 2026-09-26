#!/usr/bin/env bash
set -euo pipefail

# Install this repository's user configuration on an Omarchy system.
# Existing files are moved to a dated backup under ~/.local/state/dotfiles-install.

dotfiles_dry_run=false
case "${1:-}" in
  '') ;;
  --dry-run) dotfiles_dry_run=true ;;
  --help|-h)
    printf 'Usage: %s [--dry-run]\n' "${0##*/}"
    exit 0
    ;;
  *)
    printf 'Unknown option: %s\n' "$1" >&2
    exit 2
    ;;
esac
if (( $# > 1 )); then
  printf 'Too many arguments. Usage: %s [--dry-run]\n' "${0##*/}" >&2
  exit 2
fi

dotfiles_repo_dir=$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
dotfiles_home_dir=${HOME:?HOME is not set}
dotfiles_backup_dir=''

say() { printf '%s\n' "$*"; }
die() { printf 'Error: %s\n' "$*" >&2; exit 1; }

require_source() {
  [[ -e "$dotfiles_repo_dir/$1" ]] || die "Missing repository item: $1"
}

backup_existing() {
  local target=$1 relative backup_target
  if $dotfiles_dry_run; then
    say "Would back up: $target"
    return
  fi
  if [[ -z "$dotfiles_backup_dir" ]]; then
    mkdir -p -- "$dotfiles_home_dir/.local/state/dotfiles-install"
    dotfiles_backup_dir=$(mktemp -d -- "$dotfiles_home_dir/.local/state/dotfiles-install/backup.XXXXXXXX")
  fi
  relative=${target#"$dotfiles_home_dir"/}
  backup_target="$dotfiles_backup_dir/$relative"
  mkdir -p -- "$(dirname -- "$backup_target")"
  mv -- "$target" "$backup_target"
  say "Backed up: $target -> $backup_target"
}

link_path() {
  local source="$dotfiles_repo_dir/$1" target="$dotfiles_home_dir/$2"
  if [[ -L "$target" && $(readlink -f -- "$target") == "$source" ]]; then
    say "Already linked: $target"
    return
  fi
  if [[ -e "$target" || -L "$target" ]]; then
    backup_existing "$target"
  fi
  if $dotfiles_dry_run; then
    say "Would link: $target -> $source"
  else
    mkdir -p -- "$(dirname -- "$target")"
    ln -s -- "$source" "$target"
    say "Linked: $target -> $source"
  fi
}

copy_if_absent() {
  local source=$1 target=$2
  if [[ -e "$target" || -L "$target" ]]; then
    say "Keeping existing: $target"
    return
  fi
  [[ -f "$source" ]] || die "Missing file to copy: $source"
  if $dotfiles_dry_run; then
    say "Would copy: $source -> $target"
  else
    mkdir -p -- "$(dirname -- "$target")"
    cp -p -- "$source" "$target"
    say "Copied: $source -> $target"
  fi
}

# Check required repository content before changing the home directory.
for dotfiles_item in \
  .bashrc starship.toml nvim tmux/tmux.conf \
  arch/hypr/autostart.lua arch/hypr/bindings.lua \
  arch/hypr/hyprsunset.conf arch/hypr/input.lua \
  arch/hypr/looknfeel.lua arch/hypr/monitors.lua \
  arch/omarchy/shell.json easyeffects/Fifine.json; do
  require_source "$dotfiles_item"
done

link_path .bashrc .bashrc
link_path starship.toml .config/starship.toml
link_path nvim .config/nvim
link_path tmux/tmux.conf .config/tmux/tmux.conf

# Keep the Hypr directory real so Omarchy can update its stock files.
dotfiles_hypr_dir="$dotfiles_home_dir/.config/hypr"
if [[ -L "$dotfiles_hypr_dir" || ( -e "$dotfiles_hypr_dir" && ! -d "$dotfiles_hypr_dir" ) ]]; then
  backup_existing "$dotfiles_hypr_dir"
fi
if $dotfiles_dry_run; then
  [[ -d "$dotfiles_hypr_dir" && ! -L "$dotfiles_hypr_dir" ]] || say "Would create directory: $dotfiles_hypr_dir"
else
  mkdir -p -- "$dotfiles_hypr_dir"
fi
for dotfiles_stock_file in .luarc.json hyprland.lua xdph.conf; do
  copy_if_absent "/usr/share/omarchy/config/hypr/$dotfiles_stock_file" "$dotfiles_hypr_dir/$dotfiles_stock_file"
done
for dotfiles_override in autostart.lua bindings.lua hyprsunset.conf input.lua looknfeel.lua monitors.lua; do
  link_path "arch/hypr/$dotfiles_override" ".config/hypr/$dotfiles_override"
done

link_path arch/omarchy/shell.json .config/omarchy/shell.json

# This is a saved preset, not a live symlink. Do not overwrite later microphone edits.
copy_if_absent "$dotfiles_repo_dir/easyeffects/Fifine.json" "$dotfiles_home_dir/.local/share/easyeffects/input/Fifine.json"

if [[ -n "$dotfiles_backup_dir" ]]; then
  say "Backups: $dotfiles_backup_dir"
fi
say 'Done. Restart affected applications or log in again to load the new configuration.'
