# Setup homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add binaries to PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# This is where uv stores python versions
export PATH="/Users/ryan/.local/bin:$PATH"

# ZVM to manage zig versions
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"

# Add postgresql@16 to PATH
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# For compilers to find postgresql@16 you may need to set
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="/Users/ryanhutchison/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

# Ensure ~/utilities exists
if [ ! -d "$HOME/utilities" ]; then
  mkdir -p "$HOME/utilities"
fi

# Add ~/utilities to PATH if not already included
case ":$PATH:" in
  *":$HOME/utilities:"*) ;;
  *) export PATH="$HOME/utilities:$PATH" ;;
esac

# Add linkerd cli tool to path
export PATH=$HOME/.linkerd2/bin:$PATH
