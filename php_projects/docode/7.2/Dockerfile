FROM ubuntu:latest
ENV OS_LOCALE="en_US.UTF-8"
RUN apt-get update && apt-get install -y locales && locale-gen ${OS_LOCALE}
ENV LANG=${OS_LOCALE} \
    LANGUAGE=${OS_LOCALE} \
    LC_ALL=${OS_LOCALE} \
    DEBIAN_FRONTEND=noninteractive
RUN	\
	BUILD_DEPS='software-properties-common' \
    && dpkg-reconfigure locales \
	&& apt-get install --no-install-recommends -y $BUILD_DEPS \
	&& add-apt-repository -y ppa:ondrej/php \
	&& add-apt-repository -y ppa:ondrej/apache2 \
	&& apt-get update \
    && apt-get install -y curl apache2 libapache2-mod-php7.2 php7.2-cli php7.2-readline  php7.2-dev libmcrypt-dev php7.2-mbstring php7.2-zip php7.2-intl php7.2-xml php7.2-json php7.2-curl php7.2-gd php7.2-pgsql php7.2-mysql php-pear \
	apt install mongodb-clients \
    # Apache settings
    && a2enmod rewrite php7.2 \
	# Install composer
	&& curl -sS https://getcomposer.org/installer | php -- --version=1.8.4 --install-dir=/usr/local/bin --filename=composer \
	# Cleaning
	mysql-client \
	vim \
	&& apt-get purge -y --auto-remove $BUILD_DEPS \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* \
	# Forward request and error logs to docker log collector
	&& ln -sf /dev/stdout /var/log/apache2/access.log \
	&& ln -sf /dev/stderr /var/log/apache2/error.log 
# By default, simply start apache.
#RUN  pecl channel-update pecl.php.net \
RUN     pecl install mcrypt-1.0.1
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

