git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#create symlinks to dotfiles
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.config/alacritty
rm -rf ~/.config/nvim
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

#set up node
curl -fsSL https://fnm.vercel.app/install | bash --skip-shell
source ~/.zshrc
fnm list-remote
echo which version would you like to install?
read nodevinput
fnm install $nodevinput


npm install -g parcel-bundler

# finish, clean up & source
sudo apt autoremove && sudo apt autoclean
source ~/.zshrc
