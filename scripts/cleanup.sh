set +ex
MAGE_ROOT="/var/www/html/magento-deploy"

echo "Force code cleanup before AWS Deploy process"
rm -rf ${MAGE_ROOT}/*
