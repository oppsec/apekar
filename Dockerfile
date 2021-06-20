# Install alpine and ruby
FROM ruby:latest
LABEL maintainer="oppsec <https://oppsec.github.io>"
RUN gem install bundler colorize

WORKDIR /apekar
COPY . .

CMD ["ruby", "main.rb"]