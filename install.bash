#!/bin/bash


function os_detect(){
    if command -v apt >/dev/null 2>&1; then
        echo "apt"
    else
        echo " Unknown Package Manager, Exiting..."
        exit 1
    fi
}

function dash_mark(){ 
    echo -e "⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯"
}

function hash_mark(){       
    echo -e "\n [•] $1\n  ⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺"
}

function print_logo(){
    echo -e " ┌─────────────────────────────┐\n │     EVERFOREST OVERHAUL     │\n └─────────────────────────────┘"
}

function update_pkg(){
    echo -e " Updating ... "
    sudo apt update -y
    echo -e " Upgrading ... "
    sudo apt upgrade -y
    dash_mark
}

function install_pkg(){
    if [[ "$2" = "1" ]]; then
        echo -e " Auto-installing $1...\n"
        if [[ "$3" = "1" ]]; then
            echo -e " Installing $1...\n"
            $1
        else
            sudo apt install -y $1
        fi
    else
        echo -e " Install $1? (y/n)"
        read iOne
        if [[ "$iOne" = "y" || "$iOne" = "yes" ]]; then
            if [[ "$3" = "1" ]]; then
                echo -e " Installing $1 ...\n"
                $1
            else
                echo -e " Installing $1 ...\n"
                sudo apt install -y $1
            fi
        else
            echo -e " Skipped $1!\n"
        fi
    fi
    dash_mark
}

function alacritty(){
    curl https://sh.rustup.rs -sSf -y | sh
    cargo install alacritty
    sudo mv ~/.cargo/bin/alacritty /usr/local/bin/
    . "$HOME/.cargo/env" >> ~/.bashrc
    export PATH=$HOME/.cargo/bin:$PATH >> ~/.bashrc
}

function ohmyposh(){
    sudo curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin
    eval "$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/everforest_dark.omp.json)" >> ~/.bashrc
    source ~/.bashrc
}

function polybar(){
    git clone --recursive https://github.com/polybar/polybar
    cd polybar
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)
    sudo make install
    cd ../../
    sudo rm -rf polybar
}

function rofi(){
    echo -e " Installing ROFI dependencies ..."
    sudo apt-get install libstartup-notification0-dev libxcb-xinerama0-dev libxcb-keysyms1-dev check
    echo -e " Installing ROFI from Source ..."
    wget https://github.com/davatorium/rofi/releases/download/1.7.8/rofi-1.7.8.tar.gz
    tar -xzvf rofi-1.7.8.tar.gz
    cd rofi-1.7.8
    mkdir build
    cd build
    ../configure
    sudo make install
    cd ../../
    sudo rm -rf rofi-1.7.8
    sudo rm -rf rofi-1.7.8.tar.gz
}

function move_dirs(){
    dirs=(themes icons fonts)
    for dir in ${dirs[@]}; do
        echo -e " Moving: $dir --> /usr/share"
        sudo cp -r $dir /usr/share
    done

    if [ ! -d "$HOME/.config" ]; then
        echo -e " Creating directory: $HOME/.config"
        mkdir -p "$HOME/.config"
    fi 
       
    echo -e " Moving: .config --> $HOME"
    cp -r .config "$HOME"
    
    echo -e " Moving: Wallpaper --> $HOME/Pictures/"
    cp -r Wallpaper "$HOME/Pictures"
    
    mozilla_current_dir=".mozilla/firefox/default-release/chrome/userChrome.css"
    mozilla_final_dir="$(find $HOME/.mozilla/firefox -type d -path "*default-release")/chrome"
    
    echo -e " Moving: $mozilla_current_dir --> $mozilla_final_dir"
    cp -r $mozilla_current_dir $mozilla_final_dir
}

function install_wallpapers(){
    cd $HOME/Pictures/Wallpaper
    sh install_wallpapers.sh
}

function install_manager(){
    base_dir=pwd;
    iType=0
    os=$(os_detect);
    if [ "$os" = "apt" ]; then
        print_logo

        echo -e " Install all packages? (y/n)"
        read iAll
        if [[ "$iAll" = "y" || "$iAll" = "yes" ]]; then
            iType=1
        fi

        update_pkg
        hash_mark " UPDATING AND UPGRADING"
        
        hash_mark " INSTALLING DEPENDENCIES"
        install_pkg "git" "$iType"
        install_pkg "curl" "$iType"
        install_pkg "wget" "$iType"
        install_pkg "build-essential" "$iType"
        install_pkg "cmake" "$iType"
        install_pkg "cmake-data" "$iType"
        install_pkg "pkg-config" "$iType"
        install_pkg "python3-sphinx" "$iType"
        install_pkg "python3-packaging" "$iType"
        install_pkg "libuv1-dev" "$iType"
        install_pkg "libcairo2-dev" "$iType"
        install_pkg "libxcb1-dev" "$iType"
        install_pkg "libxcb-util0-dev" "$iType"
        install_pkg "libxcb-randr0-dev" "$iType"
        install_pkg "libxcb-composite0-dev" "$iType"
        install_pkg "python3-xcbgen" "$iType"
        install_pkg "xcb-proto" "$iType"
        install_pkg "libxcb-image0-dev" "$iType"
        install_pkg "libxcb-ewmh-dev" "$iType"
        install_pkg "libxcb-icccm4-dev" "$iType"
        install_pkg "libxcb-xkb-dev" "$iType"
        install_pkg "libxcb-xrm-dev" "$iType"
        install_pkg "libxcb-cursor-dev" "$iType"
        install_pkg "libcurl4-openssl-dev" "$iType"
        install_pkg "libnl-genl-3-dev" "$iType"
        install_pkg "ninja-build" "$iType"
        install_pkg "libssl-dev" "$iType"
        install_pkg "libffi-dev" "$iType"
        install_pkg "libxml2-dev" "$iType"
        install_pkg "libxslt-dev" "$iType"
        install_pkg "libbz2-dev" "$iType"
        install_pkg "zlib1g-dev" "$iType"
        install_pkg "liblzma-dev" "$iType"
        install_pkg "python3" "$iType"
        install_pkg "python3-pip" "$iType"
        install_pkg "python3-venv" "$iType"
        install_pkg "python3-dev" "$iType"
        install_pkg "gdb" "$iType"
        install_pkg "clang" "$iType"
        install_pkg "clang-format" "$iType"
        install_pkg "tar" "$iType"
        install_pkg "zip" "$iType"
        install_pkg "unzip" "$iType"
        install_pkg "p7zip-full" "$iType"
        install_pkg "p7zip-rar" "$iType"
        install_pkg "rar" "$iType"
        install_pkg "unrar" "$iType"
        install_pkg "mesa-utils" "$iType"
        install_pkg "feh" "$iType"
        install_pkg "maim" "$iType"
        install_pkg "xclip" "$iType"
        install_pkg "lxappearance" "$iType"

        hash_mark " INSTALLING APPS --> PACKAGE MANAGER"
        install_pkg "btop" "$iType"
        install_pkg "dunst" "$iType"
        install_pkg "firefox" "$iType"
        install_pkg "nemo" "$iType"
        install_pkg "i3-wm" "$iType"
        install_pkg "neofetch" "$iType"
        install_pkg "picom" "$iType"

        hash_mark " INSTALLING APPS --> SOURCE"
        install_pkg "alacritty" "$iType" "1"
        install_pkg "ohmyposh" "$iType" "1"
        install_pkg "polybar" "$iType" "1"
        install_pkg "rofi" "$iType" "1"

        hash_mark " MOVING DIRECTORIES"
        move_dirs
        
        print_logo
        hash_mark " DONE !"
    fi
}

install_manager
