FROM ruby:3.1

RUN mkdir /conduit
WORKDIR /conduit
COPY Gemfile /conduit/Gemfile
COPY Gemfile.lock /conduit/Gemfile.lock

RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /conduit

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

