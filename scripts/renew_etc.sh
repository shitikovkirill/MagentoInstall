set -ex
EFS_ROOT="/mnt/efs"
MAGE_ROOT="/var/www/html/magento"

echo "Renew etc"
yes | cp -rf ${MAGE_ROOT}/app/etc/* "${EFS_ROOT}/etc/"
