# Setup homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add binaries to PATH
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Add postgresql@16 to PATH
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# For compilers to find postgresql@16 you may need to set
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
