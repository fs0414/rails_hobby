FROM ruby:3.2.2-alpine3.18

RUN apk update -qq && apk add gcompat libpq-dev nodejs vim g++ make

WORKDIR /workspace

COPY ../ ../

RUN gem install bundler -v 2.4.19
RUN bundle install

CMD [ "rails", "s", "-b", "0.0.0.0" ]