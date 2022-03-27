inode(){
echo 'Actualizando los repositorios de Node.js 16.x' 
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt-get install nodejs


}
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ser usado en modo superusuario, 'sudo ./main.sh'" 
   exit 1
fi
echo 'Actualizando listas de repositorios.' 
sudo apt update -y
if ! [ -x "$(command -v git)" ] ; then
  echo 'Error: git no esta instalado, instalandolo.' >&2
  sudo apt install git -y
  
fi
echo 'Instalando dependencias.'
sudo apt-get install git build-essential cmake ffmpeg sqlite3 ttf-mscorefonts-installer libjpeg-dev libwebp-dev libpango1.0-dev libxml2-dev libltdl-dev liblqr-dev fonts-noto-color-emoji -y
echo 'Clonando el repositorio de ImageMagick.' 
git clone https://github.com/ImageMagick/ImageMagick
cd ImageMagick
echo 'Compilando y instalando ImageMagick'
./configure --with-modules
make
sudo make install
sudo ldconfig /usr/local/lib
inode
echo 'Clonando el repositorio de esmbot.'\
cd ~
git clone --recurse-submodules https://github.com/esmBot/esmBot bot
cd bot
npm install
echo 'Configurando fuentes para imagenes.'
sudo cp assets/*.ttf assets/*.otf /usr/local/share/fonts
fc-cache -fv
echo 'Instalando python para el proceso de configuracion del entorno.'
sudo apt install python3

