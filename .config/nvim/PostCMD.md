### Brew
brew install watchman ripgrep jq fd
### Github
brew install gh

### Git
brew install gpg2 gnupg pinentry-mac
brew install git-delta
```
git config --global push.autoSetupRemote true
git config --global commit.gpgsign true
git config --global user.signingkey F2C7AB29
git config --global init.defaultBranch main
```
### Before use gpg
export GPG_TTY=$(tty)

## Rust Graph
brew install graphviz

## neovim on platrom
### PIP
pip3 install neovim

### Ruby
gem install neovim

### Node.js
yarn global add neovim



### cmd
brew install bat fzf exa
set rtp+=/opt/homebrew/opt/fzf
