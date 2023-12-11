
#File2

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#set up node
curl -fsSL https://fnm.vercel.app/install | bash --skip-shell
source ~/.zshrc
fnm list-remote
echo which version would you like to install?
read nodevinput
fnm install $nodevinput

npm install -g parcel-bundler

sudo apt autoremove && sudo apt autoclean
source ~/.zshrc
