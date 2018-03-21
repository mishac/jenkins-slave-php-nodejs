FROM jenkinsci/slave
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -yqqm \
    curl \
    wget \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    git
RUN wget -O- https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN \
  apt-get update -yqq && \
  apt-get install -yqqm \
  vim \
  locales \
  php7.2-fpm \
  php7.2-mysql \
  php7.2-gd \
  php7.2-imagick \
  php7.2-dev \
  php7.2-curl \
  php7.2-opcache \
  php7.2-cli \
  php7.2-sqlite \
  php7.2-intl \
  php7.2-tidy \
  php7.2-imap \
  php7.2-json \
  php7.2-pspell \
  php7.2-recode \
  php7.2-common \
  php7.2-sybase \
  php7.2-sqlite3 \
  php7.2-bz2 \
  php7.2-common \
  php7.2-memcached \
  php7.2-redis \
  php7.2-xml \
  php7.2-shmop \
  php7.2-mbstring \
  php7.2-zip \
  php7.2-soap

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://deb.nodesource.com/setup_9.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install nodejs yarn -yqq

RUN chown -R jenkins:jenkins /home/jenkins/.composer

USER jenkins

ENV PATH /home/jenkins/.composer/vendor/bin:$PATH

RUN composer global require \
    phpunit/phpunit \
    drupal/coder \
    dealerdirect/phpcodesniffer-composer-installer \
    phploc/phploc \
    pdepend/pdepend \
    phpmd/phpmd \
    sebastian/phpcpd \
    phing/phing \
    --no-progress --no-scripts --no-interaction
