FROM jenkinsci/slave

ARG uid=1000
ARG gid=1000

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN groupmod -g ${gid} jenkins
RUN usermod -u ${uid} -g ${gid} jenkins

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
  php7.1-fpm \
  php7.1-mysql \
  php7.1-gd \
  php7.1-imagick \
  php7.1-dev \
  php7.1-curl \
  php7.1-opcache \
  php7.1-cli \
  php7.1-sqlite \
  php7.1-intl \
  php7.1-tidy \
  php7.1-imap \
  php7.1-json \
  php7.1-pspell \
  php7.1-recode \
  php7.1-common \
  php7.1-sybase \
  php7.1-sqlite3 \
  php7.1-bz2 \
  php7.1-common \
  php7.1-memcached \
  php7.1-redis \
  php7.1-xml \
  php7.1-shmop \
  php7.1-mbstring \
  php7.1-zip \
  php7.1-soap

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://deb.nodesource.com/setup_9.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install nodejs yarn -yqq

RUN chown -R jenkins:jenkins /home/jenkins/.composer

RUN wget http://phpdox.de/releases/phpdox.phar \
    && chmod +x phpdox.phar \
    && mv phpdox.phar /usr/local/bin/phpdox

USER jenkins

ENV PATH /home/jenkins/.composer/vendor/bin:$PATH

RUN composer global require \
    phpunit/phpunit \
    phploc/phploc \
    pdepend/pdepend \
    phpmd/phpmd \
    sebastian/phpcpd \
    phing/phing \
    squizlabs/PHP_CodeSniffer \
    jakub-onderka/php-parallel-lint
    --no-progress --no-scripts --no-interaction
