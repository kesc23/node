FROM node:slim

RUN apt update && apt-get install -y sudo apt-utils wget gnupg

ARG DEBIAN_FRONTEND=noninteractive

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    sudo apt-get update && \
    sudo apt-get -y -f install google-chrome-stable

RUN sudo apt-get clean && sudo apt-get autoclean

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "node" ]