env
MAGE_ROOT="/var/www/html/magento"

echo "Fix permission"
chmod -R 777 $MAGE_ROOT

echo "Restart nginx"
sudo service nginx restart

rm -rf "${MAGE_ROOT}/app/etc"
if [ ! -f "${MAGE_ROOT}/app/etc" ]; then
    echo "Add etc link from efs to ${MAGE_ROOT}"
    ln -s /mnt/efs/etc/ "${MAGE_ROOT}/app/"
fi
