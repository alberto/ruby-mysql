FROM ruby:2.4.1

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Use unicode
RUN locale-gen C.UTF-8 || true
ENV LANG=C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        build-essential patch ruby-dev zlib1g-dev liblzma-dev \
        nodejs \
        mysql-client libmysqlclient-dev libpq-dev \
        libc6-dev libicu-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
