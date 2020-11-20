# README

Install on archbased linux:

    curl -Lks https://raw.githubusercontent.com/ewok/.cfg/master/.cfg-update/init.sh > init.sh
    bash init.sh

Testing:

    Rought test via docker. A lot of things don't work due to docker limitations.

    docker run -ti --rm --entrypoint bash archlinux
    > curl -Lks https://raw.githubusercontent.com/ewok/.cfg/master/.cfg-update/init.sh > init.sh
    > bash init.sh


