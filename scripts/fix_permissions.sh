set -ex
MAGE_ROOT="/var/www/html/magento"

echo "Fix permission"
find "${MAGE_ROOT}" -type f -exec chmod 664 {} \;
find "${MAGE_ROOT}" -type d -exec chmod 775 {} \;
find "${MAGE_ROOT}/var" "${MAGE_ROOT}/pub/static" "${MAGE_ROOT}/pub/media" "${MAGE_ROOT}app/etc" -type f -exec chmod g+w {} \;
find "${MAGE_ROOT}/var" "${MAGE_ROOT}/pub/static" "${MAGE_ROOT}/pub/media" "${MAGE_ROOT}app/etc" -type d -exec chmod g+ws {} \;
find "${MAGE_ROOT}/var" -type d -exec chmod 777 {} \;
chmod u+x "${MAGE_ROOT}/bin/magento"
chown -R magento:magento "${MAGE_ROOT}"
chmod -R g+w "${MAGE_ROOT}/var/"
chmod -R g+w "${MAGE_ROOT}/pub/media/"
echo "Done"
