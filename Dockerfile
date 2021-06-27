FROM ruby:2.5.8
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /reserve_app
WORKDIR /reserve_app
COPY Gemfile /reserve_app/Gemfile
COPY Gemfile.lock /reserve_app/Gemfile.lock
RUN bundle install
COPY . /reserve_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
# CMD [RAILS_ENV=production rails server ]
