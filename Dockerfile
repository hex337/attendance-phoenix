FROM elixir:1.5
MAINTAINER Alex Kleissner

#RUN apt-get update && apt-get install --yes postgresql-client nodejs npm inotify-tools

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y sudo wget curl inotify-tools git build-essential zip unzip postgresql-client

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && apt-get install -y nodejs

ADD . /app

RUN mix local.hex --force && mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

WORKDIR /app
EXPOSE 4000
CMD ["./run.sh"]
#CMD ["mix", "do", "ecto.migrate", "phx.server"]
