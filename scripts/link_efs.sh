set -ex
MAGE_ROOT="/var/www/html/magento"
EFS_ROOT="/mnt/efs"

echo "Create ${EFS_ROOT}/etc/ folder"
mkdir -p "${EFS_ROOT}/etc/"
# echo "Renew etc"
# yes | cp -rf "${MAGE_ROOT}/app/etc/*" "${EFS_ROOT}/etc/"
if [[ ! -L ${MAGE_ROOT}/app/etc && -d ${MAGE_ROOT}/app/etc ]]; then
    echo "Delete ${MAGE_ROOT}/app/etc folder"
    rm -rf "${MAGE_ROOT}/app/etc"
    echo "Creating etc link"
    ln -s "${EFS_ROOT}/etc/" "${MAGE_ROOT}/app/"
fi

echo "Create ${EFS_ROOT}/media/ folder"
mkdir -p "${EFS_ROOT}/media/"

if [[ ! -L ${MAGE_ROOT}/pub/media/ && -d ${MAGE_ROOT}/pub/media/ ]]; then
    echo "Delete ${MAGE_ROOT}/pub/media/ folder"
    rm -rf "${MAGE_ROOT}/pub/media/"
    echo "Creating media link"
    ln -s "${EFS_ROOT}/media/" "${MAGE_ROOT}/pub/"
fi

echo "Done"
