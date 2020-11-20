# README

Install on archbased linux:

    curl -Lks https://raw.githubusercontent.com/ewok/.cfg/master/.cfg-update/init.sh > init.sh
    bash init.sh

Testing:

    docker run -ti --rm --entrypoint bash archlinux
    > curl -Lks https://raw.githubusercontent.com/ewok/.cfg/master/.cfg-update/init.sh > init.sh
    > bash init.sh
