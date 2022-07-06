function sourceZshrcFile() {
   source ~/.zshrc
}

# Install Command Line Developer Tools for Xcode
# Homebrew depends on it
xcode-select --install

echo "✅ Command Line Developer Tools for Xcode"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "✅ Homebrew installed"

# Set Tsinghua mirror for Homebrew
cat > .zshrc << EOF
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
EOF

sourceZshrcFile

brew install git
echo "✅ Git installed"

brew install rust
echo "✅ Rust installed"

brew install --cask jetbrains-toolbox
echo "✅ Jetbrains Toolbox installed"

brew install --cask android-studio
echo "✅ Android Studio installed"

brew install cloc
echo "✅ cloc installed"

brew install gh
echo "✅ GitHub cli installed"

brew install java11
echo "✅ Java 11 installed"

brew install --cask google-chrome
echo "✅ Chrome installed"

brew install --cask firefox
echo "✅ Firefox installed"

brew install --cask visual-studio-code
echo "✅ VSCode installed"

brew install --cask notion
echo "✅ Notion installed"

brew install --cask discord
echo "✅ Discord installed"

brew install --cask sublime-text
echo "✅ Sublime Text installed"

brew install --cask macdown
echo "✅ MacDown installed"

brew install --cask iina
echo "✅ IINA installed"

brew install --cask sourcetree
echo "✅ Sourcetree installed"

brew install --cask fork
echo "✅ Fork installed"

brew install --cask clashx
echo "✅ ClashX installed"

brew install ffmpeg
echo "✅ FFmpeg installed"

brew install yt-dlp/taps/yt-dlp
echo "✅ yt-dlp installed"

brew tap PotatoLabs/homebrew-git-redate
brew install git-redate
echo "✅ git-redate installed"

brew install docker
echo "✅ docker installed"

# Customize Git
cat > .zshrc << EOF
# To include the branch name in the prompt on the right side
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# To fix "too many open files" error
ulimit -n 1024
EOF

echo "✅ Git customized"

# Enable vi syntax colors and highlighting
cat > .vimrc << EOF
syntax on
colorscheme desert
EOF

git config --global user.name "tonnyl"
git config --global user.email "lizhaotailang@gmail.com"
echo "✅ Configure Git succeeded"

# Set environment arguments
cat > .zshrc << EOF
export PATH="$HOME/.cargo/bin:$PATH"
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
EOF

# Reload zsh config
sourceZshrcFile