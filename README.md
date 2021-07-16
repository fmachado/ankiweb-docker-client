# ankiweb-docker-client
Containirized AnkiWeb Linux client (from https://ankiweb.net/).

# How to run
- Pull the image: `docker pull fmac/ankiweb-docker-client` ;
- Create a directory on the `host` side to persist your Decks, Cards and configuration: `mkdir $PWD/anki-data`;
- Run the container: `docker run -it -v $PWD/anki-data:/root/.local/share/Anki2 -v /tmp/.X11-unix:/tmp/.X11-unix fmac/ankiweb-docker-client`
