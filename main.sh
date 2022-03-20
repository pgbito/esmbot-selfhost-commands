# Test
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ser usado en modo superusuario, 'sudo ./main.sh'" 
   exit 1
fi
sudo apt update -y
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git no esta instalado, instalandolo. ' >&2
  sudo apt install git -y
  
fi
echo 'Instalando dependencias.'
sudo apt-get install git build-essential cmake ffmpeg sqlite3 ttf-mscorefonts-installer libjpeg-dev libwebp-dev libpango1.0-dev libxml2-dev libltdl-dev liblqr-dev fonts-noto-color-emoji -y
