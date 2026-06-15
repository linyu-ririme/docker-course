FROM docker:git

WORKDIR /usr/src/app

COPY builder.sh /usr/local/bin/builder.sh
RUN chmod +x /usr/local/bin/builder.sh

ENTRYPOINT ["builder.sh"]
