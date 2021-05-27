set -ex

echo "Reload php-fpm"
sudo service php-fpm reload
echo "Reload nginx"
sudo service nginx restart

echo "Done"
