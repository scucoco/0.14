FROM node:5
RUN npm install -g mathoid
RUN npm install -g mocha
WORKDIR /usr/local/lib/node_modules/mathoid/
RUN cp config.dev.yaml config.yaml

RUN sed -i 's/speechOn: true/speechOn: false/g' config.yaml
RUN sed -i 's/png: true/png: false/g' config.yaml
RUN sed -i 's/speakText: true/speakText: false/g' config.yaml

ADD ./kickstart.sh /kickstart.sh
RUN chmod +x /kickstart.sh

EXPOSE 10044
CMD ["/kickstart.sh"]
