set -ex
EFS_ROOT="/mnt/efs"
MAGE_ROOT="/var/www/html/magento-deploy"

echo "Fix etc and media permission"
find "${MAGE_ROOT}/pub/media" "${MAGE_ROOT}/app/etc" -type f -exec chmod 664 {} \;
find "${MAGE_ROOT}/pub/media" "${MAGE_ROOT}/app/etc" -type d -exec chmod 775 {} \;
find "${MAGE_ROOT}/pub/media" "${MAGE_ROOT}/app/etc" -type f -exec chmod g+w {} \;
find "${MAGE_ROOT}/pub/media" "${MAGE_ROOT}/app/etc" -type d -exec chmod g+ws {} \;
chown -R magento:magento "${MAGE_ROOT}/app/etc"
chown -R magento:magento "${MAGE_ROOT}/pub/media"


echo "Renew etc"

if [[ ! -d "${EFS_ROOT}/etc/" ]]; then
    mkdir  "${EFS_ROOT}/etc/"
    chown -R magento:magento "${EFS_ROOT}/etc/"
fi

yes | cp -rf ${MAGE_ROOT}/app/etc/* "${EFS_ROOT}/etc/"

echo "Renew media"
if [[ ! -d "${EFS_ROOT}/media/" ]]; then
    mkdir  "${EFS_ROOT}/media/"
    chown -R magento:magento "${EFS_ROOT}/media/"
fi

yes | cp -rf ${MAGE_ROOT}/pub/media/* "${EFS_ROOT}/media/"
