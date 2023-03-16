FROM twilio/twilio-cli:5.4.1

ARG TWILIO_ACCOUNT_SID=ACxxxx
ARG TWILIO_AUTH_TOKEN=xxxxx

RUN twilio plugins:install @twilio-labs/plugin-flex@6.0.1
RUN twilio autocomplete bash --refresh-cache && printf "$(twilio autocomplete:script bash)" >> ~/.bashrc
COPY . /plugin-docker-test

#my method on creating a login by default. Not sure if it is scure or not. 
ADD /config.json /root/.twilio-cli
WORKDIR /plugin-docker-test
RUN npm install

EXPOSE 3000
# WORK
# CMD ["twilio", "flex:plugins:start"]