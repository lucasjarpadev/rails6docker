FROM ruby:3.0.0-alpine3.12
RUN apk add --update --no-cache \
yarn \
build-base \
postgresql-dev \
tzdata \
&& rm -rf /var/cache/apk/*

WORKDIR ./home/homeland/railsapp

COPY Gemfile* ./

RUN bundle install 

COPY . .

EXPOSE 3000


CMD ["bin/rails","s","-b","0.0.0.0"]
