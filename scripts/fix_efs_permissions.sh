set -ex
EFS_ROOT="/mnt/efs"

echo "Fix efs permission"
find "${EFS_ROOT}" -type f -exec chmod 664 {} \;
find "${EFS_ROOT}" -type d -exec chmod 775 {} \;
chown -R magento:magento "${EFS_ROOT}"
chmod -R g+w "${EFS_ROOT}/media/"

echo "Done"
