FROM node:10.16.0-alpine
LABEL author="Samuel Ramon <samuelrbo@gmail.com>"

USER root

WORKDIR /app

RUN npm -g install sails
RUN npm -g install grunt-cli

# RUN apk add --update alpine-sdk; apk add build-base
RUN apk add --no-cache git

RUN git clone https://github.com/Ymple/ymple-ecommerce.git /app

ENV NODE_PATH=/app/node_modules
ENV PATH=$NODE_PATH/.bin:$PATH

RUN npm install

# Default ymple port
EXPOSE 1338

VOLUME [ "/app" ]

CMD [ "node", "app.js" ]
