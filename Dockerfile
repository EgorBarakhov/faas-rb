FROM ruby:3.2.2-alpine
RUN apk add --update --no-cache \
  build-base \
  gcompat \
  postgresql-dev \
  libpq-dev \
  git \
  imagemagick \
  tzdata

ARG BUNDLE_WITH
ENV BUNDLE_WITH ${BUNDLE_WITH}

RUN gem install bundler:$BUNDLER_VERSION

WORKDIR /app
COPY . /app/

RUN bundle install -j4 --retry 3 \
  # Remove unneeded files (cached *.gem, *.o, *.c)
  && rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

ADD ./entrypoint.sh /entrypoint.sh

ARG FAAS_RB__DEFAULT_FUNC_TIMEOUT
ENV FAAS_RB__DEFAULT_FUNC_TIMEOUT ${FAAS_RB__DEFAULT_FUNC_TIMEOUT}

EXPOSE 8080

ENTRYPOINT [“entrypoint.sh”]
