set -ex
MAGE_ROOT="/var/www/html/magento"
EFS_ROOT="/mnt/efs"

echo "Create ${EFS_ROOT}/etc/ folder"
mkdir -p "${EFS_ROOT}/etc/"
# echo "Renew etc"
# yes | cp -rf "${MAGE_ROOT}/app/etc/*" "${EFS_ROOT}/etc/"
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

echo "Done"
