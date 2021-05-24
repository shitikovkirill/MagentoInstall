set +ex
MAGE_ROOT="/var/www/html/magento"

echo "Force code cleanup before AWS Deploy process"
rm -rf ${MAGE_ROOT}/*
