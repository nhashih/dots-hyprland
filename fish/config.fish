if status is-interactive
	set -gx LV_BRANCH release-1.4/neovim-0.9
  fastfetch
end


set fish_greeting

# Web Development
alias bi="bun install"
alias bd="bun run dev"
alias bp="bun run preview"
alias bb="bun run build"
alias bl="bun run lint"

# System
alias sp="systemctl suspend"
alias l="ls -lah"

fish_add_path ~/.local/bin

set -Ux PATH $HOME/.bun/bin $PATH
