set -ex
MAGE_ROOT="/var/www/html/magento-deploy"
MAGE_PROD="/var/www/html/magento"
MAGE_OLD="/var/www/html/magento-old"

rm -rf $MAGE_OLD
mv $MAGE_PROD $MAGE_OLD
mv $MAGE_ROOT $MAGE_PROD
