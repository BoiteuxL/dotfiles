# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# History
export HISTSIZE=100000
export SAVEHIST=20000
export HISTFILE="$HOME/.cache/zsh/history"

setopt hist_ignore_dups     # do not record an event that was just recorded again
setopt hist_ignore_all_dups # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_space    # do not record an event starting with a space
setopt hist_save_no_dups    # do not write a duplicate event to the history file
setopt inc_append_history   # write to the history file immediately, not when the shell exits
setopt share_history        # share history between terminals

setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -e



zstyle :compinstall filename '/home/loicb/.zshrc'

autoload -Uz compinit
compinit

# basic plugin manager to automatically import zsh plugins
# script by mattmc3 from https://github.com/mattmc3/zsh_unplugged
# clone a plugin, identify its init file, source it, and add it to your fpath
function plugin-load {
	local repo plugdir initfile initfiles=()
	: ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
	for repo in $@; do
		plugdir=$ZPLUGINDIR/${repo:t}
		initfile=$plugdir/${repo:t}.plugin.zsh
		if [[ ! -d $plugdir ]]; then
			echo "Cloning $repo..."
			git clone -q --depth 1 --recursive --shallow-submodules \
				https://github.com/$repo $plugdir
		fi
		if [[ ! -e $initfile ]]; then
			initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
			(( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
			ln -sf $initfiles[1] $initfile
		fi
		fpath+=$plugdir
		(( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile

		clear
	done
}

# list of github repos of plugins
repos=(
	#romkatv/powerlevel10k
	romkatv/zsh-defer
	zsh-users/zsh-autosuggestions
	zdharma-continuum/fast-syntax-highlighting
)
plugin-load $repos

eval "$(starship init zsh)"

# Startup
#fastfetch


# Binds
#bindkey '^[[1;5C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
