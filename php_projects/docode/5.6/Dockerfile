FROM ubuntu:latest
ENV OS_LOCALE="en_US.UTF-8"
RUN apt-get update && apt-get install -y locales && locale-gen ${OS_LOCALE}
ENV LANG=${OS_LOCALE} \
    LANGUAGE=${OS_LOCALE} \
    LC_ALL=${OS_LOCALE} \
    DEBIAN_FRONTEND=noninteractive
###########Install dependencies###########
RUN apt-get update \
    && apt install -y gcc \
                git \
  && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        software-properties-common 
RUN LC_ALL=C.UTF-8 apt-add-repository -y ppa:ondrej/php && apt-get update -y \
	&& add-apt-repository -y ppa:ondrej/php \
	&& apt-get update \
    && apt-get install -y curl libapache2-mod-php5.6 php5.6-cli php5.6-readline php5.6-mbstring php5.6-intl php5.6-zip php5.6-xml php5.6-json php5.6-curl php5.6-mcrypt php5.6-gd php5.6-pgsql php5.6-mysql php-pear \
    # Apache settings
    && a2enmod rewrite php5.6 \
    # PHP settings
	&& phpenmod mcrypt \
	# Install composer
	&& curl -sS https://getcomposer.org/installer | php -- --version=1.6.4 --install-dir=/usr/local/bin --filename=composer \
	# Cleaning
	&& apt-get purge -y --auto-remove $BUILD_DEPS \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* 
	# Forward request and error logs to docker log collector
#COPY ./configs/apache2.conf ${APACHE_CONF_DIR}/apache2.conf
#COPY ./configs/app.conf ${APACHE_CONF_DIR}/sites-enabled/app.conf
#COPY ./configs/php.ini  ${PHP_CONF_DIR}/apache2/conf.d/custom.ini

#WORKDIR /var/www/app/

#EXPOSE 80 443

# By default, simply start apache.
#CMD ["/sbin/entrypoint.sh"]
