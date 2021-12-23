#! /bin/bash
clear

echo -e "moving all of the pre-configured files to their correct locations"
mv ./root/.profile ~/.profile

# set up terminal
sudo apt install dconf-cli
mkdir -p ~/code/external
cd ~/code/external
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

sudo apt-add-repository ppa:rodsmith/refind
sudo apt update
sudo apt upgrade

mkdir ~/.tmp
sudo mkdir -p /usr/local/opt

cd ~/.tmp
firefox_name="firefox_latest.tar.bz2"
curl -o $firefox_name -L "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
sudo cp -rp $firefox_name /usr/local/opt
cd /usr/local/opt
sudo tar xjf $firefox_name
sudo rm -rf /usr/local/opt/$firefox_name
sudo chown -R $USER /usr/local/opt/firefox
echo 'export PATH=/usr/local/opt/firefox/firefox:$PATH' >> ~/.profile
cat > ~/.local/share/applications/firefoxDeveloperEdition.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Firefox Developer Edition
Exec=/usr/local/opt/firefox/firefox
Icon=/usr/local/opt/firefox/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;Favorite;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp; X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognitos;
EOL
cd ~/

sudo apt -y install refind snapd

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/writebetacode/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install \
    git \
    go \
    nvm \
    clang-format \
    protobuf \
    golangci-lint \
    cocoapods \
    neovim \
    direnv

brew install --cask kitty
brew install --cask brave-browser
brew install --cask google-chrome
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask beekeeper-studio
brew install --cask postman
brew install --cask signal
brew install --cask flutter
brew install --cask android-studio
brew install --cask spotify

echo -e "grabbing the command line utility that will enable me to upgrade go mod dependencies\n"
go install github.com/oligot/go-mod-upgrade@latest

# install docker
# sudo apt -y install \
#   apt-transport-https \
#   ca-certificates \
#   curl \
#   gnupg \
#   lsb-release
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo \
#   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt update
# sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose

# sudo usermod -aG docker $USER

source ~/.profile

# Update apt and install
sudo snap install beekeeper-studio

echo -e "creating the ~/.nvm folder\n"
mkdir ~/.nvm

echo -e "telling flutter to not collect information for the use of the tool...\n"
flutter config --no-analytics
