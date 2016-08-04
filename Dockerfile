FROM fluent/fluentd:latest-onbuild

USER root
RUN apk --no-cache --update add \
                            build-base \
                            ruby-dev && \
    gem install bson_ext fluent-plugin-mongo fluent-plugin-s3 && \
    apk del build-base ruby-dev && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*
USER fluent
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.2.0/bin:$PATH
CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
