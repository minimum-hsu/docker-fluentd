FROM fluent/fluentd:v1.2

LABEL maintainer s5550055@yahoo.com.tw

RUN apk add --no-cache --virtual build-deps build-base ruby-dev \
  && fluent-gem install fluent-plugin-slack fluent-plugin-copy_ex fluent-plugin-aws-elasticsearch-service fluent-plugin-kinesis \
  && apk del build-deps \
  && gem source --clear-all \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem /var/cache/apk/*

