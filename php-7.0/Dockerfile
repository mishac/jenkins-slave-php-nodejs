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
RUN wget -O- https://packages.sury.org/php/apt.gpg | apt-key add - \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt-get update -yqq \
    && apt-get install -yqqm \
    vim \
    locales \
    libpng-dev \
    php7.0-fpm \
    php7.0-mysql \
    php7.0-gd \
    php7.0-imagick \
    php7.0-dev \
    php7.0-curl \
    php7.0-opcache \
    php7.0-cli \
    php7.0-sqlite \
    php7.0-intl \
    php7.0-tidy \
    php7.0-imap \
    php7.0-json \
    php7.0-pspell \
    php7.0-recode \
    php7.0-common \
    php7.0-sybase \
    php7.0-sqlite3 \
    php7.0-bz2 \
    php7.0-common \
    php7.0-memcached \
    php7.0-redis \
    php7.0-xml \
    php7.0-shmop \
    php7.0-mbstring \
    php7.0-zip \
    php7.0-soap \
    php7.0-xml \
    php-xdebug \
    && phpenmod xdebug

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
    jakub-onderka/php-parallel-lint \
    drupal/coder \
    drush/drush \
    wp-cli/wp-cli \
    --no-progress --no-interaction \
    && composer global require dealerdirect/phpcodesniffer-composer-installer --no-progress --no-interaction
