#!/bin/sh

echo "Installing Linux (Debian amd64)...."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update -y
sudo apt install apt-transport-https ufw fish apache2 php sublime-text xfce4 xarchiver wine firefox-esr mesa-utils git xfce4-goodies pv nmap nano apt-utils dialog terminator autocutsel dbus-x11 dbus neofetch perl p7zip unzip zip curl tar git python3 python3-pip net-tools openssl tigervnc-standalone-server tigervnc-xorg-extension -y
export HOME="$(pwd)"
export DISPLAY=":0"
cd $HOME
sudo mkdir ~/.vnc
if [ ! -d ~/.config ] then
  sudo mkdir ~/.config
fi
if [ ! -d ~/.config/fish ]
  sudo mkdir ~/.config/fish
fi
echo "set fish_greeting" > ~/.config/fish/config.fish
chmod -R 777 ~/.config
sudo printf '#!/bin/bash\ndbus-launch &> /dev/null\nautocutsel -fork\nxfce4-session\n' > ~/.vnc/xstartup
wget -O startvps.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Debian_VPS_Google_Shell/main/startvps.sh"
wget -O setupPS.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Debian_VPS_Google_Shell/main/setupPS.sh"
wget -O apache2.conf "https://raw.githubusercontent.com/KhanhNguyen9872/Debian_VPS_Google_Shell/main/apache2.conf"
wget -O vscode.deb "https://github.com/KhanhNguyen9872/Debian_VPS_Google_Shell/blob/main/app/vscode_1.66.1_amd64.deb?raw=true"
sudo mv ./startvps.sh /bin/startvps
sudo rm -rf ~/.bashrc
sudo mv ./setupPS.sh ~/.bashrc
sudo rm -f /bin/wine
sudo ln -s /etc/alternatives/wine64 /bin/wine
sudo mv ./apache2.conf /etc/apache2/apache2.conf
cat > "${HOME}/wine64_explorer.desktop" <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=wine64 explorer
Comment=Run exe on Linux
Exec=/bin/wine64 explorer.exe
Icon=
Path=
Terminal=false
StartupNotify=false
EOL
sudo chmod 777 ${HOME}/wine64_explorer.desktop
sudo chmod 777 -R ~/.vnc
sudo chmod 777 ~/.bashrc
sudo chmod 777 /bin/startvps
sudo chmod 777 /bin/wine
sudo chmod 777 /etc/apache2/apache2.conf
dpkg -i vscode.deb
rm -rf ./vscode.deb
sudo apt update -y
sudo apt autoremove -y
if [ ! -d /usr/share/themes/Windows-10-Dark-master ] then
  cd /usr/share/themes/
  wget -O Windows-10-Dark-master.zip "https://github.com/KhanhNguyen9872/Debian_VPS_Google_Shell/blob/main/app/Windows-10-Dark-master.zip?raw=true" 2> /dev/null
  unzip -qq Windows-10-Dark-master.zip
  rm -f Windows-10-Dark-master.zip
fi
cd $HOME