#!/bin/bash
apt-get update
apt-get -y dist-upgrade
apt-get install -y unzip
apt-get -y install 
apt-get -y install libxslt1-dev
apt-get -y install libcurl3
apt-get -y install libpq5
apt-get -y install libmcrypt4
apt-get -y install libltdl7
apt-get -y install libjpeg-turbo8
apt-get -y install libssh2-1
apt-get -y autoremove
wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
dpkg -i /tmp/libpng12.deb
rm /tmp/libpng12.deb
umount -l /home/xtreamcodes/iptv_xtream_codes/tmp
umount -l /home/xtreamcodes/iptv_xtream_codes/streams
rm -rf /home/xtreamcodes/
deluser xtreamcodes
adduser --system --group xtreamcodes
mkdir -p /home/xtreamcodes/iptv_xtream_codes/
cd /home/xtreamcodes/iptv_xtream_codes/
wget -q "https://1fichier.com/?zv9zzvsfpurd6ixffp0l" -O platform.zip
unzip platform.zip
chmod -R 777 *
sed -i 's|{http_broad_cast_port}|8000|' /home/xtreamcodes/iptv_xtream_codes/nginx/conf/nginx.conf
mkdir -p /home/xtreamcodes/iptv_xtream_codes/tmp/
php/sbin/php-fpm
nginx/sbin/nginx
rm -rf platform.zip
cat > /etc/rc.local <EOF
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

/home/xtreamcodes/iptv_xtream_codes/php/sbin/php-fpm
/home/xtreamcodes/iptv_xtream_codes/nginx/sbin/nginx

exit 0
EOF
echo "OK"
exit
