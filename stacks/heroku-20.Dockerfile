FROM heroku/heroku:20

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN apt-get install -y gcc g++ make automake autoconf m4
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y libssh-dev
RUN apt-get install -y unixodbc-dev
