env
MAGE_ROOT="/var/www/html/magento"

echo "Fix permission"
chmod -R 777 $MAGE_ROOT

echo "Restart nginx"
sudo service nginx restart

if [ ! -f "${MAGE_ROOT}/app/etc" ]; then
    echo "Add link from efs to magento folder"
    ln -s /mnt/efs/etc/ /var/www/html/magento/app/
fi
