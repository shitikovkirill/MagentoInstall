set -ex
MAGE_ROOT="/var/www/html/magento"
EFS_ROOT="/mnt/efs"

echo "Restart nginx"
sudo service nginx restart

echo "Create ${EFS_ROOT}/etc/ folder"
mkdir -p "${EFS_ROOT}/etc/"
echo "Renew etc"
yes | cp -rf "${MAGE_ROOT}/app/etc/*" "${EFS_ROOT}/etc/"
rm -rf "${MAGE_ROOT}/app/etc"
if [ ! -f "${MAGE_ROOT}/app/etc" ]; then
    echo "Add etc link from efs to ${MAGE_ROOT}"
    ln -s "${EFS_ROOT}/etc/" "${MAGE_ROOT}/app/"
fi

echo "Create ${EFS_ROOT}/media/ folder"
mkdir -p "${EFS_ROOT}/media/"
echo "Delete ${MAGE_ROOT}/pub/media/ folder"
rm -rf "${MAGE_ROOT}/pub/media/"
if [ ! -f "${MAGE_ROOT}/pub/media/" ]; then
    echo "Add etc link from efs to ${MAGE_ROOT}"
    ln -s "${EFS_ROOT}/media/" "${MAGE_ROOT}/pub/"
fi

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

php "${MAGE_ROOT}/bin/magento" setup:upgrade
php "${MAGE_ROOT}/bin/magento" setup:di:compile

echo "Done"
