set -ex

echo "Reload nginx"
sudo service nginx reload
echo "Reload php-fpm"
sudo service php-fpm reload

echo "Done"
