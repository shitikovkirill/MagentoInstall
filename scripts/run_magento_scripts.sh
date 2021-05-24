set -ex
MAGE_ROOT="/var/www/html/magento"

php ${MAGE_ROOT}/bin/magento setup:upgrade
php ${MAGE_ROOT}/bin/magento setup:di:compile

echo "Done"
