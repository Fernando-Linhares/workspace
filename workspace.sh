#!/bin/sh

init()
{
    sudo apt update && sudo apt upgrade
}

install_if_not_exists(){
    if ! command -v $1
    then
        sudo apt install $1 -y
    fi
    echo "ja instalado ($@)"
}

install_snap()
{
    if ! command -v $1
    then
        sudo snap install $1 --classic
    fi
    echo "ja instalado ($@)"

}

end(){
    sudo apt autoremove
    echo 'good bye'
}

init
install_if_not_exists git
install_if_not_exists php8.0
install_if_not_exists mysql
install_if_not_exists composer
install_if_not_exists php-mysql
install_if_not_exists docker.io
install_if_not_exists docker-compose
install_snap chrome
install_snap insomnia
install_snap sublime-text
end