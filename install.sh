#!/bin/bash

download_file() {
    local url="$1"
    local dest_dir="$2"
    local dest_file="${dest_dir}/$(basename "$url")"

    mkdir -p "$dest_dir" || return 1
    if ! curl -o "$dest_file" -fsSL "$url"; then
        printf "Failed to download %s\n" "$url" >&2
        return 1
    fi
}

main() {
    local tmux_plugin_dir="$HOME/.tmux/plugins/tmux"

    download_file "https://raw.githubusercontent.com/XXpE3/tmux-themes/master/catppuccin.tmux" "$tmux_plugin_dir" || return 1
    download_file "https://raw.githubusercontent.com/XXpE3/tmux-themes/master/catppuccin-mocha.tmuxtheme" "$tmux_plugin_dir" || return 1
}

main "$@"
