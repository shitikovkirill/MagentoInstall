set -ex

php ./bin/magento setup:upgrade
php ./bin/magento setup:di:compile

echo "Done"
