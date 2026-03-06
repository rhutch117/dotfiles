source $ZDOTDIR/envvars

# Navigation
setopt AUTO_CD                   # Go to folder path without using cd.

# Directory Stacking
setopt AUTO_PUSHD                # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS         # Do not store duplicates in the stack.
setopt PUSHD_SILENT              # Do not print the directory stack after pushd or popd.
source $ZDOTDIR/bd.zsh           # View recent dirs with `d`
source $ZDOTDIR/z.sh             # Quickly jump to 'frecent' dirs


# HISTORY
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.


# ALIASES & FUNCTIONS
source $ZDOTDIR/aliases
source $ZDOTDIR/functions.sh

# VI KEYMAP
# Vi Mode
bindkey -v
export KEYTIMEOUT=1   # 10ms from time <ESC> is pressed, to be back in normal mode

# Navigate completion menu - Vim style
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Add Vim text-objects for brackets & quotes to Vi mode
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done


# HIGHLIGHTING & COMPLETIONS
source $ZDOTDIR/completion.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Change the autocomplete text color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7b8496"

autoload -U +X bashcompinit && bashcompinit
autoload -Uz +X compinit && compinit
_comp_options+=(globdots) # with hidden files

export PATH="$HOME/.local/bin:$PATH"
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION=us-gov-west-1
export AWS_PROFILE=bedrock
export ANTHROPIC_MODEL='arn:aws-us-gov:bedrock:us-gov-west-1:125005550194:inference-profile/us-gov.anthropic.claude-sonnet-4-5-20250929-v1:0'

eval "$(starship init zsh)"
