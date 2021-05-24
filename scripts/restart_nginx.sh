set -ex
MAGE_ROOT="/var/www/html/magento"

echo "Restart nginx"
sudo service nginx restart

echo "Done"
