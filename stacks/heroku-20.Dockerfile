FROM heroku/heroku:20-build

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y unixodbc-dev
