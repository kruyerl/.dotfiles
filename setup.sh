#update && upgrade
sudo apt update && sudo apt full-upgrade -y

#add repos
sudo add-apt-repository ppa:neovim-ppa/unstable

#install essentials
sudo apt install software-properties-common git unzip curl tmux zsh ranger neovim python3 python3-venv python3-pip -y
sudo snap install lsd

# #set up ssh
# sudo apt install openssh-server -y
# sudo ufw allow ssh
# ssh-keygen -t rsa -b 4096 -C "kruyerl@gmail.com"

#configure git
git config --global user.email "kruyerl@gmail.com"
git config --global user.name "KruyerL"
ssh-keygen -t ed25519 -C "kruyerl@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
echo 'add the above key to github here: https://github.com/settings/keys'
read -p 'push enter to continue'
read gitcontinue

#set up ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
