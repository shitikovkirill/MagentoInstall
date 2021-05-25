set -ex
MAGE_ROOT="/var/www/html/magento-deploy"

php ${MAGE_ROOT}/bin/magento setup:upgrade --keep-generated
# php ${MAGE_ROOT}/bin/magento setup:di:compile
# php ${MAGE_ROOT}/bin/magento setup:static-content:deploy

echo "Done"
